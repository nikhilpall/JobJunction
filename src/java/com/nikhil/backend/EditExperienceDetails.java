
package com.nikhil.backend;

import com.nikhil.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditExperienceDetails extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String company = req.getParameter("company");
        String role = req.getParameter("role");
        String location = req.getParameter("location");
        String year = req.getParameter("year");
        String job_desc = req.getParameter("job_desc");
        String exp_id = req.getParameter("exp_id");
        
        Connection con = null;
        try{
            con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("update experience set company=?, role=?, location=?, year=?, description=? where id=?");
            ps.setString(1, company);
            ps.setString(2, role);
            ps.setString(3, location);
            ps.setString(4, year);
            ps.setString(5, job_desc);
            ps.setString(6, exp_id);
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                resp.sendRedirect("profile.jsp");
            }
        }
        catch(SQLException e){
            out.println(e);
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
