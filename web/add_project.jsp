

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    // session details :
    String full_name = (String) session.getAttribute("full_name");
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - <jsp:expression>full_name</jsp:expression>(add project)</title>
        </head>
        <body>
            <header><jsp:include page="profileheader.jsp"></jsp:include></header>
            <main class="profile-section">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="edit-profile-form">
                            <form method="POST" action="add_my_project">
                                <table>
                                    <tr>
                                        <td colspan="2" style="padding: 15px 30px; text-align: center;"><h1>Add Project</h1></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><br><br></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Title<span style="color: red;"> *</span></b></td>
                                        <td><input type="text" placeholder="Project Title" name="project_title" value="" required=""/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>About<span style="color: red;"> *</span></b></td>
                                        <td><textarea id="id" name="project_about" rows="5" cols="50" placeholder="About Project" required=""></textarea></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Project Start Date<span style="color: red;"> *</span></b></td>
                                        <td><input type="date" name="project_start_date" required="" value=""/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Project End Date<span style="color: red;"> *</span></b></td>
                                        <td><input type="date" name="project_end_date" required="" value=""/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center; padding-top: 20px !important;"><input type="submit" class="btn btn-primary" value="Add"/></td>
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

