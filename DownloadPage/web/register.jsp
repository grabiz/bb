<%-- 
    Document   : register
    Created on : Mar 23, 2017, 10:28:36 AM
    Author     : NGUYEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Download Registration</h1>
        <p>To register for our downloads,enter your name and email address below.
        Then, click on the Submit Button.</p>
        <form action="download" method="post">
            <input type="hidden" name="action" value="register">
            <label>Email: &nbsp;</label><input type="email" name="email" value="${user.email}"><br>
            <label>First Name:</label><input type="text" name="firstname" value="${user.firstname}"><br>
            <label>Last Name:</label><input type="text" name="lastname" value="${user.lastname}"><br>
            <input type="submit" value="Register">
        </form>
    </body>
</html>
