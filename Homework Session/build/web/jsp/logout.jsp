<%--
    Document   : logout
    Created on : Mar 2, 2017, 5:49:01 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            String logout = url + "/index.jsp";

            // xóa các giá trị đã gán trong session
//            HttpSession sessionlogin = request.getSession();
//            sessionlogin.removeAttribute("id");
//            sessionlogin.removeAttribute("pass");
            //
            // xóa cookies
            Cookie[] cookies = request.getCookies();
            for (Cookie ck : cookies) {
                if (ck.getName().equalsIgnoreCase("id")) {
                    ck.setValue("");
                    ck.setMaxAge(0);
                    ck.setPath("/");
                    response.addCookie(ck);
                }
                if (ck.getName().equalsIgnoreCase("pass")) {
                    ck.setValue("");
                    ck.setMaxAge(0);
                    ck.setPath("/");
                    response.addCookie(ck);
                }

            }
            //
            // chuyển về trang login
            response.sendRedirect(logout);

        %>
    </body>
</html>
