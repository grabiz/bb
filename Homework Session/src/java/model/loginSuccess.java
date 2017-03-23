package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginSuccess")

public class loginSuccess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // lấy giá trị trong form login
        String id = req.getParameter("id");
        String pass = req.getParameter("password");
        String checkss = req.getParameter("remember");

        // nếu đã check remember thì tạo session
        if (checkss != null) {
            //  khai báo session
//            HttpSession sessionlogin = req.getSession();
//            // gán giá trị vào trong session đã tạo
//            sessionlogin.setAttribute("id", id);
//            sessionlogin.setAttribute("pass", pass);

            Cookie ckid = new Cookie("id", id);
            Cookie ckpass = new Cookie("pass", pass);
            resp.addCookie(ckid);
            resp.addCookie(ckpass);

        }

        // gán giá trị vào req để forward file jsp
        req.setAttribute("id", id);
        req.setAttribute("pass", pass);

        String url = "/jsp/loginSuccess.jsp";

        getServletContext().getRequestDispatcher(url).forward(req, resp);
    }

}
