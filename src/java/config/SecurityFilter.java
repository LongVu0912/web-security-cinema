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
        response.setHeader("Content-Security-Policy", "frame-ancestors 'self'");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");

        // ContentType Protection
        response.setHeader("X-Content-Type-Options", "nosniff");

        chain.doFilter(req, response);
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void destroy() {
    }
}