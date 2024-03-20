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
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        String gender = req.getParameter("gender");
        String[] fields = req.getParameterValues("fields");
        String city = req.getParameter("city");

        String selectde_fields = "";
        if (fields != null) {
            for (String s : fields) {
                selectde_fields = selectde_fields + "," + s;
            }
        }

        Connection con = null;
        try {
            // update into register
            con = DbConnection.getConnection();

            // checking email is present in database or not
            PreparedStatement ps11 = con.prepareStatement("select email from register where email=?");
            ps11.setString(1, email);
            ResultSet rs11 = ps11.executeQuery();
            if (rs11.next()) {
                RequestDispatcher rd1 = req.getRequestDispatcher("profileheader.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("email_exist.jsp");
                rd2.include(req, resp);

                RequestDispatcher rd3 = req.getRequestDispatcher("registerdiv.jsp");
                rd3.include(req, resp);

                RequestDispatcher rd4 = req.getRequestDispatcher("footer.jsp");
                rd4.include(req, resp);

            } else {
                con.setAutoCommit(false);
                PreparedStatement ps = con.prepareStatement("insert into register(name, email, password, gender, field, city) values(?, ?, ?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, pass);
                ps.setString(4, gender);
                ps.setString(5, selectde_fields);
                ps.setString(6, city);

                int rowCount = ps.executeUpdate();
                if (rowCount > 0) {
                    // get auto generated id from database
                    HttpSession session = req.getSession();
                    int id = 0;
                    PreparedStatement ps2 = con.prepareStatement("select id from register where name=?");
                    ps2.setString(1, name);
                    ResultSet rs = ps2.executeQuery();
                    if (rs.next()) {
                        id = rs.getInt("id");
                    }

                    session.setAttribute("user_database_id", id);

                    // set values into users
                    PreparedStatement ps3 = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?,?)");
                    ps3.setInt(1, id);
                    ps3.setString(2, name);
                    ps3.setString(3, name);
                    ps3.setString(4, gender);
                    ps3.setString(5, city);
                    ps3.setString(6, "not available");
                    ps3.setString(7, selectde_fields);
                    ps3.setString(8, email);
                    ps3.setString(9, "----------");
                    ps3.setString(10, "----------");
                    ps3.setString(11, "----------");
                    int rowCount2 = ps3.executeUpdate();

                    session.setAttribute("full_name", name);
                    session.setAttribute("account_name", name);
                    session.setAttribute("u_gender", gender);
                    session.setAttribute("u_city", city);
                    session.setAttribute("about", "not available");
                    session.setAttribute("field", selectde_fields);
                    session.setAttribute("email_id", email);
                    session.setAttribute("dob", "----------");
                    session.setAttribute("mobile", "----------");
                    session.setAttribute("address", "----------");

                    // set values into user_social_details
                    PreparedStatement ps6 = con.prepareStatement("insert into user_social_details(name,email,website,github,linkdin,twitter,instagram,facebook) values(?,?,?,?,?,?,?,?)");
                    ps6.setString(1, name);
                    ps6.setString(2, email);
                    ps6.setString(3, "not available");
                    ps6.setString(4, "not available");
                    ps6.setString(5, "not available");
                    ps6.setString(6, "not available");
                    ps6.setString(7, "not available");
                    ps6.setString(8, "not available");
                    int rowCount5 = ps6.executeUpdate();

                    // set values into profile_details
                    PreparedStatement ps12 = con.prepareStatement("insert into profile_details(email, profile_url) values(?,?)");
                    ps12.setString(1, email);
                    ps12.setString(2, "profile-pic.png");
                    int rowCount12 = ps12.executeUpdate();

                    session.setAttribute("profile_url", "profile-pic.png");

                    // set values into users_resume
                    PreparedStatement ps13 = con.prepareStatement("insert into users_resume(email, resume_url) values(?,?)");
                    ps13.setString(1, email);
                    ps13.setString(2, "not available");
                    int rowCount13 = ps13.executeUpdate();

                    session.setAttribute("resume_url", "not available");

                    if (rowCount2>0 && rowCount5>0 && rowCount12>0 && rowCount13>0) {

                        con.commit();

                        resp.sendRedirect("profile.jsp");
                    } else {
                        con.rollback();
                    }
                }

            }

        } catch (SQLException e) {
            out.println(e);
        } finally {
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
