package com.nikhil.backend;

import com.nikhil.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        String session_email =(String) session.getAttribute("email_id");

        String full_name = req.getParameter("user_full_name");
        String account_name = req.getParameter("user_account_name");
        String gender = req.getParameter("user_gender");
        String city = req.getParameter("user_city");
        String about = req.getParameter("user_about");
        String field = req.getParameter("user_field");
        String email = req.getParameter("user_email");
        String dob = req.getParameter("user_dob");
        String mobile = req.getParameter("user_mobile");
        String address = req.getParameter("user_address");

        String website = req.getParameter("user_web_url");
        String github = req.getParameter("user_github");
        String linkdin = req.getParameter("user_linkdin");
        String twitter = req.getParameter("user_twitter");
        String insta = req.getParameter("user_insta");
        String facebook = req.getParameter("user_facebook");

        if (account_name.equals("")) {
            account_name = full_name;
        }
        if (about.equals("")) {
            about = "----------";
        }
        if (mobile.equals("")) {
            mobile = "----------";
        }
        if (address.equals("")) {
            address = "----------";
        }
        if (field.equals("")) {
            field = "----------";
        }
        if (dob.equals("")) {
            dob = "----/--/--";
        }

        if (website.equals("")) {
            website = "not available";
        }
        if (github.equals("")) {
            github = "not available";
        }
        if (linkdin.equals("")) {
            linkdin = "not available";
        }
        if (twitter.equals("")) {
            twitter = "not available";
        }
        if (insta.equals("")) {
            insta = "not available";
        }
        if (facebook.equals("")) {
            facebook = "not available";
        }

        Connection con = null;
        try {
            con = DbConnection.getConnection();
            con.setAutoCommit(false);

            // update values in database register
            PreparedStatement ps1 = con.prepareStatement("update register set name=?, email=?, gender=?, field=?, city=? where email=?");
            ps1.setString(1, full_name);
            ps1.setString(2, email);
            ps1.setString(3, gender);
            ps1.setString(4, field);
            ps1.setString(5, city);
            ps1.setString(6, session_email);
            int rowCount1 = ps1.executeUpdate();

            // update values in database users
            PreparedStatement ps2 = con.prepareStatement("update users set full_name=?, account_name=?, gender=?, city=?, about=?, field=?, email=?, dob=?, mobile=?, address=? where email=?");
            ps2.setString(1, full_name);
            ps2.setString(2, account_name);
            ps2.setString(3, gender);
            ps2.setString(4, city);
            ps2.setString(5, about);
            ps2.setString(6, field);
            ps2.setString(7, email);
            ps2.setString(8, dob);
            ps2.setString(9, mobile);
            ps2.setString(10, address);
            ps2.setString(11, session_email);
            int rowCount2 = ps2.executeUpdate();

            // update values in database user_social_details
            PreparedStatement ps5 = con.prepareStatement("update user_social_details set name=?, email=?, website=?, github=?, linkdin=?, twitter=?, instagram=?, facebook=? where email=?");
            ps5.setString(1, full_name);
            ps5.setString(2, email);
            ps5.setString(3, website);
            ps5.setString(4, github);
            ps5.setString(5, linkdin);
            ps5.setString(6, twitter);
            ps5.setString(7, insta);
            ps5.setString(8, facebook);
            ps5.setString(9, session_email);
            int rowCount5 = ps5.executeUpdate();
            
            // update values in database profile_details
            PreparedStatement ps8 = con.prepareStatement("update profile_details set email=? where email=?");
            ps8.setString(1, email);
            ps8.setString(2, session_email);
            int rowCount8 = ps8.executeUpdate();
            
            // update values in database users_resume
            PreparedStatement ps9 = con.prepareStatement("update users_resume set email=? where email=?");
            ps9.setString(1, email);
            ps9.setString(2, session_email);
            int rowCount9 = ps9.executeUpdate();

            if (rowCount1>0 && rowCount2>0 && rowCount5>0 && rowCount8>0 && rowCount9>0) {
                con.commit();
                out.print("register Data updated successfully");

                session.setAttribute("full_name", full_name);
                session.setAttribute("account_name", account_name);
                session.setAttribute("u_gender", gender);
                session.setAttribute("u_city", city);
                session.setAttribute("about", about);
                session.setAttribute("field", field);
                session.setAttribute("email_id", email);
                session.setAttribute("dob", dob);
                session.setAttribute("mobile", mobile);
                session.setAttribute("address", address);

                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
            }
        } 
        catch (Exception e) {
            try{
                if(con!=null){
                    con.rollback();
                }
            }
            catch(SQLException ee){
                out.print(ee);
            }
            out.println(e);
            e.printStackTrace();
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
