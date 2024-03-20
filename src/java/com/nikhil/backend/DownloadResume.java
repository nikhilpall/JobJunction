
package com.nikhil.backend;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadResume extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String file_name = req.getParameter("file_name");
        
        String file_path = PathDetails.RESUME_PATH+file_name;
        
        resp.setContentType("application/octet-stream");
        resp.setHeader("Content-Disposition", "attachment; filename=\""+file_name);
        
        FileInputStream fis = new FileInputStream(file_path);
        int i;
        while((i=fis.read()) != -1){
            out.write(i);
        }
        
        fis.close();
        out.close();
    }
    
}
