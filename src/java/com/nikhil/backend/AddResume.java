
package com.nikhil.backend;

import com.nikhil.connection.DbConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

public class AddResume extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession sesssion = req.getSession();
        String email = (String) sesssion.getAttribute("email_id");

        String file_name = "not available";
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory(); //The 'DiskFileItemFactory' is a factory class that creates instances of 'FileItem' objects, which represent the files that are uploaded in a web application.
            ServletFileUpload sfu = new ServletFileUpload(factory); //'ServletFileUpload' is a class that handles the process of parsing HTTP requests that contain file uploads. It uses the 'DiskFileItemFactory' you created earlier to manage temporary files and other settings.
            List<FileItem> items = sfu.parseRequest(req); //The 'parseRequest' method of the 'ServletFileUpload' class reads the request and returns a list of 'FileItem' objects, each representing a part of the request, which includes uploaded files and regular form fields.
            FileItem item = items.get(0); //This line retrieves the first element from the list of 'FileItem' objects obtained from the previous step and assigns it to the variable 'item'.
            String file_path = item.getName(); //'getName()' returns the name of the file as it was named by the user who uploaded it. Note that this is just the original name, not the full path on the user's system.
            File file = new File(file_path); //Here, a new 'File' object is created using the 'file_path' that was obtained from the 'FileItem' object earlier.
            file_name = file.getName(); //This line retrieves the name of the file from the 'File' object 'file' and assigns it to a variable named 'file_name'.

            File f1 = new File(PathDetails.RESUME_PATH + file_name);
            item.write(f1);
        } 
        catch (Exception e) {
            out.print(e);
        }
        
        if(file_name.equals("")){
            file_name = "not available";
        }
        
        Connection con = null;
        try{
            con = DbConnection.getConnection();
            con.setAutoCommit(false);
            
            // update resume
            PreparedStatement ps = con.prepareStatement("update users_resume set resume_url=? where email=?");
            ps.setString(1, file_name);
            ps.setString(2, email);
            int rowCount = ps.executeUpdate();
            if(rowCount>0){
                con.commit();
                sesssion.setAttribute("resume_url", file_name);
                resp.sendRedirect("profile.jsp");
            }
            else{
                con.rollback();
                
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("add_resume.jsp");
                rd2.include(req, resp);
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
