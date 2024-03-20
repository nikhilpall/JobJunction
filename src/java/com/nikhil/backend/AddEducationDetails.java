
package com.nikhil.backend;

import com.nikhil.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddEducationDetails extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String email =(String) session.getAttribute("email_id");
        String name = (String) session.getAttribute("full_name");
        
        String user_school_college = req.getParameter("user_school_college");
        String user_education_type = req.getParameter("user_education_type");
        String user_field = req.getParameter("user_field");
        String user_year_span = req.getParameter("user_year_span");
        String user_grade = req.getParameter("user_grade");
        String user_desc = req.getParameter("user_desc");
        
        Connection con = null;
        try{
            con = DbConnection.getConnection();
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("insert into education(name,email,school_college,education_type,field_of_study,year,grade,description) values(?,?,?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, user_school_college);
            ps.setString(4, user_education_type);
            ps.setString(5, user_field);
            ps.setString(6, user_year_span);
            ps.setString(7, user_grade);
            ps.setString(8, user_desc);
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                resp.sendRedirect("add_education.jsp");
            }
        }
        catch(SQLException e){
            try{
                if(con!=null){
                   con.rollback(); 
                }
            }
            catch(SQLException ee){
                out.print(ee);
            }
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
