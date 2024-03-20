package com.nikhil.backend;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import com.nikhil.connection.DbConnection;
import java.awt.Font;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author nikhil
 */
public class CreateResumePdf extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        Connection con = null;
        try {
            // Getting users basic details :
            String name = req.getParameter("user_full_name");
            String career_objective = req.getParameter("career_objective");
            String skills = req.getParameter("skills");
            String languages = req.getParameter("languages");
            String certifications = req.getParameter("certificates");
            String email = req.getParameter("user_email");
            String date_of_birth = req.getParameter("user_dob");
            String mobile = req.getParameter("user_mobile");
            String address = req.getParameter("user_address");
            
            String web_url = req.getParameter("user_web_url");
            String github = req.getParameter("user_github");
            String linkdin = req.getParameter("user_linkdin");
            String twitter = req.getParameter("user_twitter");
            String insta = req.getParameter("user_insta");
            String facebook = req.getParameter("user_facebook");
            

            // 1. create pdf file name
            String resume_pdf_name = email + ".pdf";
            // 2. create document class object
            Document document = new Document();
            // 3. get PdfWriterInstance 
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(PathDetails.RESUME_BUILDER + resume_pdf_name));
            // 4. Open Document
            document.open();

            Paragraph empty_para = new Paragraph(6f, " ");
            document.add(empty_para);
            // -------------------------- title -----------------------------------------------
            String font_name = "Arial";
            float font_size = 18f;
            int style = Font.BOLD;
            Paragraph p = new Paragraph("Resume", FontFactory.getFont(font_name, font_size, style));
            p.setAlignment(Element.ALIGN_CENTER);
            p.setSpacingAfter(20f);
            document.add(p);
            //----------------------------------------------------------------------------------
            // -------------------------- name, email, mobile number---------------------------
            Paragraph namee = new Paragraph(name);
            document.add(namee);
            document.add(empty_para);

            Paragraph emaill = new Paragraph(email, FontFactory.getFont(font_name, 12f, BaseColor.BLUE));
            document.add(emaill);
            document.add(empty_para);

            Paragraph phone = new Paragraph(mobile);
            document.add(phone);
            document.add(empty_para);
            
            //---------------------------------------------------------------------------------
            //----------------------------- Social details ------------------------------------
            if(!"".equals(web_url)){
                com.itextpdf.text.Font labelFont = FontFactory.getFont("arial", 12f, BaseColor.BLACK);
                com.itextpdf.text.Font urlFont = FontFactory.getFont("arial", 12f, BaseColor.BLUE);
                
                Paragraph label = new Paragraph("Portfolio : ", labelFont);
                Paragraph user_linkdin_url = new Paragraph(linkdin, urlFont);
                
                label.add(user_linkdin_url);
                
                document.add(label);
                document.add(empty_para);
            }
            if(!"".equals(github)){
                com.itextpdf.text.Font labelFont = FontFactory.getFont("arial", 12f, BaseColor.BLACK);
                com.itextpdf.text.Font urlFont = FontFactory.getFont("arial", 12f, BaseColor.BLUE);
                
                Paragraph label = new Paragraph("github : ", labelFont);
                Paragraph user_linkdin_url = new Paragraph(linkdin, urlFont);
                
                label.add(user_linkdin_url);
                
                document.add(label);
                document.add(empty_para);
            }
            if(!"".equals(linkdin)){
                com.itextpdf.text.Font labelFont = FontFactory.getFont("arial", 12f, BaseColor.BLACK);
                com.itextpdf.text.Font urlFont = FontFactory.getFont("arial", 12f, BaseColor.BLUE);
                
                Paragraph label = new Paragraph("Linkdin : ", labelFont);
                Paragraph user_linkdin_url = new Paragraph(linkdin, urlFont);
                
                label.add(user_linkdin_url);
                
                document.add(label);
                document.add(empty_para);
            }
            
            //---------------------------------------------------------------------------------
            // -------------------------- Line seperator --------------------------------------
            LineSeparator line = new LineSeparator();
            document.add(line);
            //---------------------------------------------------------------------------------
            //--------------------------------- carrer objective-------------------------------
            float heading_font_size = 15f;
            Paragraph carrer_obj_bold = new Paragraph("Carrer Objective : ", FontFactory.getFont("arial", heading_font_size, style));
            document.add(carrer_obj_bold);
            document.add(empty_para);

            Paragraph carrer_obj_para = new Paragraph(career_objective);
            carrer_obj_para.setSpacingAfter(10f);
            document.add(carrer_obj_para);
            document.add(empty_para);

            document.add(line);
            //---------------------------------------------------------------------------------
            //--------------------------------- skills -------------------------------
            Paragraph skill_obj_bold = new Paragraph("Skills : ", FontFactory.getFont("arial", heading_font_size, style));
            document.add(skill_obj_bold);
            document.add(empty_para);

            Paragraph skill_obj_para = new Paragraph(skills);
            skill_obj_para.setSpacingAfter(10f);
            document.add(skill_obj_para);
            document.add(empty_para);

            document.add(line);
            //---------------------------------------------------------------------------------
            //----------------------------- Project Details -----------------------------------
            String project_title;
            String project_about;
            String start_date;
            String end_date;
            con = DbConnection.getConnection();
            try {
                PreparedStatement ps1 = con.prepareStatement("select * from users_projects where email=?");
                ps1.setString(1, email);
                ResultSet rs1 = ps1.executeQuery();

                Paragraph project_obj_bold = new Paragraph("Projects : ", FontFactory.getFont("arial", heading_font_size, style));
                document.add(project_obj_bold);
                document.add(empty_para);

                while (rs1.next()) {
                    project_title = rs1.getString("title");
                    project_about = rs1.getString("about");
                    start_date = rs1.getString("start_date");
                    end_date = rs1.getString("end_date");
                    
                    Paragraph project_title1 = new Paragraph(project_title, FontFactory.getFont("arial", 12f, style));
                    Paragraph project_date_para = new Paragraph(" ("+start_date+" to "+end_date+")", FontFactory.getFont("arial", 12f, BaseColor.GRAY));

                    project_title1.add(project_date_para);
                    document.add(project_title1);

                    Paragraph project_desc = new Paragraph(project_about);
                    project_desc.setSpacingAfter(10f);
                    document.add(project_desc);
                }
            } catch (Exception e) {
                out.print(e);
            } finally {
                try {
                    if (con != null) {
                        con.close();
                    }
                } catch (Exception ee) {
                    out.print(ee);
                }
            }
            document.add(empty_para);
            document.add(empty_para);
            document.add(line);
            //---------------------------------------------------------------------------------
            //-------------------------------- Experience Details --------------------------------------
            Connection con3 = null;
            try {
                con3 = DbConnection.getConnection();
                PreparedStatement ps3 = con3.prepareStatement("select * from experience where email=?");
                ps3.setString(1, email);
                ResultSet rs3 = ps3.executeQuery();
                if (rs3.next()) {
                    Paragraph experience_details = new Paragraph("Experience Details : ", FontFactory.getFont("arial", heading_font_size, style));
                    experience_details.setSpacingAfter(10f);
                    document.add(experience_details);
                    document.add(empty_para);

                    PdfPTable table = new PdfPTable(4);
                    table.setWidthPercentage(100);

                    PdfPCell c1 = new PdfPCell(new Phrase("Company", FontFactory.getFont("arial", 12f, style)));
                    PdfPCell c2 = new PdfPCell(new Phrase("Role", FontFactory.getFont("arial", 12f, style)));
                    PdfPCell c3 = new PdfPCell(new Phrase("Location", FontFactory.getFont("arial", 12f, style)));
                    PdfPCell c4 = new PdfPCell(new Phrase("Year", FontFactory.getFont("arial", 12f, style)));

                    c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    c3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    c4.setHorizontalAlignment(Element.ALIGN_CENTER);

                    c1.setPaddingTop(5);
                    c1.setPaddingBottom(5);

                    c2.setPaddingTop(5);
                    c2.setPaddingBottom(5);

                    c3.setPaddingTop(5);
                    c3.setPaddingBottom(5);

                    c4.setPaddingTop(5);
                    c4.setPaddingBottom(5);

                    table.addCell(c1);
                    table.addCell(c2);
                    table.addCell(c3);
                    table.addCell(c4);

                    String exp_company_name;
                    String exp_role;
                    String exp_location;
                    String exp_year;
                    
                    PreparedStatement ps4 = con3.prepareStatement("select * from experience where email=?");
                    ps4.setString(1, email);
                    ResultSet rs4 = ps4.executeQuery();
                    while (rs4.next()) {
                        exp_company_name = rs4.getString("company");
                        exp_role = rs4.getString("role");
                        exp_location = rs4.getString("location");
                        exp_year = rs4.getString("year");

                        PdfPCell exp_c1 = new PdfPCell(new Phrase(exp_company_name, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));
                        PdfPCell exp_c2 = new PdfPCell(new Phrase(exp_role, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));
                        PdfPCell exp_c3 = new PdfPCell(new Phrase(exp_location, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));
                        PdfPCell exp_c4 = new PdfPCell(new Phrase(exp_year, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));

                        exp_c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                        exp_c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                        exp_c3.setHorizontalAlignment(Element.ALIGN_CENTER);
                        exp_c4.setHorizontalAlignment(Element.ALIGN_CENTER);

                        exp_c1.setPaddingTop(5);
                        exp_c1.setPaddingBottom(5);

                        exp_c2.setPaddingTop(5);
                        exp_c2.setPaddingBottom(5);

                        exp_c3.setPaddingTop(5);
                        exp_c3.setPaddingBottom(5);

                        exp_c4.setPaddingTop(5);
                        exp_c4.setPaddingBottom(5);

                        table.addCell(exp_c1);
                        table.addCell(exp_c2);
                        table.addCell(exp_c3);
                        table.addCell(exp_c4);
                    }

                    document.add(table);
                    document.add(empty_para);
                    document.add(empty_para);
                    document.add(empty_para);
                    document.add(line);
                }
            } catch (Exception e) {
                out.print(e);
            }
            finally{
                try{
                    if(con!=null){
                        con.close();
                    }
                }
                catch(Exception e){
                    out.print(e);
                }
            }

            //---------------------------------------------------------------------------------------
            //-------------------------------- Education Details --------------------------------------
            Paragraph education_details = new Paragraph("Education Details : ", FontFactory.getFont("arial", heading_font_size, style));
            education_details.setSpacingAfter(10f);
            document.add(education_details);
            document.add(empty_para);

            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100);

            PdfPCell c1 = new PdfPCell(new Phrase("Year", FontFactory.getFont("arial", 12f, style)));
            PdfPCell c2 = new PdfPCell(new Phrase("Institute Name", FontFactory.getFont("arial", 12f, style)));
            PdfPCell c3 = new PdfPCell(new Phrase("Education", FontFactory.getFont("arial", 12f, style)));
            PdfPCell c4 = new PdfPCell(new Phrase("Stream", FontFactory.getFont("arial", 12f, style)));
            PdfPCell c5 = new PdfPCell(new Phrase("Percentage", FontFactory.getFont("arial", 12f, style)));

            c1.setHorizontalAlignment(Element.ALIGN_CENTER);
            c2.setHorizontalAlignment(Element.ALIGN_CENTER);
            c3.setHorizontalAlignment(Element.ALIGN_CENTER);
            c4.setHorizontalAlignment(Element.ALIGN_CENTER);
            c5.setHorizontalAlignment(Element.ALIGN_CENTER);

            c1.setPaddingTop(5);
            c1.setPaddingBottom(5);

            c2.setPaddingTop(5);
            c2.setPaddingBottom(5);

            c3.setPaddingTop(5);
            c3.setPaddingBottom(5);

            c4.setPaddingTop(5);
            c4.setPaddingBottom(5);

            c5.setPaddingTop(5);
            c5.setPaddingBottom(5);

            table.addCell(c1);
            table.addCell(c2);
            table.addCell(c3);
            table.addCell(c4);
            table.addCell(c5);

            String edu_college_name;
            String edu_type;
            String edu_field;
            String edu_year;
            String edu_grade;
            Connection con2 = null;
            try {
                con2 = DbConnection.getConnection();
                PreparedStatement ps2 = con2.prepareStatement("select * from education where email=?");
                ps2.setString(1, email);
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    edu_college_name = rs2.getString("school_college");
                    edu_type = rs2.getString("education_type");
                    edu_field = rs2.getString("field_of_study");
                    edu_year = rs2.getString("year");
                    edu_grade = rs2.getString("grade");

                    PdfPCell edu_c1 = new PdfPCell(new Phrase(edu_year, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));
                    PdfPCell edu_c2 = new PdfPCell(new Phrase(edu_college_name, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));
                    PdfPCell edu_c3 = new PdfPCell(new Phrase(edu_type, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));
                    PdfPCell edu_c4 = new PdfPCell(new Phrase(edu_field, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));
                    PdfPCell edu_c5 = new PdfPCell(new Phrase(edu_grade, FontFactory.getFont("arial", 11.5f, BaseColor.BLACK)));

                    edu_c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    edu_c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                    edu_c3.setHorizontalAlignment(Element.ALIGN_CENTER);
                    edu_c4.setHorizontalAlignment(Element.ALIGN_CENTER);
                    edu_c5.setHorizontalAlignment(Element.ALIGN_CENTER);

                    edu_c1.setPaddingTop(5);
                    edu_c1.setPaddingBottom(5);

                    edu_c2.setPaddingTop(5);
                    edu_c2.setPaddingBottom(5);

                    edu_c3.setPaddingTop(5);
                    edu_c3.setPaddingBottom(5);

                    edu_c4.setPaddingTop(5);
                    edu_c4.setPaddingBottom(5);

                    edu_c5.setPaddingTop(5);
                    edu_c5.setPaddingBottom(5);

                    table.addCell(edu_c1);
                    table.addCell(edu_c2);
                    table.addCell(edu_c3);
                    table.addCell(edu_c4);
                    table.addCell(edu_c5);
                }
            } catch (Exception e) {
                out.print(e);
            } finally {
                try {
                    if (con2 != null) {
                        con2.close();
                    }
                } catch (Exception ee) {
                    out.print(ee);
                }
            }

            document.add(table);
            document.add(empty_para);
            document.add(empty_para);
            document.add(empty_para);
            document.add(line);
            
            //---------------------------------------------------------------------------------
            //-------------------------- Certifications --------------------------------------
            if(!"".equals(certifications)){
                Paragraph certi_title = new Paragraph("Certifications :", FontFactory.getFont("arial", 16f, style));
                document.add(certi_title);
                document.add(empty_para);
                
                String[] certificate_in_order = certifications.split(",");
                
                int count = 1;
                for(String i : certificate_in_order){
                    Paragraph user_certificates = new Paragraph(count+". "+i);
                    count++;
                    document.add(user_certificates);
                    document.add(empty_para);
                }
                
                
                document.add(empty_para);
                document.add(empty_para);
                document.add(line);
            }
            //---------------------------------------------------------------------------------
            //-------------------------- Personal Details -------------------------------------
            Paragraph personal_title = new Paragraph("Personal Details :", FontFactory.getFont("arial", 16f, Font.BOLD));
            document.add(personal_title);
            document.add(empty_para);
            
            Paragraph lan_spoken = new Paragraph("Languages Spoken : "+languages);
            document.add(lan_spoken);
            document.add(empty_para);
            
            Paragraph user_dob = new Paragraph("Date of Birth : "+date_of_birth);
            document.add(user_dob);
            document.add(empty_para);
            
            Paragraph user_address = new Paragraph("Address : " + address);
            document.add(user_address);
            document.add(empty_para);
            
            if(!"".equals(twitter)){
                com.itextpdf.text.Font labelFont = FontFactory.getFont("arial", 12f, BaseColor.BLACK);
                com.itextpdf.text.Font urlFont = FontFactory.getFont("arial", 12f, BaseColor.BLUE);
                
                Paragraph label = new Paragraph("Twitter : ", labelFont);
                Paragraph user_twitter = new Paragraph(twitter, urlFont);
                
                label.add(user_twitter);
                
                document.add(label);
                document.add(empty_para);
            }
            if(!"".equals(insta)){
                com.itextpdf.text.Font labelFont = FontFactory.getFont("arial", 12f, BaseColor.BLACK);
                com.itextpdf.text.Font urlFont = FontFactory.getFont("arial", 12f, BaseColor.BLUE);
                
                Paragraph label = new Paragraph("Instagram : ", labelFont);
                Paragraph user_insta = new Paragraph(insta, urlFont);
                
                label.add(user_insta);
                
                document.add(label);
                document.add(empty_para);
            }
            if(!"".equals(facebook)){
                com.itextpdf.text.Font labelFont = FontFactory.getFont("arial", 12f, BaseColor.BLACK);
                com.itextpdf.text.Font urlFont = FontFactory.getFont("arial", 12f, BaseColor.BLUE);
                
                Paragraph label = new Paragraph("Facebook : ", labelFont);
                Paragraph user_facebook = new Paragraph(facebook, urlFont);
                
                label.add(user_facebook);
                
                document.add(label);
                document.add(empty_para);
            }
            
            document.add(empty_para);
            document.add(empty_para);
            document.add(line);
            
            //---------------------------------------------------------------------------------
            //------------------------------- Declaraction ------------------------------------
            Paragraph declaration = new Paragraph("Declaration :", FontFactory.getFont("arial", 16f, Font.BOLD));
            document.add(declaration);
            
            document.add(empty_para);
            document.add(empty_para);
            
            Paragraph dec_para = new Paragraph("I do hearby declare that the above informaction is true to the best of my knowledge.");
            document.add(dec_para);
            
            document.add(empty_para);
            document.add(empty_para);
            document.add(empty_para);
            document.add(empty_para);
            
            Paragraph user_name = new Paragraph("Name : "+name);
            document.add(user_name);
            
            document.add(empty_para);
            document.add(empty_para);
            
            Date d = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            Paragraph todays_date = new Paragraph("Date : " + sdf.format(d));
            document.add(todays_date);
            
            //---------------------------------------------------------------------------------
            // last step : close the document
            document.close();
            
            resp.sendRedirect("profile.jsp");
        } 
        catch (Exception e) {
            out.print(e);
            
            RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
            rd1.include(req, resp);
            
            RequestDispatcher rd2 = req.getRequestDispatcher("create_resume.jsp");
            rd2.include(req, resp);
        }
    }

}
