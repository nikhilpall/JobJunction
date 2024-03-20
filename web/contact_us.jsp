
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JobJunction - Contact Us</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet"/>
    </head>
    <body>
        <header>
            <jsp:scriptlet>
                String email = (String) session.getAttribute("email_id");
                if (!"".equals(email) && email != null) {
            </jsp:scriptlet>
            <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
            } else {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
        </header>
        <main style="background-color: rgba(226,232,240,255);"><jsp:include page="contact_us_div.jsp"></jsp:include></main>
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </body>
</html>
