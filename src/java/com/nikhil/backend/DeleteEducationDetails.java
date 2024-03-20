
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

public class DeleteEducationDetails extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String edu_id = req.getParameter("edu_id");
        
        Connection con = null;
        try{
            con = DbConnection.getConnection();
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement("delete from education where id=?");
            ps.setString(1, edu_id);
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                resp.sendRedirect("profile.jsp");
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
            catch(SQLException e){
                out.print(e);
            }
        }
    }
}
