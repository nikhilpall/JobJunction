
package com.nikhil.backend;

import com.nikhil.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

public class AdminLogin extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email = req.getParameter("admin_email");
        String pass = req.getParameter("admin_pass");
        
        Connection con = null;
        try{
            con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from admin where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                
                resp.sendRedirect("mfjl1rt1djid3l32va2bkfzklvx3p84czbs9pafrr15dw7ka6ery6g0ed7ey9use9rlq27jbwlskqmqtt4du38ucnwro4gqigtzqr2yx4lphrjegeoe6ss10wqt94hsfqsjbnzv0t2u68g67qfanic.jsp");
            }
            else{
                resp.sendRedirect("login.jsp");
            }
        }
        catch(SQLException e){
            out.print(e);
        }
        finally{
            try{
                if(con!=null){
                    con.close();
                }
            }
            catch(SQLException e){
                out.print(e);
            }
        }
    }
    
}
