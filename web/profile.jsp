<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String full_name = (String) session.getAttribute("full_name");

    if (full_name == null || full_name.isEmpty()) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - <jsp:expression>full_name</jsp:expression></title>
        </head>
        <body>
            <header><jsp:include page="profileheader.jsp"></jsp:include></header>
            <jsp:include page="profilediv.jsp"></jsp:include>
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
        <script src="js/jquery.js"></script>
    </body>
</html>
