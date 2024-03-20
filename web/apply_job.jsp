

<%@page import="com.nikhil.connection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<jsp:declaration>
    String id;
    String job_title;
    String job_posted_on;
    String job_description;
    String company_name;
    String job_role;
    String qualifications;
    String branch;
    String batch;
    String salary;
    String experience;
    String location;
    String responsibilities;
    String selection_process;
    String about_company;
    String apply_link;
</jsp:declaration>
<jsp:scriptlet>
    id = request.getParameter("job_id");
    
    Connection con = null;
    try{
        con = DbConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from jobs where id=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            job_title = rs.getString("job_title");
            job_posted_on = rs.getString("job_posted_on");
            job_description = rs.getString("job_description");
            company_name = rs.getString("company_name");
            job_role = rs.getString("job_role");
            qualifications = rs.getString("qualifications");
            branch = rs.getString("branch");
            batch = rs.getString("batch");
            salary = rs.getString("salary");
            experience = rs.getString("experience");
            location = rs.getString("location");
            responsibilities = rs.getString("responsibilities");
            selection_process = rs.getString("selection_process");
            about_company = rs.getString("about_company");
            apply_link = rs.getString("apply_link");
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
    
    
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - <jsp:expression>job_title</jsp:expression></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <header>
            <jsp:scriptlet>
                String email = (String) session.getAttribute("email_id");
                
                if(email==null){ 
            </jsp:scriptlet>
                <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                }
                else{
            </jsp:scriptlet>
                <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
        </header>
        <main>
            <div class="row">
                <div class="col-md-8">
                    <br>
                    <h1 class="current-job-heading"><jsp:expression>job_title</jsp:expression></h1><br>
                    <spna class="current-job-heading"><b>Job Description : </b></spna><p><jsp:expression>job_description</jsp:expression></p><br>
                    <p class="current-job-heading"><b>Job Information : </b></p>
                    <table class="job-information-table">
                        <tr>
                            <td><b>Company Name</b></td>
                            <td><jsp:expression>company_name</jsp:expression></td>
                        </tr>
                        <tr>
                            <td><b>Job Role</b></td>
                            <td><jsp:expression>job_role</jsp:expression></td>
                        </tr>
                        <tr>
                            <td><b>Qualification</b></td>
                            <td><jsp:expression>qualifications</jsp:expression></td>
                        </tr>
                        <tr>
                            <td><b>Branch</b></td>
                            <td><jsp:expression>branch</jsp:expression></td>
                        </tr>
                        <tr>
                            <td><b>Batch</b></td>
                            <td><jsp:expression>batch</jsp:expression></td>
                        </tr>
                        <tr>
                            <td><b>Salary</b></td>
                            <td><jsp:expression>salary</jsp:expression></td>
                        </tr>
                        <tr>
                            <td><b>Experience</b></td>
                            <td><jsp:expression>experience</jsp:expression></td>
                        </tr>
                        <tr>
                            <td><b>Location</b></td>
                            <td><jsp:expression>location</jsp:expression></td>
                        </tr>
                    </table><br>
                    <p class="current-job-heading"><b>Responsibilities :</b></p>
                    <jsp:scriptlet>
                        String[] candidate_responsibilities = responsibilities.split("\\$");
                        
                        for(String i : candidate_responsibilities){
                    </jsp:scriptlet>
                    <span>&#9679; </span><span class="mt-2"><jsp:expression>i</jsp:expression></span><br>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet><br>
                    <p class="current-job-heading"><b>Selection Process :</b></p>
                    <jsp:scriptlet>
                        String[] sele_pro = selection_process.split("\\$");
                        int count = 1;
                        for(String i : sele_pro){
                    </jsp:scriptlet>
                    <span><b><jsp:expression>count++</jsp:expression>. </b></span><span class="mt-2"><jsp:expression>i</jsp:expression></span><br>
                    <jsp:scriptlet>
                        }
                    </jsp:scriptlet><br>
                    <p class="current-job-heading"><b>About Company :</b></p>
                    <p><jsp:expression>about_company</jsp:expression></p><br>
                    <div style="text-align: center;">
                        <a href="<jsp:expression>apply_link</jsp:expression>"class="btn btn-primary" >Apply</a>
                    </div><br>
                </div>
                <div class="col-md-4">
                    <br>
                    <h3>Recent Post</h3>
                    <jsp:scriptlet>
                        Connection con2 = null;
                        String other_job_title;
                        String other_job_id;
                        String other_job_posted_on;
                        try{
                            con2 = DbConnection.getConnection();
                            PreparedStatement ps2 = con2.prepareStatement("select * from jobs ORDER BY job_posted_on DESC LIMIT 5");
                            ResultSet rs2 = ps2.executeQuery();
                            while(rs2.next()){
                                other_job_id = rs2.getString("id");
                                other_job_title = rs2.getString("job_title");
                                other_job_posted_on = rs2.getString("job_posted_on");
                        </jsp:scriptlet>
                                <div class="more-jobs-button-div mt-3">
                                    <a href="apply_job.jsp?job_id=<jsp:expression>other_job_id</jsp:expression>" class="more-jobs-button">
                                        <h5 class="more-job-headings more-jobs-heading-change-color"><jsp:expression>other_job_title</jsp:expression></h5>
                                    <p style="color: gray;">posted on : <jsp:expression>other_job_posted_on</jsp:expression></p>
                                    </a>
                                </div>
                        <jsp:scriptlet>
                            }
                        }
                        catch(SQLException e){
                            out.print(e);
                        }
                    </jsp:scriptlet>
                </div>
            </div>
        </main>
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </body>
</html>
