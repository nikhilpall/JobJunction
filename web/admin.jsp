
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - JobJunction</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <header><jsp:include page="header.jsp"></jsp:include></header>
            <main>
                <div class="container-fluid mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6 register-form-div">
                            <h2>Admin Login</h2> <br><br>
                            <form method="post" action="admin">
                                <input type="email" name="admin_email" placeholder="Enter Your Email" class="form-textfield"> <br><br>
                                <input type="password" name="admin_pass" placeholder="Enter Password" class="form-textfield"> <br><br>

                                <input type="submit" value="Login" class="btn btn-primary">
                            </form>
                            <br>
                            <p style="color: red;">(If your are not admin then please <a href="login.jsp">click here</a>)</p>
                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>
            </main>
            <footer><jsp:include page="footer.jsp"></jsp:include></footer>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" ></script>	
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    </body>
</html>
