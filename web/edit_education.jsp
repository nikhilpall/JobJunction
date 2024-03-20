
<%@page import="com.nikhil.connection.DbConnection"%>
<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:declaration>
    String school_college = "";
    String education_type = "";
    String field_of_study = "";
    String year = "";
    String grade = "";
    String desc = "";
</jsp:declaration>
<jsp:scriptlet>
    String id = request.getParameter("edu_id");
    Connection con = null;
    try{
        con = DbConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from education where id=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            school_college = rs.getString("school_college");
            education_type = rs.getString("education_type");
            field_of_study = rs.getString("field_of_study");
            year = rs.getString("year");
            grade = rs.getString("grade");
            desc = rs.getString("description");
        }
    }
    catch(Exception e){
        out.print(e);
    }
    finally{
        con.close();
    }
    
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - Add Education details</title>
        <link href="css/style.css"/>
        <script>

            function removeError(error, form_field) {
                document.getElementById(error).innerHTML = "";
                document.getElementById(form_field).style.border = "2px solid green";
            }
            function checkEduDetails() {
                let flag = true;

                let school_college = document.add_edu_form.user_school_college.value;
                let edu_type = document.add_edu_form.user_education_type.value;
                let fiel_of_study = document.add_edu_form.user_field.value;
                let year = document.add_edu_form.user_year_span.value;
                let grade = document.add_edu_form.user_grade.value;
                
                if (school_college === "") {
                    document.getElementById('school_error').innerHTML = " *school/college name cannot be empty";
                    document.add_edu_form.user_school_college.style.border = "2px solid red";
                    flag = false;
                }
                if (edu_type === "Select Education Type") {
                    document.getElementById('edu_error').innerHTML = " *Plese select Education type";
                    document.add_edu_form.user_education_type.style.border = "2px solid red";
                    flag = false;
                }
                if (fiel_of_study === "") {
                    document.getElementById('field_error').innerHTML = " *field of study cannot be empty";
                    document.add_edu_form.user_field.style.border = "2px solid red";
                    flag = false;
                }
                if (year === "") {
                    document.getElementById('year_error').innerHTML = " *year cannot be empty";
                    document.add_edu_form.user_year_span.style.border = "2px solid red";
                    flag = false;
                }
                if (grade === "") {
                    document.getElementById('grade_error').innerHTML = " *grade cannot be empty";
                    document.add_edu_form.user_grade.style.border = "2px solid red";
                    flag = false;
                }

                return flag;
            }

        </script>
    </head>
    <body>
        <header><jsp:include page="profileheader.jsp"></jsp:include></header>
            <main style="padding: 50px 0px;">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                            <div class="add-edu-form">
                                <form method="post" name="add_edu_form" onsubmit="return checkEduDetails()" action="edit_edu_details">
                                    <input name="edu_id" hidden="" value="<jsp:expression>id</jsp:expression>"/>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td colspan="2" style="text-align: center;"><h3>Edit Education Details</h3></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><br></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>School/College<span style="color: red;"> *</span></b></td>
                                            <td><input type="text" placeholder="Enter Your School/College Name" value="<jsp:expression>school_college</jsp:expression>" name="user_school_college" id="user_school_college" onkeyup="removeError('school_error', 'user_school_college')"/><br><span style="font-size: 12px; color: red;" id="school_error"></span></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Education Type<span style="color: red;"> *</span></b></td>
                                            <td>
                                                <select name="user_education_type" id="user_education_type" value="<jsp:expression>education_type</jsp:expression>" onclick="removeError('edu_error', 'user_education_type')">
                                                    <option>Select Education Type</option>
                                                    <option value="SSC">SSC</option>
                                                    <option value="HSC">HSC</option>
                                                    <option value="BE/BTech">BE/BTech</option>
                                                    <option value="BCA">BCA</option>
                                                    <option value="MBA">MBA</option>
                                                </select>
                                                <br><span style="font-size: 12px; color: red;" id="edu_error"></span>
                                            </td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Field Of Study<span style="color: red;"> *</span></b></td>
                                            <td><input type="text" placeholder="(e.g Mechanical Engineering)" value="<jsp:expression>field_of_study</jsp:expression>" name="user_field" id="user_field" onkeyup="removeError('field_error', 'user_field')"/><br><span style="font-size: 12px; color: red;" id="field_error"></span></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Year<span style="color: red;"> *</span></b></td>
                                            <td><input type="text" placeholder="(e.g 2018-2022)" value="<jsp:expression>year</jsp:expression>" name="user_year_span" id="user_year_span" onkeyup="removeError('year_error', 'user_year_span')"/><br><span style="font-size: 12px; color: red;" id="year_error"></span></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Grade<span style="color: red;"> *</span></b></td>
                                            <td><input type="text" placeholder="e.g 78" value="<jsp:expression>grade</jsp:expression>" name="user_grade" id="user_grade" onkeyup="removeError('grade_error', 'user_grade')"/><br><span style="font-size: 12px; color: red;" id="grade_error"></span></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Description</b></td>
                                            <td><textarea name="user_desc" value="<jsp:expression>desc</jsp:expression>" placeholder="e.g Participate in various competition, Achievement, Sports"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><br></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center;"><input class="btn btn-danger" type="submit" value="Save"/></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                </div>
            </main>
            <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </body>
</html>
