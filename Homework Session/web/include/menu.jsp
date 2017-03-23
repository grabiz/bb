<%--
    Document   : menu
    Created on : Mar 1, 2017, 7:46:03 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            a{
                padding-right: 10px;
            }
        </style>
    </head>
    <body>
        <%-- dùng để lấy đường dẫn  --%>
        <%
            // request.getScheme() : lấy http hoặc https
            String scheme = request.getScheme() + "://";
            // request.getServerName() : lấy domain
            String serverName = request.getServerName();
            // request.getServerPort() : lấy port
            String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
            // request.getContextPath() : lấy tên project
            String contexPath = request.getContextPath();
            String url = scheme + serverName + serverPort + contexPath;

            String home = url + "/jsp/loginSuccess.jsp";
            // chuyển qua trang logout
            String logout = url + "/jsp/logout.jsp";


        %>

        <a href="<%=home%>">Home</a>
        <a href="<%=logout%>">Log out</a>

    </body>
</html>
