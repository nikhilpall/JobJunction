
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

public class EditEducationDetails extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String user_school_college = req.getParameter("user_school_college");
        String user_education_type = req.getParameter("user_education_type");
        String user_field = req.getParameter("user_field");
        String user_year_span = req.getParameter("user_year_span");
        String user_grade = req.getParameter("user_grade");
        String user_desc = req.getParameter("user_desc");
        String edu_id = req.getParameter("edu_id");
        
        Connection con = null;
        try{
            con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update education set school_college=?, education_type=?, field_of_study=?, year=?, grade=?, description=? where id=?");
            ps.setString(1, user_school_college);
            ps.setString(2, user_education_type);
            ps.setString(3, user_field);
            ps.setString(4, user_year_span);
            ps.setString(5, user_grade);
            ps.setString(6, user_desc);
            ps.setString(7, edu_id);
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                resp.sendRedirect("profile.jsp");
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
