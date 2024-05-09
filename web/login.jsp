<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
       String root=request.getContextPath();

       // delete ".jsp"
       String URI=request.getRequestURI();
       URI=URI.substring(0, URI.length() - 4);

       String csrfToken = (String) session.getAttribute("csrfToken");
       %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link nonce="2726c7f26c" rel="icon" href="<%=root%>/assets/images/logo.png" type="image/gif" sizes="16x16">
        <title>Login</title>
        <script nonce="2726c7f26c" src="<%=root%>/tailwind/tailwind.js"></script>
        <link nonce="2726c7f26c" href="<%=root%>/assets/css/aos.css" rel="stylesheet">
      </head>

      <body>
        <!-- component header -->
        <jsp:include page="./Component/header.jsp">
          <jsp:param name="activeTab" value="home" />
        </jsp:include>

        <div class="flex bg-[#282828]">
          <img src="<%=root%>/assets/images/batman.webp" alt="Your GIF" class="mr-auto w-7/12 h-7/12"
               data-aos="fade-right" data-aos-delay="100">
          <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0 w-2/3"
               data-aos="fade-left" data-aos-delay="100">
            <a class="flex items-center mb-6 text-2xl font-semibold text-white">
              <img class="w-8 h-8 mr-2" src="<%=root%>/assets/images/logo.png"
                   alt="logo">
              NTV CINEMA
            </a>
            <div
                 class="w-full bg-white rounded-lg shadow md:mt-0 sm:max-w-md xl:p-0">
              <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1
                    class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl">
                  Sign in to your account
                </h1>

                <!-- if type incorrect email recover password -->
                <c:if test="${state == 'emailNotFound'}">
                  <div class="flex items-center p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50" role="alert">
                    <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                      <path
                            d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                    </svg>
                    <span class="sr-only">Info</span>
                    <div>
                      <span class="font-medium">Your email is incorrect!.</span>
                    </div>
                  </div>
                </c:if>
                <!--if type correct email recover password-->
                <c:if test="${state == 'emailFound'}">
                  <div class="flex items-center p-4 mb-4 text-sm text-green-800 rounded-lg bg-green-50" role="alert">
                    <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                      <path
                            d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                    </svg>
                    <span class="sr-only">Info</span>
                    <div>
                      <span class="font-medium">Your password has been sent to your email: ${emailForgot} Please check
                        your inbox and follow the instructions to recover your password. </span>
                    </div>
                  </div>
                </c:if>
                <!--if type incorrect input-->
                <c:if test="${state == 'fail'}">
                  <div class="flex items-center p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50" role="alert">
                    <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                      <path
                            d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                    </svg>
                    <span class="sr-only">Info</span>
                    <div>
                      <c:choose>
                        <c:when test="${tryAgain != null}">
                          <span class="font-medium">Wrong password. You can attempt ${tryAgain} more times.</span>
                        </c:when>
                        <c:otherwise>
                          <span class="font-medium">Incorrect email or password, please try again.</span>
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div>
                </c:if>

                <c:if test="${state == 'existCustomer'}">
                  <div class="flex items-center p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50" role="alert">
                    <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                      <path
                            d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                    </svg>
                    <span class="sr-only">Info</span>
                    <div>
                      <span class="font-medium">Customer exist, please use another email or username.</span>
                    </div>
                  </div>
                </c:if>

                <!--if register success-->
                <c:if test="${state == 'register_success'}">
                  <div class="flex items-center p-4 mb-4 text-sm text-green-800 rounded-lg bg-green-50" role="alert">
                    <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                         fill="currentColor" viewBox="0 0 20 20">
                      <path
                            d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                    </svg>
                    <div>
                      <span class="font-medium">Register success, please log in to continue</span>
                    </div>
                  </div>
                </c:if>
                
                <!--if too long char-->
                <c:if test="${state == 'TooLong'}">
                  <div class="flex items-center p-4 mb-4 text-sm text-red-800 rounded-lg bg-green-50" role="alert">
                    <svg class="flex-shrink-0 inline w-4 h-4 me-3" aria-hidden="true"
                         xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                      <path
                            d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
                    </svg>
                    <span class="sr-only">Info</span>
                    <div>
                      <span class="font-medium">Please keep all input fields under 30 characters</span>
                    </div>
                  </div>
                </c:if>
                
                  <form class="space-y-4 md:space-y-6" method="post" action="<%=root%>/login">
                    <input type="hidden" name="csrfToken" value="<%=csrfToken%>" />
                    <input type="hidden" name="action" value="login" />

                    <div>
                      <label for="username"
                             class="block mb-2 text-sm font-medium text-gray-900">Your username</label>
                      <input type="text" name="username" id="username"
                             class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg 
                       focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                             required>
                    </div>
                    <div>
                      <label for="password"
                             class="block mb-2 text-sm font-medium text-gray-900">Password</label>
                      <input type="password" name="password" id="password"
                             class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg 
                       focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                             required>
                    </div>
                    <div class="flex items-center justify-between">
                      <div class="flex items-start">
                        <div class="flex items-center h-5">
                          <input id="remember" aria-describedby="remember" type="checkbox" name="remember"
                                 class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300">
                        </div>
                        <div class="ml-3 text-sm">
                          <label for="remember" class="text-gray-500">Remember me</label>
                        </div>
                      </div>
                      <a class="text-sm font-medium text-primary-600 hover:cursor-pointer"
                         data-modal-target="forgot-password-modal" data-modal-toggle="forgot-password-modal">Forgot
                        password?</a>
                    </div>

                    <button type="submit"
                            class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 
                      focus:ring-blue-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 
                      lg:py-2.5 mr-2">Sign in</button>

                    <p class="text-sm font-light text-gray-500">
                      Don?t have an account yet? <a data-modal-target="default-modal"
                         data-modal-toggle="default-modal"
                         class="font-medium text-primary-600 hover:cursor-pointer">Sign
                        up</a>
                    </p>
                  </form>
              </div>
            </div>
          </div>
        </div>

        <!-- Main modal -->
        <div id="default-modal" tabindex="-1" aria-hidden="true"
             class="modal fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
          <div class="relative w-full max-w-md max-h-full">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow">
              <button type="button"
                      class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center"
                      data-modal-hide="default-modal">
                <svg class="w-3 h-3" class="close" data-dismiss="modal" aria-hidden="true"
                     xmlns="http://www.w3.org/2000/svg" fill="none"
                     viewBox="0 0 14 14">
                  <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                </svg>
                <span class="sr-only">Close modal</span>
              </button>
              <div class="px-6 py-6 lg:px-8">
                <h3 class="mb-4 text-xl font-medium text-gray-900">Sign up a new account</h3>
                <form class="space-y-6" method="post" action="<%=root%>/login">
                  <input type="hidden" name="csrfToken" value="<%=csrfToken%>" />
                  <input type="hidden" name="action" value="register" />

                  <div>
                    <label for="text"
                           class="block mb-2 text-sm font-medium text-gray-900">Full Name</label>
                    <input type="text" name="fullname"
                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           placeholder="Nguyen Van A" required>
                  </div>
                  <div>
                    <label for="text"
                           class="block mb-2 text-sm font-medium text-gray-900">User Name</label>
                    <input type="text" name="username"
                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           placeholder="nguyenvana" required>
                  </div>
                  <div>
                    <label for="password"
                           class="block mb-2 text-sm font-medium text-gray-900">Password</label>
                    <input type="password" name="password" placeholder="********"
                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           required>
                  </div>
                  <div>
                    <label for="email"
                           class="block mb-2 text-sm font-medium text-gray-900">Email</label>
                    <input type="email" name="email"
                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           placeholder="nguyenvana@gmail.com" required>
                  </div>
                  <div>
                    <label for="text"
                           class="block mb-2 text-sm font-medium text-gray-900">Phone
                      number</label>
                    <input type="text" name="phoneNumber" pattern="[0-9]{10}"
                           class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           placeholder="" required>
                  </div>

                  <button type="submit" href="/index.html"
                          class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Sign
                    up</button>
                </form>
              </div>
            </div>
          </div>
        </div>

        <!-- forgot modal -->
        <div id="forgot-password-modal" tabindex="-1" aria-hidden="true"
             class="modal hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
          <div class="relative p-4 w-full max-w-md max-h-full">
            <!-- Modal content -->
            <div class="relative bg-white rounded-lg shadow">
              <!-- Modal header -->
              <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t ">
                <h3 class="text-xl font-medium text-gray-900">
                  Forgot password
                </h3>
                <button type="button"
                        class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ml-auto inline-flex justify-center items-center"
                        data-modal-hide="forgot-password-modal">
                  <svg class="w-3 h-3" class="close" data-dismiss="modal" aria-hidden="true"
                       xmlns="http://www.w3.org/2000/svg" fill="none"
                       viewBox="0 0 14 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                  </svg>
                  <span class="sr-only">Close modal</span>
                </button>
              </div>
              <!-- Modal body -->
              <div class="p-4 md:p-5">
                <form class="space-y-4" method="post" action="<%=root%>/login">
                  <input type="hidden" name="csrfToken" value="<%=csrfToken%>" />
                  <div>
                    <label for="email-forgot" class="block mb-2 text-sm font-medium text-gray-900">Your email:</label>
                    <input type="text" name="emailForgot" id="email-forgot" class="bg-gray-50 border border-gray-300 
                     text-black text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 
                     block w-full p-2.5" placeholder="nguyenvana@gmail.com" required>
                  </div>
                  <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 
                  focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg 
                  text-sm px-5 py-2.5 text-center">Send password
                    <input type="hidden" name="action" value="recoverPassword">
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>

        <jsp:include page="./Component/footer.jsp">
          <jsp:param name="" value="" />
        </jsp:include>

        <script nonce="2726c7f26c" src="<%=root%>/tailwind/flowbite.min.js"></script>
        <script nonce="2726c7f26c" src="<%=root%>/assets/js/aos.js"></script>

        <script nonce="2726c7f26c">
          AOS.init();
        </script>
        </div>
      </body>

      </html>