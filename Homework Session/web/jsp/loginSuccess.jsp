<%--
    Document   : loginSuccess
    Created on : Mar 1, 2017, 7:53:53 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../include/menu.jsp" />
        <%
            // kiểm tra, nếu session bây giờ mới tạo mới thì chuyển về trang login

//            HttpSession sessionlogin = request.getSession();
//            // lấy giá trị trong session
//            String id = (String) sessionlogin.getAttribute("id");
//            String pass = (String) sessionlogin.getAttribute("id");
            //
            // lấy giá trị trong request
            String idreq = (String) request.getAttribute("id");
            String passreq = (String) request.getAttribute("pass");

            // lấy giá trị trong cookie
            String id = "";
            String pass = "";
            if (idreq != null && passreq != null) {
                id = idreq;
                pass = passreq;
            }

            Cookie[] cookie = request.getCookies();
            String nameIDCookie = "id";
            String idCookie = "";
            String namePassCookie = "pass";
            String passCookie = "";
            for (Cookie i : cookie) {
                if (nameIDCookie.equalsIgnoreCase(i.getName())) {
                    idCookie = i.getValue();
                }
                if (namePassCookie.equalsIgnoreCase(i.getName())) {
                    passCookie = i.getValue();
                }
            }

//            // kiểm tra, nếu cả request và session đều không có thì chuyển qua trang login
//            if (id == null && pass == null && idreq == null && passreq == null) {
//                response.sendRedirect("../index.jsp");
//            }
            //
            // kiểm tra xem nếu cookie và req đều không có giá trị thì chuyển về trang login
            if (idCookie.isEmpty() && passCookie.isEmpty() && idreq == null && passreq == null) {
                response.sendRedirect("../index.jsp");
            }

            if (idreq == null && passreq == null) {
                id = idCookie;
                pass = passCookie;
            }

        %>
        <p>
            Hello User <br>
            <!--            dùng cho session và req-->
            <!--            ID: {id}<br>-->
            <!--            Pass: {pass}<br>-->
            <!---->
            <!--            dùng cho cookies và req-->
            ID: <%= id%> <br>
            Pass: <%= pass%> <br>
            <br>
            Session ID: ${sessionScope.id}<br>
            Session Pass: ${sessionScope.pass}<br>
            Request ID: ${requestScope.id}<br>
            Request Pass: ${requestScope.pass}<br>
            Cookie ID: ${cookie.id.value} <br>
            Cookie Pass: ${cookie.pass.value} <br>
        </p>

    </body>
</html>
