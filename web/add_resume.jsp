

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    // session details :
    String full_name = (String) session.getAttribute("full_name");
    String profile_url = (String)session.getAttribute("profile_url");
    String email = (String) session.getAttribute("email_id");
    
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - <jsp:expression>full_name</jsp:expression>(edit profile)</title>
        </head>
        <body>
            <header><jsp:include page="profileheader.jsp"></jsp:include></header>
            <main class="profile-section">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="edit-profile-form">
                            <form method="POST" action="add_resume" enctype="multipart/form-data">
                                <table>
                                    <tr>
                                        <td style="text-align: center;"><img src="profile_pics/<jsp:expression>profile_url</jsp:expression>" height="150" width="150" style="border-radius: 50%;"/></td>
                                        <td style="padding: 15px 30px;"><h1>Upload Resume</h1><b><jsp:expression>full_name</jsp:expression></b> (<jsp:expression>email</jsp:expression>)</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><br><br></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Add Resume</b></td>
                                        <td><input type="file" name="user_resume" accept=".pdf" required=""/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;"><span style="color: red;">(NOTE : Please upload "pdf" file)</span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center; padding-top: 20px !important;"><input type="submit" class="btn btn-primary" value="Upload"/></td>
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

