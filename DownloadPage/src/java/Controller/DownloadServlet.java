/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.User;
import Util.CookieUtil;
import Util.UserIO;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NGUYEN
 */
public class DownloadServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          
          HttpSession session = req.getSession();
          String action = req.getParameter("action");
          String productCode=req.getParameter("productCode");
          String url="";
          
          
          
          if (action==null)
          {
             action="viewAlbum";
          }
          
          if(action.equals("viewAlbum"))
          {
             url="/index.jsp";
          }
          
          else if(action.equals("checkRegister"))
          {
              if(session.getAttribute("user")==null)
              {
                  Cookie[] cookies = req.getCookies();
                  String emailCookie = CookieUtil.getCookieValue(cookies,"emailList");
                  if(emailCookie==null||emailCookie.equals(""))
                  {
                      url="/register.jsp";
                  }
                  else{
                      
                    ServletContext sc= getServletContext();
                    String realPath = sc.getRealPath("/WEB-INF/emailList.txt");
                    User user = UserIO.getUserfromPath(realPath,emailCookie);
                    session.setAttribute("user", user);
                    
                    url="/download_"+productCode+".jsp";
                  }
              
              }
              else{
                  
                  url="/download_"+productCode+".jsp";
              }
             
          }
          req.setAttribute("productCode",productCode);
          getServletContext().getRequestDispatcher(url).forward(req, resp);
    
    
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          HttpSession session = req.getSession();
          String action = req.getParameter("action");
          String url="/index.jsp";
          if(action.equals("register"))
          {
          String email=req.getParameter("email");
          String firstname= req.getParameter("firstname");
          String lastname = req.getParameter("lastname");
          
          User user = new User(email,firstname,lastname);
          ServletContext sc = getServletContext();
          String realPath = sc.getRealPath("/WEB-INF/emailList.txt");
          UserIO.addUsertoFile(realPath, user);
          
          session.setAttribute("user",user);
          
          Cookie cookie = new Cookie("emailList",email);
          cookie.setPath("/");
          cookie.setMaxAge(60*60*4*365*2);
          resp.addCookie(cookie);
          
          String productCode =(String) req.getAttribute("productCode");
          url="/download_"+productCode+".jsp";
          }
          getServletContext().getRequestDispatcher(url).forward(req, resp);
    }
    

    
    
}
