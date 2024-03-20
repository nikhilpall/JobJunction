package com.nikhil.backend;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ValidationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");

        ValidationServerSide vs = new ValidationServerSide();

        if (!vs.isValidName(name)) {
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);

            RequestDispatcher rd2 = request.getRequestDispatcher("nameerror.jsp");
            rd2.include(request, response);

            RequestDispatcher rd3 = request.getRequestDispatcher("registerdiv.jsp");
            rd3.include(request, response);

            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        } 
        else if (!vs.isValidEmail(email)) {
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);

            RequestDispatcher rd2 = request.getRequestDispatcher("emailerror.jsp");
            rd2.include(request, response);

            RequestDispatcher rd3 = request.getRequestDispatcher("registerdiv.jsp");
            rd3.include(request, response);

            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        } 
        else if (!vs.isValidPassword(pass)) {
            RequestDispatcher rd1 = request.getRequestDispatcher("header.jsp");
            rd1.include(request, response);

            RequestDispatcher rd2 = request.getRequestDispatcher("passworderror.jsp");
            rd2.include(request, response);

            RequestDispatcher rd3 = request.getRequestDispatcher("registerdiv.jsp");
            rd3.include(request, response);

            RequestDispatcher rd4 = request.getRequestDispatcher("footer.jsp");
            rd4.include(request, response);
        } 
        else if (gender == null || gender.equals("")) {

        } 
        else if (city == null || city.equals("")) {

        } 
        else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }

}
