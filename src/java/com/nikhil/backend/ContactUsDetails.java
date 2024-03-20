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

public class ContactUsDetails extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String message = req.getParameter("message");

        HttpSession session = req.getSession();
        String session_email = (String) session.getAttribute("email_id");

        Connection con = null;
        try {
            con = DbConnection.getConnection();
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("insert into contact(first_name,last_name,email,phone,address,message) values(?,?,?,?,?,?)");
            ps.setString(1, first_name);
            ps.setString(2, last_name);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, message);

            int rowCount = ps.executeUpdate();
            if (rowCount > 0) {
                con.commit();
                
                SendConfirmationMail.senConfirmationMail(email);

                
                RequestDispatcher rd2 = req.getRequestDispatcher("success_page.jsp");
                rd2.include(req, resp);
                RequestDispatcher rd4 = req.getRequestDispatcher("contact_us.jsp");
                rd4.include(req, resp);
            } else {
                con.rollback();

                RequestDispatcher rd1;
                if (session_email == null) {
                    rd1 = req.getRequestDispatcher("header.jsp");
                    rd1.include(req, resp);
                } else {
                    rd1 = req.getRequestDispatcher("header.jsp");
                    rd1.include(req, resp);
                }
                RequestDispatcher rd2 = req.getRequestDispatcher("error.jsp");
                rd2.include(req, resp);
                RequestDispatcher rd4 = req.getRequestDispatcher("contact_us_div.jsp");
                rd4.include(req, resp);
                RequestDispatcher rd3 = req.getRequestDispatcher("footer.jsp");
                rd3.include(req, resp);
            }
        } catch (SQLException e) {
            RequestDispatcher rd1;
            if (session_email == null) {
                rd1 = req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
            } else {
                rd1 = req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
            }
            RequestDispatcher rd2 = req.getRequestDispatcher("error.jsp");
            rd2.include(req, resp);
            RequestDispatcher rd4 = req.getRequestDispatcher("contact_us_div.jsp");
                rd4.include(req, resp);
            RequestDispatcher rd3 = req.getRequestDispatcher("footer.jsp");
            rd3.include(req, resp);
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
