

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid mt-5 mb-5">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 register-form-div">
                    <h2>Register Here</h2> <br><br>
                    <form method="post" name="regform" onsubmit="return validation()" action="reg">
                        <input type="text" name="name" placeholder="Enter Your Name" class="form-textfield" onkeyup="val('name_error')"> <br> <span id="name_error" style="color: red;"></span> <br><br>
                        <input type="email" name="email" placeholder="Enter Your Email" class="form-textfield" onkeyup="val('email_error')"> <br> <span id="email_error" style="color: red;"></span> <br><br>
                        <input type="password" name="pass" placeholder="Enter Password" class="form-textfield" onkeyup="val('pass_error')"> <br> <span id="pass_error" style="color: red;"></span> <br><br>
                        <b>Select Gender : </b>
                        <label for="gender_male">
                            <input type="radio" name="gender" value="Male" id="gender_male" onclick="removeError('gender_error')"> Male
                        </label>
                        <label for="gender_female">
                            <input type="radio" name="gender" value="Female" id="gender_female" onclick="removeError('gender_error')"> Female
                        </label> <br> <span id="gender_error" style="color: red;"></span>  <br><br>
                        <b>Select Fields : </b>
                        <label for="it">
                            <input type="checkbox" value="Information Technology" name="fields" id="it"> Information Technology
                        </label> <br>
                        <label for="marketing">
                            <input type="checkbox" value="Marketing" name="fields" id="marketing"> Marketing
                        </label> <br>
                        <label for="finance">
                            <input type="checkbox" value="Finance" name="fields" id="finance"> Finance
                        </label>  <br><br>
                        <b>Select city : </b>
                        <select name="city" class="select-city" onclick="removeError('city_error')">
                            <option value="Select City">Select City</option>
                            <option value="Nagpur">Nagpur</option>
                            <option value="Pune">Pune</option>
                            <option value="Mumbai">Mumbai</option>
                            <option value="Hydrabad">Hydrabad</option>
                        </select> <br> <span id="city_error" style="color: red;"></span> <br><br><br>
                        <input type="submit" value="Register" class="btn btn-primary">
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </body>
</html>
