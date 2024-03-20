

<%@page import="com.nikhil.connection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>

<jsp:scriptlet>
    // session details :
    String full_name = (String) session.getAttribute("full_name");
    String account_name = (String) session.getAttribute("account_name");
    String u_city = (String) session.getAttribute("u_city");
    String about = (String) session.getAttribute("about");
    String user_field = (String) session.getAttribute("field");
    String email_id = (String) session.getAttribute("email_id");
    String dob = (String) session.getAttribute("dob");
    String mobile = (String) session.getAttribute("mobile");
    String address = (String) session.getAttribute("address");

    if (about.equals("not available") || about == null || about.equals("----------")) {
        about = "";
    }
    if (mobile.equals("----------") || mobile == null) {
        mobile = "";
    }
    if (address.equals("----------") || address == null) {
        address = "";
    }

    String website = "";
    String github = "";
    String linkdin = "";
    String twitter = "";
    String insta = "";
    String facebook = "";
    // Get user_social_details
    Connection con = null;
    try {
        con = DbConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from user_social_details where email=?");
        ps.setString(1, email_id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            website = rs.getString("website");
            github = rs.getString("github");
            linkdin = rs.getString("linkdin");
            twitter = rs.getString("twitter");
            insta = rs.getString("instagram");
            facebook = rs.getString("facebook");
        }
    } catch (Exception e) {
        out.print(e);
    } finally {
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            out.print(e);
        }
    }

    if (website.equals("not available")) {
        website = "";
    }
    if (github.equals("not available")) {
        github = "";
    }
    if (linkdin.equals("not available")) {
        linkdin = "";
    }
    if (twitter.equals("not available")) {
        twitter = "";
    }
    if (insta.equals("not available")) {
        insta = "";
    }
    if (facebook.equals("not available")) {
        facebook = "";
    }
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - <jsp:expression>full_name</jsp:expression>(edit profile)</title>
            <script>
                function validation() {
                    let name = document.edit_form.user_full_name.value;
                    let email = document.edit_form.user_email.value;
                    let city = document.edit_form.user_city.value;

                    const nameRegex = /^[A-Za-z\-']{3,19}( [A-Za-z\-']{3,19})*$/;
                    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                    if (!name.match(nameRegex)) {
                        alert("please enter valid Full Name");
                        return false;
                    } else if (name === "") {
                        alert("name can not be empty");
                        return false;
                    } else if (!email.match(emailRegex)) {
                        alert("please enter valid email id");
                        return false;
                    } else if (email === "") {
                        alert("email can not be empty");
                        return false;
                    } else if (city === "Select City") {
                        alert("please select city");
                        return false;
                    } else {
                        return true;
                    }


                }
            </script>
        </head>
        <body>
            <header><jsp:include page="profileheader.jsp"></jsp:include></header>
            <main class="profile-section">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="edit-profile-form">
                            <form method="POST" name="edit_form" onsubmit="return validation()" action="edit">
                                <table>
                                    <tr>
                                        <td colspan="2" style="text-align: center; padding-bottom: 10px;"><h1>Edit Basic Details </h1></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Full Name <span style="color: red;"> *</span></b></td>
                                        <td><input type="text" placeholder="Enter Full Name" name="user_full_name" value="<jsp:expression>full_name</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Account Name</b></td>
                                        <td><input type="text" placeholder="Enter Account Name" name="user_account_name" value="<jsp:expression>account_name</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Gender</b></td>
                                        <td>
                                            <select name="user_gender">
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>City <span style="color: red;"> *</span></b></td>
                                        <td><select name="user_city" value="<jsp:expression>u_city</jsp:expression>">
                                                <option value="Select City">Select City</option>
                                                <option value="Nagpur">Nagpur</option>
                                                <option value="Pune">Pune</option>
                                                <option value="Mumbai">Mumbai</option>
                                                <option value="Hydrabad">Hydrabad</option>
                                            </select></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>About You</b></td>
                                        <td><textarea id="id" name="user_about" rows="5" cols="50" placeholder="Write Something about you in less than 100 words.(e.g about your job designation, company name in which you are working)"><jsp:expression>about</jsp:expression></textarea></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Interested Fields</b></td>
                                        <td><input type="text" placeholder="Enter Email" name="user_field" value="<jsp:expression>user_field</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Email <span style="color: red;"> *</span></b></td>
                                        <td><input type="text" placeholder="Enter Email" readonly="" name="user_email" value="<jsp:expression>email_id</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Date of Birth</b></td>
                                        <td><input type="date" name="user_dob" value="<jsp:expression>dob</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Mobile Number</b></td>
                                        <td><input type="text" placeholder="Enter Mobile Number" name="user_mobile" value="<jsp:expression>mobile</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Address</b></td>
                                        <td><input type="text" placeholder="Enter Your Address" name="user_address" value="<jsp:expression>address</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td colspan="2"><hr></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><h4>Social Media Details </h4></td>
                                        <td></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Website url</b></td>
                                        <td><input type="text" placeholder="Enter Your Website Url" name="user_web_url" value="<jsp:expression>website</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>GitHub url</b></td>
                                        <td><input type="text" placeholder="Enter Your GiHub profile Url" name="user_github" value="<jsp:expression>github</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Linkdin url</b></td>
                                        <td><input type="text" placeholder="Enter Your Linkdin profile Url" name="user_linkdin" value="<jsp:expression>linkdin</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Twitter </b></td>
                                        <td><input type="text" placeholder="Enter Your Twitter profile Url" name="user_twitter" value="<jsp:expression>twitter</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Instagram </b></td>
                                        <td><input type="text" placeholder="Enter Your Instagram profile Url" name="user_insta" value="<jsp:expression>insta</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td><b>Facebook</b></td>
                                        <td><input type="text" placeholder="Enter Your Facebook profile Url" name="user_facebook" value="<jsp:expression>facebook</jsp:expression>"/></td>
                                    </tr>
                                    <tr class="edit-table-row">
                                        <td colspan="2"><hr></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center; padding-top: 20px !important;"><input type="submit" class="btn btn-primary" value="Save Profile"/></td>
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
