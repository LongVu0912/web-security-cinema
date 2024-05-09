package config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class SecurityFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;

        // ClickJacking Protection
        response.setHeader("X-Frame-Options", "SAMEORIGIN");

        // ContentType Protection
        response.setHeader("X-Content-Type-Options", "nosniff");

        // CSP
        response.setHeader("Content-Security-Policy",
                "base-uri 'self'; font-src 'self' https://fonts.gstatic.com; img-src 'self'; style-src 'self' 'nonce-2726c7f26c' http://localhost:* https://fonts.googleapis.com; script-src 'nonce-2726c7f26c' http://localhost:*; default-src 'self'; frame-ancestors 'self'; form-action 'self'");

        chain.doFilter(req, response);
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void destroy() {
    }
}