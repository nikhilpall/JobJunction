

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
                    <h2>Login</h2> <br><br>
                    <form method="post" action="login">
                        <input type="email" name="email" placeholder="Enter Your Email" class="form-textfield"> <br><br>
                        <input type="password" name="pass" placeholder="Enter Password" class="form-textfield"> <br><br>
                        <input type="checkbox" value="checked" id="remember_me" name="remember_me" style="cursor: pointer;"/> <label style="cursor: pointer;" for="remember_me"> Remember Me</label> <br><br>
                        <input type="submit" value="Login" class="btn btn-primary">
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </body>
</html>
