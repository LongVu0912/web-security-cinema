/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class CSPFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, 
                         FilterChain chain) throws IOException, ServletException {

        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setHeader("Content-Security-Policy", "base-uri 'self'; font-src 'self' https://fonts.gstatic.com; img-src 'self'; style-src 'self' 'nonce-2726c7f26c' http://localhost:* https://fonts.googleapis.com; script-src 'nonce-2726c7f26c' http://localhost:*; default-src 'self'; frame-ancestors 'self'; form-action 'self'");

        chain.doFilter(request, response);
    }
}
