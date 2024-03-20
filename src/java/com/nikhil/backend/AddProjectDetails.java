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
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class AddProjectDetails extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email_id");

        String project_title = req.getParameter("project_title");
        String project_about = req.getParameter("project_about");
        String project_start_date = req.getParameter("project_start_date");
        String project_end_date = req.getParameter("project_end_date");

        Connection con = null;
        try {
            con = DbConnection.getConnection();
            con.setAutoCommit(false);
            PreparedStatement ps1 = con.prepareStatement("insert into users_projects(email,title,about,start_date,end_date) values(?,?,?,?,?)");
            ps1.setString(1, email);
            ps1.setString(2, project_title);
            ps1.setString(3, project_about);
            ps1.setString(4, project_start_date);
            ps1.setString(5, project_end_date);
            int rowCount1 = ps1.executeUpdate();
            if (rowCount1 > 0) {
                con.commit();
                resp.sendRedirect("profile.jsp");
            } else {
                con.rollback();

                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("add_project.jsp");
                rd2.include(req, resp);
            }
        } 
        catch (SQLException e) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException ee) {
                out.print(ee);
            }
            out.print(e);
        } 
        finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ee) {
                out.print(ee);
            }
        }
    }

}
