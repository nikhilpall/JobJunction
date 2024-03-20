
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

public class AddExperienceDetails extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        String email =(String) session.getAttribute("email_id");
        String name = (String) session.getAttribute("full_name");
        
        String company = req.getParameter("company");
        String role = req.getParameter("role");
        String location = req.getParameter("location");
        String year = req.getParameter("year");
        String job_desc = req.getParameter("job_desc");
        
        Connection con = null;
        try{
            con = DbConnection.getConnection();
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("insert into experience(name,email,company,role,location,year,description) values(?,?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, company);
            ps.setString(4, role);
            ps.setString(5, location);
            ps.setString(6, year);
            ps.setString(7, job_desc);
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                out.print("not updated");
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
            catch(SQLException ee){
                out.print(ee);
            }
        }
    }
    
}
