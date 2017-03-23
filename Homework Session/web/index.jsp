<%--
    Document   : newjsp
    Created on : Mar 1, 2017, 7:39:33 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%

//            // lấy giá trị trong session
//            HttpSession sessionlogin = request.getSession();
//            String id = (String) sessionlogin.getAttribute("id");
//            String pass = (String) sessionlogin.getAttribute("id");
            //
            // kiểm tra nếu session đã được tạo thì forward sang trang loginsuccess.jsp
//            if ((id != null && pass != null)) {
//                String url = "/jsp/loginSuccess.jsp";
//
//                getServletContext().getRequestDispatcher(url).forward(request, response);
//            }
            //
            // Kiểm tra giá trị trong cookie
            Cookie[] cookies = request.getCookies();
            String nameID = "id";
            String id = "";
            String namePass = "pass";
            String pass = "";
            for (Cookie ck : cookies) {
                if (nameID.equalsIgnoreCase(ck.getName())) {
                    id = ck.getValue();
                }
                if (namePass.equalsIgnoreCase(ck.getName())) {
                    pass = ck.getValue();
                }
            }

            // kiểm tra nếu cookies đã được tạo thì forward sang trang loginsuccess.jsp
            if (!id.isEmpty() && !pass.isEmpty()) {
                String url = "/jsp/loginSuccess.jsp";

                getServletContext().getRequestDispatcher(url).forward(request, response);
            }
        %>
        <form method="post" name="login" id="formlogin" action="loginSuccess">
            <h2 style="text-align: center; color: white">Login</h2>
            <input type="text" name="id" placeholder="Enter an account name or email" class="tflogin"><br>
            <input type="password" name="password" placeholder="Password" class="tflogin"><br>
            <input type="checkbox" name="remember" value="on" checked>Remember me<br>
            <input type="submit" name="buttonlogin" id="buttonlogin" value="LOGIN">
            <a href="#">Forgot Password?</a>
        </form>
    </body>
</html>
