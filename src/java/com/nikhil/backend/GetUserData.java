
package com.nikhil.backend;

import com.nikhil.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GetUserData extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doService(req, resp);
    }
    
    
    
    
    protected void doService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String email = req.getParameter("email");
        if(email==null){
            email =(String) req.getAttribute("email");
        }

        Connection con = null;
        try {
            con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from register where email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = req.getSession();
                int user_id = rs.getInt("id");

                session.setAttribute("user_database_id", user_id);

                // gettin values form database users 
                PreparedStatement ps7 = con.prepareStatement("select * from users where id=?");
                ps7.setInt(1, user_id);
                ResultSet rs7 = ps7.executeQuery();
                String full_name;
                String account_name;
                String u_gender;
                String u_city;
                String about;
                String field;
                String email_id;
                String dob;
                String mobile;
                String address;

                if (rs7.next()) {
                    full_name = rs7.getString("full_name");
                    account_name = rs7.getString("account_name");
                    u_gender = rs7.getString("gender");
                    u_city = rs7.getString("city");
                    about = rs7.getString("about");
                    field = rs7.getString("field");
                    email_id = rs7.getString("email");
                    dob = rs7.getString("dob");
                    mobile = rs7.getString("mobile");
                    address = rs7.getString("address");

                    session.setAttribute("full_name", full_name);
                    session.setAttribute("account_name", account_name);
                    session.setAttribute("u_gender", u_gender);
                    session.setAttribute("u_city", u_city);
                    session.setAttribute("about", about);
                    session.setAttribute("field", field);
                    session.setAttribute("email_id", email_id);
                    session.setAttribute("dob", dob);
                    session.setAttribute("mobile", mobile);
                    session.setAttribute("address", address);
                }
                
                // get values from profile_details
                PreparedStatement ps11 = con.prepareStatement("select * from profile_details where email=?");
                ps11.setString(1, email);
                ResultSet rs11 = ps11.executeQuery();
                String profile_url;
                if(rs11.next()){
                    profile_url = rs11.getString("profile_url");
                    
                    session.setAttribute("profile_url", profile_url);
                }
                
                // get values from users_resume
                PreparedStatement ps12 = con.prepareStatement("select * from users_resume where email=?");
                ps12.setString(1, email);
                ResultSet rs12 = ps12.executeQuery();
                String resume_url;
                if(rs12.next()){
                    resume_url = rs12.getString("resume_url");
                    
                    session.setAttribute("resume_url", resume_url);
                }
                
                resp.sendRedirect("profile.jsp");
            }
            con.close();
        } 
        catch (SQLException e) {
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
