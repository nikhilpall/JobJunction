
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

public class AddJobToDatabase extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String job_title = req.getParameter("job_title");
        String job_posted_on = req.getParameter("job_posted_on");
        String job_description = req.getParameter("job_description");
        String company_name = req.getParameter("company_name");
        String job_role = req.getParameter("job_role");
        String qualification = req.getParameter("qualification");
        String branch = req.getParameter("branch");
        String batch = req.getParameter("batch");
        String salary = req.getParameter("salary");
        String experience = req.getParameter("experience");
        String location = req.getParameter("location");
        String responsibilities = req.getParameter("responsibilities");
        String selection_process = req.getParameter("selection_process");
        String about_company = req.getParameter("about_company");
        String apply_link = req.getParameter("apply_link");
        
        Connection con = null;
        try{
            con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into jobs(job_title,job_posted_on,job_description,company_name,job_role,qualifications,branch,batch,salary,experience,location,responsibilities,selection_process,about_company,apply_link) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, job_title);
            ps.setString(2, job_posted_on);
            ps.setString(3, job_description);
            ps.setString(4, company_name);
            ps.setString(5, job_role);
            ps.setString(6, qualification);
            ps.setString(7, branch);
            ps.setString(8, batch);
            ps.setString(9, salary);
            ps.setString(10, experience);
            ps.setString(11, location);
            ps.setString(12, responsibilities);
            ps.setString(13, selection_process);
            ps.setString(14, about_company);
            ps.setString(15, apply_link);
            
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                resp.sendRedirect("mfjl1rt1djid3l32va2bkfzklvx3p84czbs9pafrr15dw7ka6ery6g0ed7ey9use9rlq27jbwlskqmqtt4du38ucnwro4gqigtzqr2yx4lphrjegeoe6ss10wqt94hsfqsjbnzv0t2u68g67qfanic.jsp");
            }
            else{
                out.print("error occured");
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
        
        
        
//        out.print(job_title + "<br><br>");
//        out.print(job_posted_on + "<br><br>");
//        out.print(job_description + "<br><br>");
//        out.print(company_name + "<br><br>");
//        out.print(job_role + "<br><br>");
//        out.print(qualification + "<br><br>");
//        out.print(branch + "<br><br>");
//        out.print(batch + "<br><br>");
//        out.print(salary + "<br><br>");
//        out.print(experience + "<br><br>");
//        out.print(location + "<br><br>");
//        out.print(responsibilities + "<br><br>");
//        out.print(selection_process + "<br><br>");
//        out.print(about_company + "<br><br>");
    }
    
}
