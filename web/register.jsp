
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register - JobJunction</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"/>
        <script>
            function val(v) {
                document.getElementById(v).innerHTML = "";
            }

            function removeError(error) {
                document.getElementById(error).innerHTML = "";
            }

            function validation() {
                let flag = true;
                let name = document.regform.name.value;
                let email = document.regform.email.value;
                let pass = document.regform.pass.value;
                let gender = document.regform.gender.value;
                let city = document.regform.city.value;

                const nameRegex = /^[A-Za-z\-']{3,19}( [A-Za-z\-']{3,19})*$/;
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                const passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;

                if (!name.match(nameRegex)) {
                    document.getElementById('name_error').innerHTML = "Please Enter valid name.";
                    flag = false;
                }
                if (name == "") {
                    document.getElementById('name_error').innerHTML = "Name cannot be empty.";
                    flag = false;
                }

                if (!email.match(emailRegex)) {
                    document.getElementById('email_error').innerHTML = "Please Enter valid email.";
                    flag = false;
                }
                if (email == "") {
                    document.getElementById('email_error').innerHTML = "Email cannot be empty.";
                    flag = false;
                }

                if (!pass.match(passwordRegex)) {
                    document.getElementById('pass_error').innerHTML = "Enter strong password (sould contain at least 1 special character and number.)";
                    flag = false;
                }
                if (pass == "") {
                    document.getElementById('pass_error').innerHTML = "Password cannot be empty.";
                    flag = false;
                }
                if (gender == "") {
                    document.getElementById('gender_error').innerHTML = "Please select gender";
                    flag = false;
                }
                if (city == "Select City") {
                    document.getElementById('city_error').innerHTML = "Select city";
                    flag = false;
                }
                return flag;
            }
        </script>
    </head>
    <body>
        <header><jsp:include page="header.jsp"></jsp:include></header>
            <main>
            <jsp:include page="registerdiv.jsp"></jsp:include>
            </main>
            <footer><jsp:include page="footer.jsp"></jsp:include></footer>
        <script src="js/jquery.js"></script>
    </body>
</html>
