
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
import java.sql.ResultSet;
import java.sql.SQLException;

public class SearchJobsPageServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String skills = req.getParameter("skills");
        String location = req.getParameter("location");
        String exp = req.getParameter("exp");
        
        Connection con = null;
        PreparedStatement ps;
        try{
            con = DbConnection.getConnection();
            if(location.isEmpty() && exp.isEmpty()){
                ps = con.prepareStatement("SELECT * FROM jobs WHERE job_title LIKE ? ORDER BY job_posted_on DESC");
                ps.setString(1, "%"+skills+"%");
            }
            else if(skills.isEmpty() && exp.isEmpty()){
                ps = con.prepareStatement("SELECT * FROM jobs WHERE location LIKE ? ORDER BY job_posted_on DESC");
                ps.setString(1, "%"+location+"%");
            }
            else if(skills.isEmpty() && location.isEmpty()){
                ps = con.prepareStatement("SELECT * FROM jobs WHERE experience LIKE ? ORDER BY job_posted_on DESC");
                ps.setString(1, "%"+exp+"%");
            }
            else if(skills.isEmpty()){
                ps = con.prepareStatement("SELECT * FROM jobs WHERE experience LIKE ? AND location LIKE ? ORDER BY job_posted_on DESC");
                ps.setString(1, "%"+exp+"%");
                ps.setString(2, "%"+location+"%");
            }
            else if(location.isEmpty()){
                ps = con.prepareStatement("SELECT * FROM jobs WHERE job_title LIKE ? AND experience LIKE ? ORDER BY job_posted_on DESC");
                ps.setString(1, "%"+skills+"%");
                ps.setString(2, "%"+exp+"%");
            }
            else if(exp.isEmpty()){
                ps = con.prepareStatement("SELECT * FROM jobs WHERE job_title LIKE ? AND location LIKE ? ORDER BY job_posted_on DESC");
                ps.setString(1, "%"+skills+"%");
                ps.setString(2, "%"+location+"%");
            }
            else{
                ps = con.prepareStatement("SELECT * FROM jobs WHERE job_title LIKE ? AND location LIKE ? AND experience LIKE ? ORDER BY job_posted_on DESC");
                ps.setString(1, "%"+skills+"%");
                ps.setString(2, "%"+location+"%");
                ps.setString(3, "%"+exp+"%");
            }
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                out.print("<tr>\n" +
"                                                <td><b>"+rs.getString("job_title")+"</b></td>\n" +
"                                                <td>"+rs.getString("job_posted_on")+"</td>\n" +
"                                                <td>"+rs.getString("location")+"</td>\n" +
"                                                <td>"+rs.getString("experience")+"</td>\n" +
"                                                <td style=\"text-align: center;\"><a href=\"apply_job.jsp?job_id="+rs.getString("id")+"\" class=\"btn btn-primary\">View Job</a></td>\n" +
"                                            </tr>");
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
