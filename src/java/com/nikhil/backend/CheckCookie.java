
package com.nikhil.backend;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckCookie extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = "";
        Cookie[] ck = req.getCookies();
        if(ck!=null){
            for(Cookie cookie : ck){
                if(cookie.getName().equals("cookie_email")){
                    email = cookie.getValue();
                    
                    req.setAttribute("email", email);
                    
                    RequestDispatcher rd = req.getRequestDispatcher("getuserdata");
                    rd.include(req, resp);
                }
            }
        }
        else{
            resp.sendRedirect("index.jsp");
        }
    }
    
}
