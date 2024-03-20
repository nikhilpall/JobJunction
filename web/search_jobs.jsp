<%@page import="com.nikhil.connection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - Search Jobs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"/>
        <link href="css/media.css" rel="stylesheet"/>
        <script>
            function searchJobs(){
                let skills_input = document.getElementById('skills_input').value;
                let location_input = document.getElementById('location_input').value;
                let exp_input = document.getElementById('exp_input').value;
                
                // 1. create xmlhttprequest object
                let obj = new XMLHttpRequest();
                
                // 2. open object
                obj.open("post", "get_all_job?skills="+skills_input+"&location="+location_input+"&exp="+exp_input, true);
                
                // 3. send the request
                obj.send();
                
                // 4. call the function when readystate change property changes
                obj.onreadystatechange = function(){
                    if(obj.readyState===4 && obj.status===200){
                        document.getElementById('job_seatch_table_body').innerHTML = "";
                        document.getElementById('job_seatch_table_body').innerHTML = obj.responseText;
                    }
                };
            }
        </script>
    </head>
    <body>
        <header>
            <jsp:scriptlet>
                String email = (String) session.getAttribute("email_id");

                if (email == null) {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                } else {
            </jsp:scriptlet>
            <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                    }
            </jsp:scriptlet>
        </header>

        <main>
            <div class="row">
                <div class="col-md-12">
                    <br>
                    <div style="text-align: center;">
                        <h1 style="font-weight: 200;">Current Job Openings in India</h1>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4 search_job_inputs_div"><input type="text" placeholder="Job Title" id="skills_input" onkeyup="searchJobs()"/></div>
                        <div class="col-md-4 search_job_inputs_div"><input type="text" placeholder="Location" id="location_input" onkeyup="searchJobs()"/></div>
                        <div class="col-md-4 search_job_inputs_div"><input type="text" placeholder="Exp(In years)" id="exp_input" onkeyup="searchJobs()"/></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="search-job-table table table-striped" id="example">
                                <thead>
                                    <tr>
                                        <td><b>Job Title</b></td>
                                        <td><b>Post date</b></td>
                                        <td><b>Location</b></td>
                                        <td><b>Experience</b></td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody id="job_seatch_table_body">
                                <jsp:scriptlet>
                                    Connection con = null;
                                    String job_title;
                                    String job_posted_date;
                                    String location;
                                    String exp;
                                    String id;
                                    int total_entries = 0;
                                    int start = 0;
                                    int count = 10;
                                    int page_no = 0;
                                    try{
                                        if(request.getParameter("page")==null){
                                            page_no = 0;
                                        }
                                        else{
                                            page_no = Integer.parseInt(request.getParameter("page"));
                                        }
                                        
                                        con = DbConnection.getConnection();
                                        PreparedStatement ps = con.prepareStatement("select * from jobs ORDER BY job_posted_on DESC LIMIT ?,?");
                                        start = count*page_no;
                                        ps.setInt(1, start);
                                        ps.setInt(2, count);
                                        ResultSet rs = ps.executeQuery();
                                        while(rs.next()){
                                            job_title = rs.getString("job_title");
                                            job_posted_date = rs.getString("job_posted_on");
                                            location = rs.getString("location");
                                            exp = rs.getString("experience");
                                            id = rs.getString("id");
                                            
                                        </jsp:scriptlet>
                                            <tr>
                                                <td><b><jsp:expression>job_title</jsp:expression></b></td>
                                                <td><jsp:expression>job_posted_date</jsp:expression></td>
                                                <td><jsp:expression>location</jsp:expression></td>
                                                <td><jsp:expression>exp</jsp:expression></td>
                                                <td style="text-align: center;"><a href="apply_job.jsp?job_id=<jsp:expression>id</jsp:expression>" class="btn btn-primary view-job-btn">View Job</a></td>
                                            </tr>
                                        <jsp:scriptlet>
                                        }
                                        
                                        PreparedStatement ps2 = con.prepareStatement("select count(*) from jobs");
                                        ResultSet rs2 = ps2.executeQuery();
                                        if(rs2.next()){
                                            total_entries = rs2.getInt(1);
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
                                            </table>
                            <table style="width: 100%;">
                                <tr>
                                    <td><br></td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <jsp:scriptlet>
                                            String display_prev = "";
                                            if(page_no==0){
                                                display_prev = "none";
                                            }
                                            else{
                                                display_prev = "block";
                                            }
                                            String display_next = "";
                                            if(start>(total_entries-count)){ 
                                                display_next = "none";
                                            }
                                            else{
                                                display_next = "block";
                                            }
                                        </jsp:scriptlet>
                                        <span style="float: left;"><a href="search_jobs.jsp?page=<jsp:expression>page_no-1</jsp:expression>" class="btn btn-info" style="display: <jsp:expression>display_prev</jsp:expression>;">Previous</a></span>
                                        <span style="float: right;"><a href="search_jobs.jsp?page=<jsp:expression>page_no+1</jsp:expression>" class="btn btn-info" style="display: <jsp:expression>display_next</jsp:expression>;">Next</a></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br></td>
                                </tr>
                            </table>
                                    
                                </tbody>
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer>
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
        <script src="js/jquery.js"></script>
    </body>
</html>
