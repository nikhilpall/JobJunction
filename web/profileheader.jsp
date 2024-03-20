<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("full_name");
    String profile_url = (String) session.getAttribute("profile_url");
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"/>
        <link href="css/media.css" rel="stylesheet"/>
    </head>
    <body>
        <header>
            <!-- =========================== navbar starts ================================= -->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark nav" style="padding: 15px 30px;">
                <div class="container-fluid">
                    <a href="index.jsp" class="logo"><span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" width="40" height="40" x="0" y="0" viewBox="0 0 64 64" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path fill="#e39854" d="m20 33 4 4 4-4 12.986 2.164A6 6 0 0 1 46 41.083V62H2V41.083a5.999 5.999 0 0 1 5.014-5.918z" data-original="#e39854" class=""></path><path fill="#606060" d="M61 62H33a1 1 0 0 1-1-1V41a1 1 0 0 1 1-1h28a1 1 0 0 1 1 1v20a1 1 0 0 1-1 1z" data-original="#606060" class=""></path><path fill="#8c8787" d="M32 57.625c.066.001.13.01.197.01 10.132 0 18.449-7.744 19.373-17.635H33a1 1 0 0 0-1 1z" data-original="#8c8787"></path><path fill="#d5cec2" d="M62 44a6 6 0 0 1-6 6H38a6 6 0 0 1-6-6v-3a1 1 0 0 1 1-1h28a1 1 0 0 1 1 1z" data-original="#d5cec2" class=""></path><path fill="#e7e4dd" d="M51.57 40H33a1 1 0 0 0-1 1v3a6 6 0 0 0 6 6h9.629a19.34 19.34 0 0 0 3.941-10z" data-original="#e7e4dd" class=""></path><path fill="#d5cec2" d="M62 58v3a1 1 0 0 1-1 1H33a1 1 0 0 1-1-1v-3zM22 35l-1 3 2 3h2l2-3-1-3" data-original="#d5cec2" class=""></path><path fill="#fadfb2" d="m31 11-1.6 1.2a9.004 9.004 0 0 1-10.8 0L17 11l-2 4v6c0 3.532 2.039 6.58 5 8.053V33l4 4 4-4v-3.947c2.961-1.474 5-4.522 5-8.053v-6z" data-original="#fadfb2" class=""></path><path fill="#c18e59" d="m33 16 1.151-2.667a7.078 7.078 0 0 0-3.566-9.245l-2.79-1.271a9.091 9.091 0 0 0-9.218 1l-1.723 1.301a5.227 5.227 0 0 0-3.57 7.449L15 16v-1l2-4 1.6 1.2a9.004 9.004 0 0 0 10.8 0L31 11l2 4z" data-original="#c18e59"></path><path fill="#efbe9a" d="M15 16h-2a2 2 0 1 0 0 4h2M33 16h2a2 2 0 1 1 0 4h-2" data-original="#efbe9a"></path><path fill="#c16b3f" d="M11 43.999h2v17.999h-2z" data-original="#c16b3f" class=""></path><path fill="#e7e4dd" d="m25 41 2 5-3 13-3-13 2-5" data-original="#e7e4dd" class=""></path><path fill="#f2c351" d="M47 54a2 2 0 0 1-2-2v-6h4v6a2 2 0 0 1-2 2z" data-original="#f2c351" class=""></path><path fill="#8c8787" d="m53 39.999-.001-4a1 1 0 0 0-1-1H42a1 1 0 0 0-1 1v3.999l-2 .001v-4c0-1.654 1.346-3 3-3h9.999c1.654 0 3 1.346 3 3L55 39.998z" data-original="#8c8787"></path><path fill="#f7d881" d="M49 47.962V46h-4v6c0 .243.05.473.129.689A19.524 19.524 0 0 0 49 47.962z" data-original="#f7d881" class=""></path><path d="M61 39h-6v-3c0-1.654-1.346-3-3-3H42c-.862 0-1.635.371-2.182.955L29 32.152v-2.506c2.984-1.732 5-4.955 5-8.646h1a3.004 3.004 0 0 0 2.999-3c0-1.654-1.345-3-2.999-3h-.48l.548-1.271a8.097 8.097 0 0 0-.491-7.356 8.044 8.044 0 0 0-3.579-3.195l-2.791-1.271c-3.292-1.5-7.336-1.062-10.231 1.11L16.399 4.2l.002.003a6.259 6.259 0 0 0-3.783 2.821 6.197 6.197 0 0 0-.23 5.99L13.382 15H13c-1.654 0-3 1.346-3 3a3.004 3.004 0 0 0 3 3h1c0 3.692 2.016 6.915 5 8.647v2.506L6.849 34.177A6.978 6.978 0 0 0 1 41.082v20.916a1 1 0 0 0 1 1H60.999c1.103 0 2-.896 2-2V41A2 2 0 0 0 61 39zm0 4.999a5.006 5.006 0 0 1-5.001 4.999h-6v-2.999a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v2.999h-6a5.005 5.005 0 0 1-5-4.994V41h28zm-28 4.889a6.977 6.977 0 0 0 5 2.11h6V52c0 1.653 1.346 2.998 3 2.998s3-1.345 3-2.998v-1.002h6a6.978 6.978 0 0 0 5.001-2.111l.001 8.112H33zM46 52v-5.001h2V52a1 1 0 0 1-1 .998h-.001A1 1 0 0 1 46 52zm-5-15.805A4.999 4.999 0 0 1 44.53 39H41zM53 36v3h-6.331a7.004 7.004 0 0 0-3.238-4H52c.551 0 1 .448 1 1zM35.999 18A1 1 0 0 1 35 19h-1v-2h1a1 1 0 0 1 .999 1zM14.334 8.053A4.248 4.248 0 0 1 17.96 6a4.67 4.67 0 0 1 3.893 2.083l.314.471 1.665-1.109-.314-.471a6.662 6.662 0 0 0-3.772-2.725c2.264-1.404 5.199-1.63 7.634-.523l2.791 1.271a6.05 6.05 0 0 1 2.692 2.404 6.094 6.094 0 0 1 .37 5.535l-.068.158-1.27-2.541a.996.996 0 0 0-.665-.526 1.013 1.013 0 0 0-.83.173l-1.6 1.2C27.423 12.432 25.719 13 24 13s-3.424-.568-4.8-1.601l-1.6-1.2a1 1 0 0 0-1.495.353l-1.356 2.711-.572-1.144c-.65-1.3-.591-2.82.157-4.066zM13 19a1 1 0 0 1 0-2h1v2zm3 2v-5.764l1.358-2.717L18 13c1.72 1.29 3.851 2 6 2s4.28-.71 6-2l.641-.481L32 15.236V21c0 4.411-3.589 8-8 8-4.412 0-8-3.589-8-8zm8 10a9.986 9.986 0 0 0 3-.461v2.047l-3 3-3-3v-2.047A9.986 9.986 0 0 0 24 31zm-.323 10.999h.646l1.633 4.08L24 54.552l-1.956-8.473zm2.219-4.147-1.432 2.147h-.929l-1.432-2.147.333-1.001.856.856a.997.997 0 0 0 .708.292.996.996 0 0 0 .707-.292l.856-.856zM12.999 60.998V43.999h-2v16.999H3V41.082a4.985 4.985 0 0 1 4.177-4.932l12.479-2.079 1.199 1.199-.804 2.413a1 1 0 0 0 .116.871l1.708 2.562-1.804 4.51a.999.999 0 0 0-.046.597l3 13a1 1 0 0 0 1.949 0l3-13a1 1 0 0 0-.046-.597l-1.804-4.51 1.708-2.562a1 1 0 0 0 .116-.871l-.804-2.413 1.199-1.199 10.672 1.778c-.002.051-.015.099-.015.151v3h-6c-1.103 0-2 .896-2 2v19.998zm21 0H33v-2h28.001v2z" fill="#000000" data-original="#000000" class=""></path></g></svg></span><span style="color: #E39854; vertical-align: middle;"> JobJunction</span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav m-auto mb-2 mb-lg-0 my-nav-items">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="about_us.jsp">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="contact_us.jsp">Contact Us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="search_jobs.jsp">Search Jobs</a>
                            </li>
                        </ul>
                        <ul class="login-register navbar-nav mb-2 mb-lg-0">
                            <li>
                                <span style="display: flex;"><img src="profile_pics/<jsp:expression>profile_url</jsp:expression>" height="32" width="32" style="border-radius: 50%;"/> <span class="user-name-text ms-1"><span onclick="openPopup()"><jsp:expression>name</jsp:expression></span></span> <span class="user-name-text-mobile ms-1 display-none"><jsp:expression>name</jsp:expression></span></span>
                                <br>
                                <span class="display-none"><a href="profile.jsp">View Profile</a> <a href="logout" style="float: right;">Logout</a></span>
                            </li>
                        </ul>
                    </div>
                </div>
                            <div class="logout-pop-up-div bg-dark" id="pop-up">
                                <a href="profile.jsp">View Profile</a> <br>
                                <a href="logout">Logout</a>
                            </div>
            </nav>
            <!-- =========================== navbar ends ================================= -->
        </header>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>	
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="js/jquery.js"></script>
        <script>
            function openPopup(){
                if(document.getElementById('pop-up').style.display === 'block'){
                    document.getElementById('pop-up').style.display = 'none';
                }
                else{
                    document.getElementById('pop-up').style.display = 'block';
                }
            }
        </script>
    </body>
</html>