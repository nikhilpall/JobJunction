
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String email = (String)session.getAttribute("email_id");
    if(email==null){
        email = "";
    }
</jsp:scriptlet>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - Contact Us</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="row">
            <div class="col-md-8 contact-form">
                <br>
                <h1>Get In Touch</h1><br>
                <form method="post" action="contact">
                    <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td><input type="text" placeholder="First Name" name="first_name" required=""/></td>
                                <td style="width: 15px"></td>
                                <td><input type="text" placeholder="Last Name" name="last_name" required=""/></td>
                            </tr>
                            <tr>
                                <td colspan="3"><br></td>
                            </tr>
                            <tr>
                                <td><input type="email" placeholder="Email" name="email" value="<jsp:expression>email</jsp:expression>" required=""/></td>
                                <td style="width: 5px"></td>
                                <td><input type="number" placeholder="Phone" name="phone" required=""/></td>
                            </tr>
                            <tr>
                                <td colspan="3"><br></td>
                            </tr>
                            <tr>
                                <td colspan="3"><input type="text" placeholder="Address" name="address" required=""/></td>
                            </tr>
                            <tr>
                                <td colspan="3"><br></td>
                            </tr>
                            <tr>
                                <td colspan="3"><textarea rows="4" placeholder="Enter your message here" name="message"></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="3"><br></td>
                            </tr>
                            <tr>
                                <td colspan="3"><input type="submit" name="submit_btn" value="Submit" class="btn btn-2" style="width: auto;"/></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <br>
            </div>

        </div>
    </body>
</html>
