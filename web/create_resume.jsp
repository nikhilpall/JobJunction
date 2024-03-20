

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.nikhil.connection.DbConnection"%>
<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet"%>
<jsp:scriptlet>
    // session details :
    String full_name = (String) session.getAttribute("full_name");
    String account_name = (String) session.getAttribute("account_name");
    String u_city = (String) session.getAttribute("u_city");
    String about = (String) session.getAttribute("about");
    String user_field = (String) session.getAttribute("field");
    String email_id = (String) session.getAttribute("email_id");
    String dob = (String) session.getAttribute("dob");
    String mobile = (String) session.getAttribute("mobile");
    String address = (String) session.getAttribute("address");

    if (about.equals("not available") || about == null) {
        about = "";
    }
    if (mobile.equals("----------") || mobile == null) {
        mobile = "";
    }
    if (address.equals("----------") || address == null) {
        address = "";
    }
    
    String website = "";
    String github = "";
    String linkdin = "";
    String twitter = "";
    String insta = "";
    String facebook = "";
    // Get user_social_details
    Connection con = null;
    try{
        con = DbConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from user_social_details where email=?");
        ps.setString(1, email_id);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            website = rs.getString("website");
            github = rs.getString("github");
            linkdin = rs.getString("linkdin");
            twitter = rs.getString("twitter");
            insta = rs.getString("instagram");
            facebook = rs.getString("facebook");
        }
    }
    catch(Exception e){
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
    
    if(website.equals("not available")){
        website = "";
    }
    if(github.equals("not available")){
        github = "";
    }
    if(linkdin.equals("not available")){
        linkdin = "";
    }
    if(twitter.equals("not available")){
        twitter = "";
    }
    if(insta.equals("not available")){
        insta = "";
    }
    if(facebook.equals("not available")){
        facebook = "";
    }
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - <jsp:expression>full_name</jsp:expression>(edit profile)</title>
            <script>
                function validation() {
                    let name = document.edit_form.user_full_name.value;
                    let email = document.edit_form.user_email.value;
                    let city = document.edit_form.user_city.value;

                    const nameRegex = /^[A-Za-z\-']{3,19}( [A-Za-z\-']{3,19})*$/;
                    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                    if (!name.match(nameRegex)) {
                        alert("please enter valid Full Name");
                        return false;
                    } else if (name === "") {
                        alert("name can not be empty");
                        return false;
                    } else if (!email.match(emailRegex)) {
                        alert("please enter valid email id");
                        return false;
                    } else if (email === "") {
                        alert("email can not be empty");
                        return false;
                    } else if (city === "Select City") {
                        alert("please select city");
                        return false;
                    } else {
                        return true;
                    }
                }
            </script>
        </head>
        <body>
            <header><jsp:include page="profileheader.jsp"></jsp:include></header>
            <main class="profile-section">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 create-resume-div">
                        <div class="edit-profile-form">
                            <form method="POST" name="edit_form" onsubmit="return validation()" action="create_resume_pdf">
                                <table>
                                    <tr>
                                        <td colspan="2" style="text-align: center; padding-bottom: 10px;"><h2>Add Basic Details</h2></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Full Name <span style="color: red;"> *</span></b></td>
                                        <td><input type="text" placeholder="Enter Full Name" required="" name="user_full_name" readonly="" value="<jsp:expression>full_name</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Career Objective <span style="color: red;"> *</span></b></td>
                                        <td><textarea id="id" name="career_objective" required="" rows="5" cols="50" placeholder="(e.g Secure a responsible career opportunity to fully utilize my training and skills, while making a significant contribution to the success of the company.)"></textarea></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Skills <span style="color: red;"> *</span></b></td>
                                        <td><textarea id="id" name="skills" required="" rows="5" cols="50" placeholder="(e.g html, css, javascript, ......)"></textarea></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Languages <span style="color: red;"> *</span></b></td>
                                        <td><textarea id="id" name="languages" required="" rows="5" cols="50" placeholder="(e.g english, hindi, marathi, japnease, ..........)"></textarea></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Certifications</b></td>
                                        <td><textarea id="id" name="certificates" rows="5" cols="50" placeholder="(e.g Udemy Advance Java Certificate, Microsoft Data Analyst Certificate, ...........)"></textarea></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Email <span style="color: red;"> *</span></b></td>
                                        <td><input type="text" placeholder="Enter Email" name="user_email" required="" value="<jsp:expression>email_id</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Date of Birth <span style="color: red;"> *</span></b></td>
                                        <td><input type="date" name="user_dob" value="<jsp:expression>dob</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Mobile Number <span style="color: red;"> *</span></b></td>
                                        <td><input type="text" placeholder="Enter Mobile Number" name="user_mobile" value="<jsp:expression>mobile</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Address <span style="color: red;"> *</span></b></td>
                                        <td><input type="text" placeholder="Enter Your Address" name="user_address" value="<jsp:expression>address</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td colspan="2" style="border-bottom: 2px solid black;"></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td colspan="2" style="text-align: center;"><h2>Project</h2></td>
                                    </tr>
                                <jsp:declaration>
                                    String title = "";
                                    String about_project = "";
                                    String start_date = "";
                                    String end_date = "";
                                    int user_id = 0;
                                    int count = 1;
                                </jsp:declaration>
                                <jsp:scriptlet>
                                    try {
                                        con = DbConnection.getConnection();
                                        PreparedStatement ps = con.prepareStatement("select * from users_projects where email=?");
                                        ps.setString(1, email_id);
                                        ResultSet rs = ps.executeQuery();
                                        while (rs.next()) {
                                            user_id = rs.getInt("id");
                                            title = rs.getString("title");
                                            about_project = rs.getString("about");
                                            start_date = rs.getString("start_date");
                                            end_date = rs.getString("end_date");
                                </jsp:scriptlet>
                                <tr>
                                    <td colspan="2"><hr></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding: 0 30px;"><b><h5>Project <jsp:expression>count++</jsp:expression> <span><a href="edit_project.jsp?project_id=<jsp:expression>user_id</jsp:expression>"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 512 511" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M405.332 256.484c-11.797 0-21.332 9.559-21.332 21.332v170.668c0 11.754-9.559 21.332-21.332 21.332H64c-11.777 0-21.332-9.578-21.332-21.332V149.816c0-11.754 9.555-21.332 21.332-21.332h170.668c11.797 0 21.332-9.558 21.332-21.332 0-11.777-9.535-21.336-21.332-21.336H64c-35.285 0-64 28.715-64 64v298.668c0 35.286 28.715 64 64 64h298.668c35.285 0 64-28.714 64-64V277.816c0-11.796-9.54-21.332-21.336-21.332zm0 0" fill="#4169e1" data-original="#000000" opacity="1" class=""></path><path d="M200.02 237.05a10.793 10.793 0 0 0-2.922 5.438l-15.082 75.438c-.703 3.496.406 7.101 2.922 9.64a10.673 10.673 0 0 0 7.554 3.114c.68 0 1.387-.063 2.09-.211l75.414-15.082c2.09-.43 3.988-1.43 5.461-2.926l168.79-168.79-75.415-75.41zM496.383 16.102c-20.797-20.801-54.633-20.801-75.414 0l-29.524 29.523 75.414 75.414 29.524-29.527C506.453 81.465 512 68.066 512 53.816s-5.547-27.648-15.617-37.714zm0 0" fill="#4169e1" data-original="#000000" opacity="1" class=""></path></g></svg></a></span>
                                            </h5></b><b><jsp:expression>title</jsp:expression></b><br>
                                        <span style="color: gray;"> (<jsp:expression>start_date</jsp:expression> to <jsp:expression>end_date</jsp:expression>)</span> <br>
                                        <span><jsp:expression>about_project</jsp:expression></span>
                                        </td>
                                    </tr>
                                <jsp:scriptlet>
                                        }
                                    } catch (Exception e) {
                                        out.print(e);
                                    }
                                    count = 1;
                                </jsp:scriptlet>
                                <tr class="edit-table-row">
                                    <td colspan="2" style="border-bottom: 2px solid black;"></td>
                                </tr>
                                <tr class="edit-table-row">
                                    <td colspan="2" style="text-align: center;"><h2>Education</h2></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style=" padding: 0 30px;">
                                        <table class="table"  style="text-align: center;">
                                            <tr>
                                                <td><b>Institute Name</b></td>
                                                <td><b>Education</b></td>
                                                <td><b>Stream</b></td>
                                                <td><b>Percentage(%)</b></td>
                                                <td><b>Year</b></td>
                                            </tr>
                                            <jsp:declaration>
                                                String email = "";
                                                String school_college = "";
                                                String education_type = "";
                                                String field_of_study = "";
                                                String year = "";
                                                String percentage = "";
                                            </jsp:declaration>
                                            <jsp:scriptlet>
                                                email = (String) session.getAttribute("email_id");
                                                try {
                                                    con = DbConnection.getConnection();
                                                    PreparedStatement ps1 = con.prepareStatement("select * from education where email=?");
                                                    ps1.setString(1, email);
                                                    ResultSet rs1 = ps1.executeQuery();
                                                    while (rs1.next()) {
                                                        school_college = rs1.getString("school_college");
                                                        education_type = rs1.getString("education_type");
                                                        field_of_study = rs1.getString("field_of_study");
                                                        percentage = rs1.getString("grade");
                                                        year = rs1.getString("year");
                                            </jsp:scriptlet>


                                            <tr>
                                                <td><jsp:expression>school_college</jsp:expression></td>
                                                <td><jsp:expression>education_type</jsp:expression></td>
                                                <td><jsp:expression>field_of_study</jsp:expression></td>
                                                <td><jsp:expression>percentage</jsp:expression></td>
                                                <td><jsp:expression>year</jsp:expression></td>
                                                </tr>


                                            <jsp:scriptlet>

                                                    }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                } finally {
                                                    con.close();
                                                }
                                            </jsp:scriptlet>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="edit-table-row">
                                    <td colspan="2" style="border-bottom: 2px solid black;"></td>
                                </tr>
                                <tr class="edit-table-row">
                                    <td colspan="2" style="text-align: center;"><h2>Experience</h2></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center; padding: 0 30px;">
                                        <table class="table">
                                            <tr>
                                                <td><b>Company</b></td>
                                                <td><b>Role</b></td>
                                                <td><b>Location</b></td>
                                                <td><b>Year</b></td>
                                            </tr>
                                            <jsp:declaration>
                                                String company = "";
                                                String role = "";
                                                String location = "";
                                            </jsp:declaration>
                                            <jsp:scriptlet>
                                                        email = (String) session.getAttribute("email_id");
                                                        try {
                                                            con = DbConnection.getConnection();
                                                            PreparedStatement ps = con.prepareStatement("select * from experience where email=?");
                                                            ps.setString(1, email);
                                                            ResultSet rs = ps.executeQuery();
                                                            while (rs.next()) {
                                                                company = rs.getString("company");
                                                                role = rs.getString("role");
                                                                location = rs.getString("location");
                                                                year = rs.getString("year");
                                            </jsp:scriptlet>
                                            <tr>
                                                <td><jsp:expression>company</jsp:expression></td>
                                                <td><jsp:expression>role</jsp:expression></td>
                                                <td><jsp:expression>location</jsp:expression></td>
                                                <td><jsp:expression>year</jsp:expression></td>
                                                </tr>
                                            <jsp:scriptlet>
                                                            }
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        } finally {
                                                            con.close();
                                                        }
                                            </jsp:scriptlet>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="edit-table-row">
                                    <td colspan="2" style="border-bottom: 2px solid black;"></td>
                                </tr>
                                <tr class="edit-table-row">
                                    <td colspan="2" style="text-align: center;"><h2>Social Media Details </h2></td>
                                </tr>
                                <tr class="edit-table-row">
                                    <td><b>Website url</b></td>
                                    <td><input type="text" placeholder="Enter Your Website Url" name="user_web_url" value="<jsp:expression>website</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>GitHub</b></td>
                                        <td><input type="text" placeholder="Enter Your GiHub profile Url" name="user_github" value="<jsp:expression>github</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Linkdin</b></td>
                                        <td><input type="text" placeholder="Enter Your Linkdin profile Url" name="user_linkdin" value="<jsp:expression>linkdin</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Twitter </b></td>
                                        <td><input type="text" placeholder="Enter Your Twitter profile Url" name="user_twitter" value="<jsp:expression>twitter</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Instagram </b></td>
                                        <td><input type="text" placeholder="Enter Your Instagram profile Url" name="user_insta" value="<jsp:expression>insta</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Facebook</b></td>
                                        <td><input type="text" placeholder="Enter Your Facebook profile Url" name="user_facebook" value="<jsp:expression>facebook</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td colspan="2"><hr></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center; padding-top: 20px !important;"><input type="submit" class="btn btn-primary" value="Create"/></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </main>
            <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </body>
</html>
