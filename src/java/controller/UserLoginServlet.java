package controller;

import business.Customer;
import business.Attemp;
import data.CustomerDB;
import data.MailUtilGmailDB;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserLoginServlet", urlPatterns = { "/login" })
public class UserLoginServlet extends HttpServlet {
    private static final int MAX_ATTEMPTS = 5;
    private Map<String, Attemp> attemps = new HashMap<String, Attemp>();

    protected void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        String url = "/login.jsp";
        request.setCharacterEncoding("UTF-8");

        // get value
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");

        if (fullname.length() > 30 || username.length() > 30 || password.length() > 30) {
            request.setAttribute("state", "TooLong");
            request.getRequestDispatcher(url).forward(request, response);
            return;
        }

        // set value to new customer object
        Customer customer = new Customer();
        customer.setBalance(0);
        customer.setEmail(email);
        customer.setFullname(fullname);
        customer.setPassword(password);
        customer.setPhoneNumber(phoneNumber);
        customer.setUsername(username);

        Customer checkEmail = CustomerDB.selectCustomerByEmail(email);
        Customer checkUsername = CustomerDB.selectCustomerByUsername(username);

        if (checkEmail != null || checkUsername != null) {
            request.setAttribute("state", "existCustomer");
            request.getRequestDispatcher(url).forward(request, response);
            return;
        }

        // insert to db
        CustomerDB.insert(customer);

        request.setAttribute("state", "register_success");
        request.getRequestDispatcher(url).forward(request, response);
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/login.jsp";

        // Check CSRF token
        String submittedToken = request.getParameter("csrfToken");
        String sessionToken = (String) request.getSession().getAttribute("csrfToken");

        if (sessionToken == null || !sessionToken.equals(submittedToken)) {
            // CSRF attack detected, reject the request
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF attack detected.");
            return;
        }

        // get value
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String ipAddress = request.getRemoteAddr();
        String code = request.getParameter("code");
        String attempKey = username + "-" + ipAddress;

        Attemp attemp = attemps.get(attempKey);

        if (username.length() > 30 || password.length() > 30) {
            request.setAttribute("state", "TooLong");
            request.getRequestDispatcher(url).forward(request, response);
            return;
        }

        if ("admin".equals(username) && "admin".equals(password)) {
            response.sendRedirect(request.getContextPath() + "/admin/movies");
            return;
        }

        // anti brute force
        if (attemp != null && attemp.getAttempsTimes() >= MAX_ATTEMPTS) {
            url = "/maxAttemp.jsp";
            request.setAttribute("ipAddress", ipAddress);
            request.setAttribute("username", username);
            request.getRequestDispatcher(url).forward(request, response);
            return;
        }

        // set value to new customer object
        Customer customer = CustomerDB.selectCustomer(username, password);

        Boolean isFirstLogin = attemp == null;

        if ((null != customer && isFirstLogin)
                || (null != customer && !isFirstLogin && code.equals(attemp.getCode()))) {

            // if login success --> find out
            // Store customer to the session
            HttpSession session = request.getSession();
            final Object lock = request.getSession().getId().intern();
            synchronized (lock) {
                session.setAttribute("customer", customer);
            }

            attemps.remove(attempKey);

            // Create cookie for customer if remember = 'on'
            if ("on".equals(remember)) {
                Cookie c = new Cookie("customerId", customer.getCustomerId());
                c.setMaxAge(60 * 60 * 24); // cookie expire in 1 day
                c.setPath(request.getContextPath());

                // Add these line
                c.setHttpOnly(true);
                response.addCookie(c);
            }

            response.sendRedirect(request.getContextPath() + "/");
        } else {
            // anti brute force
            request.setAttribute("state", "fail");

            // check if username is correct but password is fail
            Customer customerWithValidUsername = CustomerDB.selectCustomerByUsername(username);
            if (customerWithValidUsername != null) {

                // generate UUID
                String AuthCode = UUID.randomUUID().toString();
                Attemp checkAttemp = isFirstLogin ? new Attemp(1, username, ipAddress, AuthCode)
                        : new Attemp(attemp.getAttempsTimes() + 1, username, ipAddress, AuthCode);

                attemps.put(attempKey, checkAttemp);

                request.setAttribute("tryAgain", MAX_ATTEMPTS - attemps.get(attempKey).getAttempsTimes());

                if (checkAttemp.getAttempsTimes() == 3) {
                    request.setAttribute("sendCode", true);

                    String to = customerWithValidUsername.getEmail();
                    String subject = "Please check 2 factor authentication code for your NTV Cinema Account";
                    String body = "Hi " + customerWithValidUsername.getFullname() + ",\n\n"
                            + "You have requested login with 2 factor.\n\n"
                            + "Your username is " + customerWithValidUsername.getUsername() + ".\n\n"
                            + "Your authentication key is: " + AuthCode + "\n\n";
                    try {
                        MailUtilGmailDB.sendMail(to, subject, body);
                    } catch (jakarta.mail.MessagingException ex) {
                        Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null,
                                ex);
                    }
                }

            }

            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    protected void recoverPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/login.jsp";
        String emailForgot = request.getParameter("emailForgot");
        request.setAttribute("emailForgot", emailForgot);
        Customer customer = CustomerDB.selectCustomerByEmail(emailForgot);
        String newPassword = UUID.randomUUID().toString();
        if (customer == null) {
            request.setAttribute("state", "emailNotFound");
            request.getRequestDispatcher(url).forward(request, response);
            return;
        } else {
            request.setAttribute("state", "emailFound");
            customer.setPassword(newPassword);
            CustomerDB.update(customer);
            String to = emailForgot;
            String subject = "Password Recovery for Your NTV Cinema Account";
            String body = "Hi " + customer.getFullname() + ",\n\n"
                    + "You have requested to recover your password.\n\n"
                    + "Your username is " + customer.getUsername() + ".\n\n"
                    + "Your new password is: " + newPassword + "\n\n"
                    + "Please change this password after logging in for security purposes.\n\n";
            try {
                MailUtilGmailDB.sendMail(to, subject, body);
            } catch (jakarta.mail.MessagingException ex) {
                Logger.getLogger(UserLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String csrfToken = UUID.randomUUID().toString();
        request.getSession().setAttribute("csrfToken", csrfToken);
        try {
            String url = "/login.jsp";

            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        // Check CSRF token
        String submittedToken = request.getParameter("csrfToken");
        String sessionToken = (String) request.getSession().getAttribute("csrfToken");

        if (sessionToken == null || !sessionToken.equals(submittedToken)) {
            // CSRF attack detected, reject the request
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF attack detected.");
            return;
        }

        if (null != action) {
            switch (action) {
                case "register" -> {
                    try {
                        this.register(request, response);
                    } catch (MessagingException e) {
                        // Handle the exception here
                        e.printStackTrace();
                    }
                }
                case "login" -> {
                    this.login(request, response);
                }
                case "recoverPassword" -> {
                    this.recoverPassword(request, response);
                }
                default -> {
                }
            }
        }
    }
}
