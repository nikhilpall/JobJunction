

<%@page import="com.nikhil.backend.PathDetails"%>
<%@page import="java.io.File"%>
<%@page import="com.nikhil.connection.DbConnection"%>
<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    // session details :
    String full_name = (String) session.getAttribute("full_name");
    String account_name = (String) session.getAttribute("account_name");
    String u_gender = (String) session.getAttribute("u_gender");
    String u_city = (String) session.getAttribute("u_city");
    String about = (String) session.getAttribute("about");
    String user_field = (String) session.getAttribute("field");
    String email_id = (String) session.getAttribute("email_id");
    String dob = (String) session.getAttribute("dob");
    String mobile = (String) session.getAttribute("mobile");
    String address = (String) session.getAttribute("address");

    String profile_url = (String) session.getAttribute("profile_url");
    String resume_url = (String) session.getAttribute("resume_url");

    String resume_builder_url = email_id + ".pdf";

    if (about == ("not available")) {
        about = "";
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
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <main class="profile-section">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10" style="padding: 0px !important;">
                    <div class="row">
                        <div class="col-md-4" style="padding: 0px !important;">
                            <div class="row">
                                <div class="profile-image-div">
                                    <img src="profile_pics/<jsp:expression>profile_url</jsp:expression>" height="100" width="100" style="border-radius: 100%;"/>
                                    <h5 style="font-weight: bolder;"><jsp:expression>account_name</jsp:expression></h5>
                                    <p class="designation-company"><jsp:expression>about</jsp:expression></p>
                                        <a href="edit_my_profile.jsp" class="btn btn-primary edit-button">Edit Profile</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mt-3 social-media-details-div">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="social-media-headings"><span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="15" height="15" x="0" y="0" viewBox="0 0 511.999 511.999" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M437.019 74.981C388.667 26.628 324.38 0 256 0 187.62 0 123.332 26.628 74.981 74.98 26.628 123.332 0 187.62 0 256s26.628 132.667 74.981 181.019c48.351 48.352 112.639 74.98 181.019 74.98 68.381 0 132.667-26.628 181.02-74.981C485.371 388.667 512 324.379 512 255.999s-26.629-132.667-74.981-181.018zM96.216 96.216c22.511-22.511 48.938-39.681 77.742-50.888-7.672 9.578-14.851 20.587-21.43 32.969-7.641 14.38-14.234 30.173-19.725 47.042-19.022-3.157-36.647-7.039-52.393-11.595a230.423 230.423 0 0 1 15.806-17.528zm-33.987 43.369c18.417 5.897 39.479 10.87 62.461 14.809-6.4 27.166-10.167 56.399-11.066 86.591H30.536c2.36-36.233 13.242-70.813 31.693-101.4zm-1.635 230.053c-17.455-29.899-27.769-63.481-30.059-98.623h83.146c.982 29.329 4.674 57.731 10.858 84.186-23.454 3.802-45.045 8.649-63.945 14.437zm35.622 46.146a229.917 229.917 0 0 1-17.831-20.055c16.323-4.526 34.571-8.359 54.214-11.433 5.53 17.103 12.194 33.105 19.928 47.662 7.17 13.493 15.053 25.349 23.51 35.505-29.61-11.183-56.769-28.629-79.821-51.679zm144.768 62.331c-22.808-6.389-44.384-27.217-61.936-60.249-6.139-11.552-11.531-24.155-16.15-37.587 24.73-2.722 51.045-4.331 78.086-4.709v102.545zm0-132.578c-29.988.409-59.217 2.292-86.59 5.507-6.038-24.961-9.671-51.978-10.668-80.028h97.259v74.521zm0-104.553h-97.315c.911-28.834 4.602-56.605 10.828-82.201 27.198 3.4 56.366 5.468 86.487 6.06v76.141zm0-106.176c-27.146-.547-53.403-2.317-77.958-5.205 4.591-13.292 9.941-25.768 16.022-37.215 17.551-33.032 39.128-53.86 61.936-60.249v102.669zm209.733 6.372c17.874 30.193 28.427 64.199 30.749 99.804h-83.088c-.889-29.844-4.584-58.749-10.85-85.647 23.133-3.736 44.456-8.489 63.189-14.157zm-34.934-44.964a230.122 230.122 0 0 1 16.914 18.91c-16.073 4.389-33.972 8.114-53.204 11.112-5.548-17.208-12.243-33.305-20.02-47.941-6.579-12.382-13.758-23.391-21.43-32.969 28.802 11.207 55.23 28.377 77.74 50.888zm-144.767 174.8h97.259c-1.004 28.268-4.686 55.49-10.81 80.612-27.194-3.381-56.349-5.43-86.449-6.006v-74.606zm0-30.032v-76.041c30.005-.394 59.257-2.261 86.656-5.464 6.125 25.403 9.756 52.932 10.659 81.505h-97.315zm-.002-208.845h.001c22.808 6.389 44.384 27.217 61.936 60.249 6.178 11.627 11.601 24.318 16.24 37.848-24.763 2.712-51.108 4.309-78.177 4.674V32.139zm.002 445.976V375.657c27.12.532 53.357 2.286 77.903 5.156-4.579 13.232-9.911 25.654-15.967 37.053-17.552 33.032-39.128 53.86-61.936 60.249zm144.767-62.331c-23.051 23.051-50.21 40.496-79.821 51.678 8.457-10.156 16.34-22.011 23.51-35.504 7.62-14.341 14.198-30.088 19.68-46.906 19.465 3.213 37.473 7.186 53.515 11.859a230.268 230.268 0 0 1-16.884 18.873zm34.823-44.775c-18.635-5.991-40-11.032-63.326-15.01 6.296-26.68 10.048-55.36 11.041-84.983h83.146c-2.328 35.678-12.918 69.753-30.861 99.993z" fill="#000000" data-original="#000000" class=""></path></g></svg></span> Website</td>
                                                <td id="web_details" class="social-media-detail"><a href="<jsp:expression>website</jsp:expression>" target="_blank" style="text-decoration: none; color:green;">visit website</a></td>
                                            </tr>
                                            <tr>
                                                <td class="social-media-headings"><span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="15" height="15" x="0" y="0" viewBox="0 0 24 24" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M16.24 22a1 1 0 0 1-1-1v-2.6a2.15 2.15 0 0 0-.54-1.66 1 1 0 0 1 .61-1.67C17.75 14.78 20 14 20 9.77a4 4 0 0 0-.67-2.22 2.75 2.75 0 0 1-.41-2.06 3.71 3.71 0 0 0 0-1.41 7.65 7.65 0 0 0-2.09 1.09 1 1 0 0 1-.84.15 10.15 10.15 0 0 0-5.52 0 1 1 0 0 1-.84-.15 7.4 7.4 0 0 0-2.11-1.09 3.52 3.52 0 0 0 0 1.41 2.84 2.84 0 0 1-.43 2.08 4.07 4.07 0 0 0-.67 2.23c0 3.89 1.88 4.93 4.7 5.29a1 1 0 0 1 .82.66 1 1 0 0 1-.21 1 2.06 2.06 0 0 0-.55 1.56V21a1 1 0 0 1-2 0v-.57a6 6 0 0 1-5.27-2.09 3.9 3.9 0 0 0-1.16-.88 1 1 0 1 1 .5-1.94 4.93 4.93 0 0 1 2 1.36c1 1 2 1.88 3.9 1.52a3.89 3.89 0 0 1 .23-1.58c-2.06-.52-5-2-5-7a6 6 0 0 1 1-3.33.85.85 0 0 0 .13-.62 5.69 5.69 0 0 1 .33-3.21 1 1 0 0 1 .63-.57c.34-.1 1.56-.3 3.87 1.2a12.16 12.16 0 0 1 5.69 0c2.31-1.5 3.53-1.31 3.86-1.2a1 1 0 0 1 .63.57 5.71 5.71 0 0 1 .33 3.22.75.75 0 0 0 .11.57 6 6 0 0 1 1 3.34c0 5.07-2.92 6.54-5 7a4.28 4.28 0 0 1 .22 1.67V21a1 1 0 0 1-.94 1z" data-name="Layer 2" fill="#000000" data-original="#000000"></path></g></svg></span> Github</td>
                                                <td id="git_details" class="social-media-detail"><a href="<jsp:expression>github</jsp:expression>" target="_blank" style="text-decoration: none; color:green;">visit profile</a></td>
                                            </tr>
                                            <tr>
                                                <td class="social-media-headings"><span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="14" height="14" x="0" y="0" viewBox="0 0 24 24" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><g fill="#0077b5"><path d="M23.994 24v-.001H24v-8.802c0-4.306-.927-7.623-5.961-7.623-2.42 0-4.044 1.328-4.707 2.587h-.07V7.976H8.489v16.023h4.97v-7.934c0-2.089.396-4.109 2.983-4.109 2.549 0 2.587 2.384 2.587 4.243V24zM.396 7.977h4.976V24H.396zM2.882 0C1.291 0 0 1.291 0 2.882s1.291 2.909 2.882 2.909 2.882-1.318 2.882-2.909A2.884 2.884 0 0 0 2.882 0z" fill="#0077b5" data-original="#0077b5" class=""></path></g></g></svg></span> Linkdin</td>
                                                <td id="linkdin_details" class="social-media-detail"><a href="<jsp:expression>linkdin</jsp:expression>" target="_blank" style="text-decoration: none; color:green;">visit profile</a></td>
                                            </tr>
                                            <tr>
                                                <td class="social-media-headings"><span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="15" height="15" x="0" y="0" viewBox="0 0 100 100" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path fill="#1da1f3" d="M90 25.195a34.194 34.194 0 0 1-9.45 2.59c3.4-2.03 5.995-5.22 7.215-9.065-3.17 1.89-6.67 3.225-10.4 3.97a16.435 16.435 0 0 0-11.98-5.19c-9.08 0-16.39 7.37-16.39 16.405 0 1.3.11 2.55.38 3.74-13.635-.665-25.7-7.2-33.805-17.155-5.796 10.443.68 19.005 5.04 21.92-2.635-.05-5.22-.815-7.41-2.02 0 8.141 5.685 14.77 13.14 16.295-1.63.541-5.191.835-7.405.26C21.06 63.44 27.09 68.215 34.26 68.37c-5.58 4.365-13.803 7.923-24.26 6.77 7.265 4.685 15.875 7.36 25.16 7.36 30.18 0 46.68-25 46.68-46.67 0-.725-.025-1.425-.06-2.12 3.255-2.31 5.99-5.195 8.22-8.515z" data-original="#1da1f3" class=""></path></g></svg></span> Twitter</td>
                                                <td id="twitter_details" class="social-media-detail"><a href="<jsp:expression>twitter</jsp:expression>" target="_blank" style="text-decoration: none; color:green;">visit profile </a></td>
                                            </tr>
                                            <tr>
                                                <td class="social-media-headings"><span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="15" height="15" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><linearGradient id="a" x1="42.966" x2="469.034" y1="469.03" y2="42.962" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#ffd600"></stop><stop offset=".5" stop-color="#ff0100"></stop><stop offset="1" stop-color="#d800b9"></stop></linearGradient><linearGradient id="b" x1="163.043" x2="348.954" y1="348.954" y2="163.043" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#ff6400"></stop><stop offset=".5" stop-color="#ff0100"></stop><stop offset="1" stop-color="#fd0056"></stop></linearGradient><linearGradient id="c" x1="370.929" x2="414.373" y1="141.068" y2="97.624" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#f30072"></stop><stop offset="1" stop-color="#e50097"></stop></linearGradient><path fill="url(#a)" d="M510.46 150.453c-1.245-27.25-5.573-45.86-11.901-62.14a125.466 125.466 0 0 0-29.528-45.344 125.503 125.503 0 0 0-45.344-29.535c-16.285-6.325-34.89-10.649-62.14-11.887C334.247.297 325.523 0 256 0s-78.246.297-105.547 1.54c-27.25 1.245-45.855 5.573-62.14 11.901A125.466 125.466 0 0 0 42.968 42.97a125.488 125.488 0 0 0-29.535 45.34c-6.325 16.285-10.649 34.894-11.887 62.14C.297 177.754 0 186.473 0 255.996c0 69.527.297 78.25 1.547 105.55 1.242 27.247 5.57 45.856 11.898 62.142a125.451 125.451 0 0 0 29.528 45.34 125.433 125.433 0 0 0 45.343 29.527c16.282 6.332 34.891 10.656 62.141 11.902 27.305 1.246 36.023 1.54 105.547 1.54 69.523 0 78.246-.294 105.547-1.54 27.25-1.246 45.855-5.57 62.14-11.902a130.879 130.879 0 0 0 74.868-74.868c6.332-16.285 10.656-34.894 11.902-62.14C511.703 334.242 512 325.523 512 256c0-69.527-.297-78.246-1.54-105.547zM464.38 359.45c-1.137 24.961-5.309 38.516-8.813 47.535a84.775 84.775 0 0 1-48.586 48.586c-9.02 3.504-22.574 7.676-47.535 8.813-26.988 1.234-35.086 1.492-103.445 1.492-68.363 0-76.457-.258-103.45-1.492-24.956-1.137-38.51-5.309-47.534-8.813a79.336 79.336 0 0 1-29.434-19.152 79.305 79.305 0 0 1-19.152-29.434c-3.504-9.02-7.676-22.574-8.813-47.535-1.23-26.992-1.492-35.09-1.492-103.445 0-68.36.262-76.453 1.492-103.45 1.14-24.96 5.309-38.515 8.813-47.534a79.367 79.367 0 0 1 19.152-29.438 79.261 79.261 0 0 1 29.438-19.148c9.02-3.508 22.574-7.676 47.535-8.817 26.992-1.23 35.09-1.492 103.445-1.492h-.004c68.356 0 76.453.262 103.45 1.496 24.96 1.137 38.511 5.309 47.534 8.813a79.375 79.375 0 0 1 29.434 19.148 79.261 79.261 0 0 1 19.149 29.438c3.507 9.02 7.68 22.574 8.816 47.535 1.23 26.992 1.492 35.09 1.492 103.445 0 68.36-.258 76.453-1.492 103.45zm0 0" data-original="url(#a)" class=""></path><path fill="url(#b)" d="M255.996 124.54c-72.601 0-131.457 58.858-131.457 131.46s58.856 131.457 131.457 131.457c72.606 0 131.461-58.855 131.461-131.457s-58.855-131.46-131.46-131.46zm0 216.792c-47.125-.004-85.332-38.207-85.328-85.336 0-47.125 38.203-85.332 85.332-85.332 47.129.004 85.332 38.207 85.332 85.332 0 47.129-38.207 85.336-85.336 85.336zm0 0" data-original="url(#b)"></path><path fill="url(#c)" d="M423.371 119.348c0 16.965-13.754 30.718-30.719 30.718-16.968 0-30.722-13.754-30.722-30.718 0-16.97 13.754-30.723 30.722-30.723 16.965 0 30.72 13.754 30.72 30.723zm0 0" data-original="url(#c)"></path></g></svg></span> Instagram</td>
                                                <td id="insta_details" class="social-media-detail"><a href="<jsp:expression>insta</jsp:expression>" target="_blank" style="text-decoration: none; color:green;">visit profile</a></td>
                                            </tr>
                                            <tr>
                                                <td class="social-media-headings"><span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="15" height="15" x="0" y="0" viewBox="0 0 100 100" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path fill="#3d6ad6" d="M40.437 55.166c-.314 0-6.901.002-9.939-.001-1.564-.001-2.122-.563-2.122-2.137a9807.51 9807.51 0 0 1 0-12.129c.001-1.554.591-2.147 2.135-2.148 3.038-.002 9.589-.001 9.926-.001v-8.802c.002-3.974.711-7.778 2.73-11.261 2.067-3.565 5.075-6.007 8.93-7.419 2.469-.905 5.032-1.266 7.652-1.268 3.278-.002 6.556.001 9.835.007 1.409.002 2.034.625 2.037 2.044.006 3.803.006 7.606 0 11.408-.002 1.434-.601 2.01-2.042 2.026-2.687.029-5.376.011-8.06.119-2.711 0-4.137 1.324-4.137 4.13-.065 2.968-.027 5.939-.027 9.015.254 0 7.969-.001 11.575 0 1.638 0 2.198.563 2.198 2.21 0 4.021-.001 8.043-.004 12.064-.001 1.623-.527 2.141-2.175 2.142-3.606.002-11.291.001-11.627.001v32.545c0 1.735-.546 2.288-2.258 2.288H42.541c-1.513 0-2.103-.588-2.103-2.101l-.001-32.732z" data-original="#3d6ad6"></path></g></svg></span> Facebook</td>
                                                <td id="facebook_details" class="social-media-detail"><a href="<jsp:expression>facebook</jsp:expression>" target="_blank" style="text-decoration: none; color:green;">visit profile</a></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mt-3 social-media-details-div resume-div">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="resume-buttons"><a href="add_resume.jsp" class="btn btn-primary btn-1">Add Resume</a></td>
                                                <td class="resume-buttons"><a href="create_resume.jsp" class="btn btn-primary btn-3">Create Resume</a></td>
                                            </tr>
                                            <tr style="text-align: center;">
                                            <jsp:scriptlet>
                                                    File f2 = new File(PathDetails.RESUME_PATH + resume_url);
                                                    if (f2.exists()) {
                                            </jsp:scriptlet>
                                            <td style="overflow: hidden;"><span></span></td>
                                                    <jsp:scriptlet>
                                                        }
                                                    </jsp:scriptlet>
                                                    <jsp:scriptlet>
                                                    File f = new File(PathDetails.RESUME_BUILDER + email_id + ".pdf");
                                                    if (f.exists()) {
                                                    </jsp:scriptlet>
                                            <td style="overflow: hidden;"><span></span></td>
                                                    <jsp:scriptlet>
                                                        }
                                                    </jsp:scriptlet>
                                        </tr>
                                        <tr>
                                            <jsp:scriptlet>
                                                    File f4 = new File(PathDetails.RESUME_PATH + resume_url);
                                                    if (f4.exists()) {
                                            </jsp:scriptlet>
                                            <td class="resume-buttons"><a href="download_resume?file_name=<jsp:expression>resume_url</jsp:expression>" style="text-decoration: none;"><b>Download added resume</b></a></td>
                                            <jsp:scriptlet>
                                                        }
                                            </jsp:scriptlet>
                                            <jsp:scriptlet>
                                                    File f1 = new File(PathDetails.RESUME_BUILDER + email_id + ".pdf");
                                                    if (f1.exists()) {
                                            </jsp:scriptlet>
                                            <td class="resume-buttons"><a href="download_resume_builder?file_name=<jsp:expression>resume_builder_url</jsp:expression>" style="text-decoration: none;"><b>Download created resume</b></a></td>
                                            <jsp:scriptlet>
                                                        }
                                            </jsp:scriptlet>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 ps-3">
                            <div class="row">
                                <div class="profile-details-div mt-3">
                                    <table>
                                        <tr>
                                            <td><h5><b>Basic details</b></h5></td>
                                            <td style="float: right;"><a href="edit_profile.jsp"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 492.493 492" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M304.14 82.473 33.165 353.469a10.799 10.799 0 0 0-2.816 4.949L.313 478.973a10.716 10.716 0 0 0 2.816 10.136 10.675 10.675 0 0 0 7.527 3.114 10.6 10.6 0 0 0 2.582-.32l120.555-30.04a10.655 10.655 0 0 0 4.95-2.812l271-270.977zM476.875 45.523 446.711 15.36c-20.16-20.16-55.297-20.14-75.434 0l-36.949 36.95 105.598 105.597 36.949-36.949c10.07-10.066 15.617-23.465 15.617-37.715s-5.547-27.648-15.617-37.719zm0 0" fill="#4169e1" data-original="#000000" opacity="1"></path></g></svg></a></td>
                                        </tr>
                                        <tr>
                                            <td class="table-head">Full Name  </td>
                                            <td class="table-info"><jsp:expression>full_name</jsp:expression></td>
                                            </tr>
                                            <tr>
                                                <td class="table-head">Gender  </td>
                                                <td class="table-info"><jsp:expression>u_gender</jsp:expression></td>
                                            </tr>
                                            <tr>
                                                <td class="table-head">City  </td>
                                                <td class="table-info"><jsp:expression>u_city</jsp:expression></td>
                                            </tr>
                                            <tr>
                                                <td class="table-head">Email  </td>
                                                <td class="table-info"><jsp:expression>email_id</jsp:expression></td>
                                            </tr>
                                            <tr>
                                                <td class="table-head">Date of Birth  </td>
                                                <td class="table-info"><jsp:expression>dob</jsp:expression></td>
                                            </tr>
                                            <tr>
                                                <td class="table-head">Mobile  </td>
                                                <td class="table-info"><jsp:expression>mobile</jsp:expression></td>
                                            </tr>
                                            <tr>
                                                <td class="table-head">Interested Field  </td>
                                                <td class="table-info"><jsp:expression>user_field</jsp:expression></td>
                                            </tr>
                                            <tr style="border-bottom: none !important;">
                                                <td class="table-head">Address  </td>
                                                <td class="table-info"><jsp:expression>address</jsp:expression></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!------------------------------------------------------------------------------------------------------->
                                <div class="row">
                                    <div class="profile-details-div mt-3">
                                        <table>
                                            <tr>
                                                <td><h5><b>Project details</b></h5></td>
                                                <td><a href="add_project.jsp" style="float: right;"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 448 448" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M408 184H272a8 8 0 0 1-8-8V40c0-22.09-17.91-40-40-40s-40 17.91-40 40v136a8 8 0 0 1-8 8H40c-22.09 0-40 17.91-40 40s17.91 40 40 40h136a8 8 0 0 1 8 8v136c0 22.09 17.91 40 40 40s40-17.91 40-40V272a8 8 0 0 1 8-8h136c22.09 0 40-17.91 40-40s-17.91-40-40-40zm0 0" fill="#4169e1" data-original="#000000" opacity="1"></path></g></svg></a></td>
                                            </tr>
                                        </table>
                                        <div class="row">
                                            <div class="added-education-div mt-3">
                                                <table>
                                                <jsp:declaration>
                                                    String title = "";
                                                    String about = "";
                                                    String start_date = "";
                                                    String end_date = "";
                                                    int user_id = 0;
                                                    int count = 1;
                                                </jsp:declaration>
                                                <jsp:scriptlet>
                                                    try {
                                                        con = DbConnection.getConnection();
                                                        PreparedStatement ps = con.prepareStatement("select * from users_projects where email=?");
                                                        ps.setString(1, email_id);
                                                        ResultSet rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                            user_id = rs.getInt("id");
                                                            title = rs.getString("title");
                                                            about = rs.getString("about");
                                                            start_date = rs.getString("start_date");
                                                            end_date = rs.getString("end_date");
                                                </jsp:scriptlet>
                                                <tr>
                                                    <td></td>
                                                    <td><b><h5>Project <jsp:expression>count++</jsp:expression> <span><a href="edit_project.jsp?project_id=<jsp:expression>user_id</jsp:expression>"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 512 511" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M405.332 256.484c-11.797 0-21.332 9.559-21.332 21.332v170.668c0 11.754-9.559 21.332-21.332 21.332H64c-11.777 0-21.332-9.578-21.332-21.332V149.816c0-11.754 9.555-21.332 21.332-21.332h170.668c11.797 0 21.332-9.558 21.332-21.332 0-11.777-9.535-21.336-21.332-21.336H64c-35.285 0-64 28.715-64 64v298.668c0 35.286 28.715 64 64 64h298.668c35.285 0 64-28.714 64-64V277.816c0-11.796-9.54-21.332-21.336-21.332zm0 0" fill="#4169e1" data-original="#000000" opacity="1" class=""></path><path d="M200.02 237.05a10.793 10.793 0 0 0-2.922 5.438l-15.082 75.438c-.703 3.496.406 7.101 2.922 9.64a10.673 10.673 0 0 0 7.554 3.114c.68 0 1.387-.063 2.09-.211l75.414-15.082c2.09-.43 3.988-1.43 5.461-2.926l168.79-168.79-75.415-75.41zM496.383 16.102c-20.797-20.801-54.633-20.801-75.414 0l-29.524 29.523 75.414 75.414 29.524-29.527C506.453 81.465 512 68.066 512 53.816s-5.547-27.648-15.617-37.714zm0 0" fill="#4169e1" data-original="#000000" opacity="1" class=""></path></g></svg></a></span>
                                                                <span style="float: right;"><a href="delete_project?project_id=<jsp:expression>user_id</jsp:expression>"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path fill="#fc0005" fill-rule="evenodd" d="M170.8 14.221A14.21 14.21 0 0 1 185 .014L326.991.006a14.233 14.233 0 0 1 14.2 14.223v35.117H170.8zm233.461 477.443a21.75 21.75 0 0 1-21.856 20.33H127.954a21.968 21.968 0 0 1-21.854-20.416L84.326 173.06H427.5l-23.234 318.6zm56.568-347.452H51.171v-33A33.035 33.035 0 0 1 84.176 78.2l343.644-.011a33.051 33.051 0 0 1 33 33.02v33zm-270.79 291.851a14.422 14.422 0 1 0 28.844 0V233.816a14.42 14.42 0 0 0-28.839-.01v202.257zm102.9 0a14.424 14.424 0 1 0 28.848 0V233.816a14.422 14.422 0 0 0-28.843-.01z" data-original="#fc0005" class=""></path></g></svg></a></span></h5></b><hr><b><jsp:expression>title</jsp:expression></b><br>
                                                        <span style="color: gray;"> (<jsp:expression>start_date</jsp:expression> to <jsp:expression>end_date</jsp:expression>)</span> <br>
                                                        <span><jsp:expression>about</jsp:expression></span>
                                                        </td>
                                                    </tr>
                                                    <tr style="box-shadow: none !important;">
                                                        <td colspan="3" class="empty-td"></td>
                                                    </tr>
                                                <jsp:scriptlet>
                                                        }
                                                    } catch (Exception e) {
                                                        out.print(e);
                                                    }
                                                    count = 1;
                                                </jsp:scriptlet>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!------------------------------------------------------------------------------------------------------------->
                            <div class="row">
                                <div class="profile-details-div mt-3">
                                    <table>
                                        <tr>
                                            <td><h5><b>Education details</b></h5></td>
                                            <td><a href="add_education.jsp" style="float: right;"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 448 448" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M408 184H272a8 8 0 0 1-8-8V40c0-22.09-17.91-40-40-40s-40 17.91-40 40v136a8 8 0 0 1-8 8H40c-22.09 0-40 17.91-40 40s17.91 40 40 40h136a8 8 0 0 1 8 8v136c0 22.09 17.91 40 40 40s40-17.91 40-40V272a8 8 0 0 1 8-8h136c22.09 0 40-17.91 40-40s-17.91-40-40-40zm0 0" fill="#4169e1" data-original="#000000" opacity="1"></path></g></svg></a></td>
                                        </tr>
                                    </table>
                                    <div class="row">
                                        <div class="added-education-div mt-3">
                                            <table>
                                                <jsp:declaration>
                                                    String email = "";
                                                    String school_college = "";
                                                    String education_type = "";
                                                    String field_of_study = "";
                                                    String year = "";
                                                    int id = 0;
                                                </jsp:declaration>
                                                <jsp:scriptlet>
                                                    email = (String) session.getAttribute("email_id");
                                                    try {
                                                        con = DbConnection.getConnection();
                                                        PreparedStatement ps1 = con.prepareStatement("select * from education where email=?");
                                                        ps1.setString(1, email);
                                                        ResultSet rs1 = ps1.executeQuery();
                                                        while (rs1.next()) {
                                                            id = rs1.getInt("id");
                                                            school_college = rs1.getString("school_college");
                                                            education_type = rs1.getString("education_type");
                                                            field_of_study = rs1.getString("field_of_study");
                                                            year = rs1.getString("year");
                                                </jsp:scriptlet>

                                                <tr>
                                                    <td style="text-align: center;"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="45" height="45" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M.01 451.95h511.98V512H.01zM255.998 0 .01 94.651v55.495h511.976V94.651zM37.534 180.15h75.28v241.81h-75.28zM158.087 180.15h75.28v241.81h-75.28zM278.637 180.15h75.28v241.81h-75.28zM399.187 180.15h75.28v241.81h-75.28z" fill="#000000" data-original="#000000" class=""></path></g></svg></td>
                                                    <td>
                                                        <span style="font-weight: bold;"><jsp:expression>school_college</jsp:expression></span><br>
                                                        <span><jsp:expression>education_type</jsp:expression></span> <br> <span><jsp:expression>field_of_study</jsp:expression></span> <br>
                                                        <span><jsp:expression>year</jsp:expression></span> <br>
                                                        </td>
                                                        <td style="float: right;">
                                                            <a href="edit_education.jsp?edu_id=<jsp:expression>id</jsp:expression>"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 512 511" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M405.332 256.484c-11.797 0-21.332 9.559-21.332 21.332v170.668c0 11.754-9.559 21.332-21.332 21.332H64c-11.777 0-21.332-9.578-21.332-21.332V149.816c0-11.754 9.555-21.332 21.332-21.332h170.668c11.797 0 21.332-9.558 21.332-21.332 0-11.777-9.535-21.336-21.332-21.336H64c-35.285 0-64 28.715-64 64v298.668c0 35.286 28.715 64 64 64h298.668c35.285 0 64-28.714 64-64V277.816c0-11.796-9.54-21.332-21.336-21.332zm0 0" fill="#4169e1" data-original="#000000" opacity="1" class=""></path><path d="M200.02 237.05a10.793 10.793 0 0 0-2.922 5.438l-15.082 75.438c-.703 3.496.406 7.101 2.922 9.64a10.673 10.673 0 0 0 7.554 3.114c.68 0 1.387-.063 2.09-.211l75.414-15.082c2.09-.43 3.988-1.43 5.461-2.926l168.79-168.79-75.415-75.41zM496.383 16.102c-20.797-20.801-54.633-20.801-75.414 0l-29.524 29.523 75.414 75.414 29.524-29.527C506.453 81.465 512 68.066 512 53.816s-5.547-27.648-15.617-37.714zm0 0" fill="#4169e1" data-original="#000000" opacity="1" class=""></path></g></svg></a>
                                                        <br> <br> <br> <a href="delete_education?edu_id=<jsp:expression>id</jsp:expression>"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path fill="#fc0005" fill-rule="evenodd" d="M170.8 14.221A14.21 14.21 0 0 1 185 .014L326.991.006a14.233 14.233 0 0 1 14.2 14.223v35.117H170.8zm233.461 477.443a21.75 21.75 0 0 1-21.856 20.33H127.954a21.968 21.968 0 0 1-21.854-20.416L84.326 173.06H427.5l-23.234 318.6zm56.568-347.452H51.171v-33A33.035 33.035 0 0 1 84.176 78.2l343.644-.011a33.051 33.051 0 0 1 33 33.02v33zm-270.79 291.851a14.422 14.422 0 1 0 28.844 0V233.816a14.42 14.42 0 0 0-28.839-.01v202.257zm102.9 0a14.424 14.424 0 1 0 28.848 0V233.816a14.422 14.422 0 0 0-28.843-.01z" data-original="#fc0005" class=""></path></g></svg></a>
                                                        </td>
                                                    </tr> 
                                                    <tr style="box-shadow: none !important;">
                                                        <td colspan="3" class="empty-td"></td>
                                                    </tr>

                                                <jsp:scriptlet>

                                                        }
                                                    } catch (Exception e) {
                                                        out.print(e);
                                                    } finally {
                                                        con.close();
                                                    }
                                                </jsp:scriptlet>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="padding: 0;">
                                    <div class="profile-details-div mt-3">
                                        <table>
                                            <tr>
                                                <td><h5><b>Experience details</b></h5></td>
                                                <td><a href="add_experience.jsp" style="float: right;"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 448 448" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M408 184H272a8 8 0 0 1-8-8V40c0-22.09-17.91-40-40-40s-40 17.91-40 40v136a8 8 0 0 1-8 8H40c-22.09 0-40 17.91-40 40s17.91 40 40 40h136a8 8 0 0 1 8 8v136c0 22.09 17.91 40 40 40s40-17.91 40-40V272a8 8 0 0 1 8-8h136c22.09 0 40-17.91 40-40s-17.91-40-40-40zm0 0" fill="#4169e1" data-original="#000000" opacity="1"></path></g></svg></a></td>
                                            </tr>
                                        </table>
                                        <div class="row">
                                            <div class="added-education-div mt-3">
                                                <table>
                                                    <jsp:declaration>
                                                        String company = "";
                                                        String role = "";
                                                        String location = "";
                                                        String description = "";
                                                        int exp_id = 0;
                                                    </jsp:declaration>
                                                    <jsp:scriptlet>
                                                        email = (String) session.getAttribute("email_id");
                                                        try {
                                                            con = DbConnection.getConnection();
                                                            PreparedStatement ps = con.prepareStatement("select * from experience where email=?");
                                                            ps.setString(1, email);
                                                            ResultSet rs = ps.executeQuery();
                                                            while (rs.next()) {
                                                                exp_id = rs.getInt("id");
                                                                company = rs.getString("company");
                                                                role = rs.getString("role");
                                                                location = rs.getString("location");
                                                                year = rs.getString("year");
                                                                description = rs.getString("description");
                                                    </jsp:scriptlet>
                                                    <tr>
                                                        <td style="text-align: center;"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="55" height="55" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M343.5 221.2c-48.3-48.3-126.6-48.3-174.9 0s-48.3 126.6 0 174.9 126.6 48.3 174.9 0c48.2-48.3 48.2-126.6 0-174.9zM201.7 436.5c-19.2-8.2-36.3-20.6-49.9-36.1l-31.3 54.2 31.8-5c2.7-.5 5.5.4 7.3 2.7l19.4 23.8zm158.6-36.1c-13.7 15.5-30.7 27.9-50 36.1l22.8 39.5 19.4-23.8c1.8-2.2 4.6-3.2 7.3-2.7l31.8 5zm-55-141c-27.2-27.2-71.3-27.2-98.5 0s-27.2 71.3 0 98.5 71.3 27.2 98.5 0 27.2-71.3 0-98.5zM256 223.7c46.9 0 85 38 85 85 0 46.9-38 85-85 85-46.9 0-85-38-85-85 .1-47 38.1-85 85-85zm-39.6 90.6c-2.1-3.7-.9-8.3 2.8-10.4s8.3-.9 10.4 2.8l12.2 21.1 41.8-41.8c3-3 7.9-3 10.8 0 3 3 3 7.8 0 10.8l-48.8 48.8c-3.5 3.5-9.5 2.8-12-1.6zm216.1-201.9 15.1 31.3 34.4 4.7c5.9.8 8 8 3.9 12l-25.1 24 6.2 34.2c1 5.8-5.1 10.1-10.2 7.4l-30.6-16.4-30.6 16.4c-5 2.7-11.5-1.5-10.1-7.8l6.1-33.8-25.1-24c-4.2-4-1.9-11.2 4-12l34.3-4.7 15.1-31.3c2.5-5.3 10-5.2 12.6 0zm-340.4 0 15.1 31.3 34.4 4.7c5.8.8 8 8 3.9 12l-25.1 24 6.2 34.2c1 5.8-5.1 10.1-10.1 7.4l-30.6-16.4L55.3 226c-5 2.7-11.4-1.5-10.1-7.8l6.1-33.8-25.1-24c-4.2-4-1.9-11.2 4-12l34.3-4.7 15.1-31.3c2.5-5.3 10-5.2 12.5 0zm170.2-72.5 15.1 31.3 34.4 4.7c5.8.8 8 8 3.9 12l-25.1 24 6.2 34.2c1 5.8-5.1 10.1-10.2 7.4L256 137l-30.6 16.4c-5 2.7-11.4-1.5-10.1-7.8l6.1-33.8-25.1-24c-4.2-4-1.9-11.2 4-12l34.3-4.7 15.1-31.3c2.6-5.2 10.1-5.1 12.6.1z" fill="#000000" data-original="#000000"></path></g></svg></td>
                                                        <td>
                                                            <span style="font-weight: bold;"><jsp:expression>company</jsp:expression></span><br>
                                                            <span><jsp:expression>role</jsp:expression></span> <br> 
                                                            <span><jsp:expression>location</jsp:expression></span> <br>
                                                            <span><jsp:expression>year</jsp:expression></span> <br>
                                                            </td>
                                                            <td style="float: right;">
                                                                <a href="edit_experience.jsp?exp_id=<jsp:expression>exp_id</jsp:expression>"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 512 511" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M405.332 256.484c-11.797 0-21.332 9.559-21.332 21.332v170.668c0 11.754-9.559 21.332-21.332 21.332H64c-11.777 0-21.332-9.578-21.332-21.332V149.816c0-11.754 9.555-21.332 21.332-21.332h170.668c11.797 0 21.332-9.558 21.332-21.332 0-11.777-9.535-21.336-21.332-21.336H64c-35.285 0-64 28.715-64 64v298.668c0 35.286 28.715 64 64 64h298.668c35.285 0 64-28.714 64-64V277.816c0-11.796-9.54-21.332-21.336-21.332zm0 0" fill="#4169e1" data-original="#000000" opacity="1" class=""></path><path d="M200.02 237.05a10.793 10.793 0 0 0-2.922 5.438l-15.082 75.438c-.703 3.496.406 7.101 2.922 9.64a10.673 10.673 0 0 0 7.554 3.114c.68 0 1.387-.063 2.09-.211l75.414-15.082c2.09-.43 3.988-1.43 5.461-2.926l168.79-168.79-75.415-75.41zM496.383 16.102c-20.797-20.801-54.633-20.801-75.414 0l-29.524 29.523 75.414 75.414 29.524-29.527C506.453 81.465 512 68.066 512 53.816s-5.547-27.648-15.617-37.714zm0 0" fill="#4169e1" data-original="#000000" opacity="1" class=""></path></g></svg></a>
                                                            <br> <br> <br> <a href="delete_experience?exp_id=<jsp:expression>exp_id</jsp:expression>"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="20" height="20" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path fill="#fc0005" fill-rule="evenodd" d="M170.8 14.221A14.21 14.21 0 0 1 185 .014L326.991.006a14.233 14.233 0 0 1 14.2 14.223v35.117H170.8zm233.461 477.443a21.75 21.75 0 0 1-21.856 20.33H127.954a21.968 21.968 0 0 1-21.854-20.416L84.326 173.06H427.5l-23.234 318.6zm56.568-347.452H51.171v-33A33.035 33.035 0 0 1 84.176 78.2l343.644-.011a33.051 33.051 0 0 1 33 33.02v33zm-270.79 291.851a14.422 14.422 0 1 0 28.844 0V233.816a14.42 14.42 0 0 0-28.839-.01v202.257zm102.9 0a14.424 14.424 0 1 0 28.848 0V233.816a14.422 14.422 0 0 0-28.843-.01z" data-original="#fc0005" class=""></path></g></svg></a>
                                                            </td>
                                                        </tr> 
                                                        <tr style="box-shadow: none !important;">
                                                            <td colspan="3" class="empty-td"></td>
                                                        </tr>
                                                    <jsp:scriptlet>
                                                            }
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        } finally {
                                                            con.close();
                                                        }
                                                    </jsp:scriptlet>

                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    </main>
                    <script src="js/jquery.js"></script>
                    <script>
                        let website_det = '<%= website%>';
                        let git_details = '<%= github%>';
                        let linkdin_details = '<%= linkdin%>';
                        let twitter_details = '<%= twitter%>';
                        let insta_details = '<%= insta%>';
                        let facebook_details = '<%= facebook%>';
                        
                        if (website_det === "not available" || website_det === "" || website_det === null) {
                            document.getElementById('web_details').innerHTML = '<p style="color: gray">Not Available</p>';
                        }
                        if (git_details === "not available" || git_details === "" || git_details === null) {
                            document.getElementById('git_details').innerHTML = '<p style="color: gray">Not Available</p>';
                        }
                        if (linkdin_details === "not available" || linkdin_details === "" || linkdin_details === null) {
                            document.getElementById('linkdin_details').innerHTML = '<p style="color: gray">Not Available</p>';
                        }
                        if (twitter_details === "not available" || twitter_details === "" || twitter_details === null) {
                            document.getElementById('twitter_details').innerHTML = '<p style="color: gray">Not Available</p>';
                        }
                        if (insta_details === "not available" || insta_details === "" || insta_details === null) {
                            document.getElementById('insta_details').innerHTML = '<p style="color: gray">Not Available</p>';
                        }
                        if (facebook_details === "not available" || facebook_details === "" || facebook_details === null) {
                            document.getElementById('facebook_details').innerHTML = '<p style="color: gray">Not Available</p>';
                        }
                    </script>
                    </body>
                    </html>
