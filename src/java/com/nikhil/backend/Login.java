package com.nikhil.backend;

import com.nikhil.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        String remember_me = req.getParameter("remember_me");

        Connection con = null;
        try {
            con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from register where email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                if(remember_me==null){
                    remember_me = "";
                }
                if(remember_me.equals("checked")){
                    Cookie ck1 = new Cookie("cookie_email", email);
                    ck1.setMaxAge(60*60*24*365);
                    resp.addCookie(ck1);
                    
                    Cookie ck2 = new Cookie("cookie_status", "true");
                    ck2.setMaxAge(60*60*24*365);
                    resp.addCookie(ck2);
                }
                
                RequestDispatcher rd = req.getRequestDispatcher("getuserdata");
                rd.include(req, resp);
                
                
                resp.sendRedirect("profile.jsp");
            } 
            else {
                RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("loginerror.jsp");
                rd2.include(req, resp);

                RequestDispatcher rd3 = req.getRequestDispatcher("logindiv.jsp");
                rd3.include(req, resp);

                RequestDispatcher rd4 = req.getRequestDispatcher("footer.jsp");
                rd4.include(req, resp);
            }
            con.close();
        } 
        catch (SQLException e) {
            out.print(e);
        }
        finally{
            try{
                if(con!=null){
                    con.close();
                }
            }
            catch(SQLException ee){
                out.print(ee);
            }
        }
    }

}
