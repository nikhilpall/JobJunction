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

public class SearchJobsInIndexPage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String technology = req.getParameter("technology");
        String search_location = req.getParameter("location");
        
        out.print("<h3>Latest Jobs :</h3>");

        Connection con1 = null;
        PreparedStatement ps1;
        try {
            con1 = DbConnection.getConnection();

            if (search_location.isEmpty()) {
                ps1 = con1.prepareStatement("SELECT * FROM jobs WHERE job_title LIKE ? ORDER BY job_posted_on DESC LIMIT 5");
                ps1.setString(1, "%" + technology + "%");
            } else if (technology.isEmpty()) {
                ps1 = con1.prepareStatement("SELECT * FROM jobs WHERE location LIKE ? ORDER BY job_posted_on DESC LIMIT 5");
                ps1.setString(1, "%" + search_location + "%");
            } else {
                ps1 = con1.prepareStatement("select * from jobs where job_title LIKE ? AND location LIKE ? ORDER BY job_posted_on DESC LIMIT 5");
                ps1.setString(1, "%" + technology + "%");
                ps1.setString(2, "%" + search_location + "%");
            }
            ResultSet rs1 = ps1.executeQuery();
            String job_title;
            String job_posted_on;
            String company_name;
            String experience;
            String salary;
            String location;
            while (rs1.next()) {
                job_title = rs1.getString("job_title");
                job_posted_on = rs1.getString("job_posted_on");
                company_name = rs1.getString("company_name");
                experience = rs1.getString("experience");
                salary = rs1.getString("salary");
                location = rs1.getString("location");

                out.println("<div class=\"jobs-div mt-3\">\n"
                        + "                            <span style=\"font-size: 22px;\"><b>" + job_title + "</b></span><span style=\"color: gray;\"> (" + job_posted_on + ")</span><br>\n"
                        + "                            <span style=\"color: gray\"> Company : </span><span>" + company_name + "</span><br>\n"
                        + "                            <span style=\"color: gray\"> Experience : </span><span>" + experience + "</span><br>\n"
                        + "                            <span style=\"color: gray\"> Salary : </span><span>" + salary + "</span><br>\n"
                        + "                            <span style=\"color: gray\"> Location : </span><span>" + location + "</span><br>\n"
                        + "                                <span> <a href=\"apply_job.jsp?job_id="+rs1.getString("id")+"\">See full details</a></span>\n"
                        + "                            </div>");
            }
        } catch (SQLException e) {
            out.print(e);
        }
        finally{
            try{
                if(con1!=null){
                    con1.close();
                }
            }
            catch(SQLException e){
                out.print(e);
            }
        }
    }

}
