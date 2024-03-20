

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - Add Experience</title>
        <link href="css/style.css"/>
        <script>

            function removeError(error, form_field) {
                document.getElementById(error).innerHTML = "";
                document.getElementById(form_field).style.border = "2px solid green";
            }
            function checkEduDetails() {
                let flag = true;

                let company = document.add_exp_form.company.value;
                let role = document.add_exp_form.role.value;
                let location = document.add_exp_form.location.value;
                let year = document.add_exp_form.year.value;
                
                if (company === "") {
                    document.getElementById('company_error').innerHTML = " *Company name cannot be empty";
                    document.add_exp_form.company.style.border = "2px solid red";
                    flag = false;
                }
                if (role === "") {
                    document.getElementById('role_error').innerHTML = " *Plese select your role in company";
                    document.add_exp_form.role.style.border = "2px solid red";
                    flag = false;
                }
                if (location === "") {
                    document.getElementById('location_error').innerHTML = " *please enter location";
                    document.add_exp_form.location.style.border = "2px solid red";
                    flag = false;
                }
                if (year === "") {
                    document.getElementById('year_error').innerHTML = " *year cannot be empty";
                    document.add_exp_form.year.style.border = "2px solid red";
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
                                <form method="post" name="add_exp_form" onsubmit="return checkEduDetails()" action="add_exp">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td colspan="2" style="text-align: center;"><h3>Add Experience</h3></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><br></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Company Name<span style="color: red;"> *</span></b></td>
                                            <td><input type="text" placeholder="Enter Company Name" name="company" id="company" onkeyup="removeError('company_error', 'company')"/><br><span style="font-size: 12px; color: red;" id="company_error"></span></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Role<span style="color: red;"> *</span></b></td>
                                            <td><input type="text" placeholder="(e.g Software Developer)" name="role" id="role" onkeyup="removeError('role_error', 'role')"/><br><span style="font-size: 12px; color: red;" id="role_error"></span></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Location<span style="color: red;"> *</span></b></td>
                                            <td><input type="text" placeholder="(e.g Mumbai)" name="location" id="location" onkeyup="removeError('location_error', 'location')"/><br><span style="font-size: 12px; color: red;" id="location_error"></span></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Year<span style="color: red;"> *</span></b></td>
                                            <td><input type="text" placeholder="(e.g 2018-2022)" name="year" id="year" onkeyup="removeError('year_error', 'year')"/><br><span style="font-size: 12px; color: red;" id="year_error"></span></td>
                                        </tr>
                                        <tr class="edit-table-row">
                                            <td><b>Description</b></td>
                                            <td><textarea name="job_desc" placeholder="e.g my designation in company is all about web and android development"></textarea></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><br></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center;"><input class="btn btn-danger" type="submit" value="Add"/></td>
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
