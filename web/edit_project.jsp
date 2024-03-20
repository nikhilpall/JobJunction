

<%@page import="com.nikhil.connection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.SQLException, java.sql.ResultSet"%>
<jsp:scriptlet>
    // session details :
    String full_name = (String) session.getAttribute("full_name");
    String id = request.getParameter("project_id");
    String title = "";
    String about = "";
    String start_date = "";
    String end_date = "";
    
    Connection con = null;
    try{
        con = DbConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from users_projects where id=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            title = rs.getString("title");
            about = rs.getString("about");
            start_date = rs.getString("start_date");
            end_date = rs.getString("end_date");
        }
    }
    catch(SQLException e){
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
        <title>JobJunction - <jsp:expression>full_name</jsp:expression>(add project)</title>
        </head>
        <body>
            <header><jsp:include page="profileheader.jsp"></jsp:include></header>
            <main class="profile-section">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="edit-profile-form">
                            <form method="POST" action="update_project">
                                <input type="hidden" name="project_id" value="<jsp:expression>id</jsp:expression>"/>
                                <table>
                                    <tr>
                                        <td colspan="2" style="padding: 15px 30px; text-align: center;"><h1>Add Project</h1></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><br><br></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Title<span style="color: red;"> *</span></b></td>
                                        <td><input type="text" placeholder="Project Title" name="project_title" value="<jsp:expression>title</jsp:expression>" required=""/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>About<span style="color: red;"> *</span></b></td>
                                        <td><textarea id="id" name="project_about" rows="5" cols="50" placeholder="About Project" required=""><jsp:expression>about</jsp:expression></textarea></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Project Start Date<span style="color: red;"> *</span></b></td>
                                        <td><input type="date" name="project_start_date" required="" value="<jsp:expression>start_date</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Project End Date<span style="color: red;"> *</span></b></td>
                                        <td><input type="date" name="project_end_date" required="" value="<jsp:expression>end_date</jsp:expression>"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center; padding-top: 20px !important;"><input type="submit" class="btn btn-primary" value="Save"/></td>
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


