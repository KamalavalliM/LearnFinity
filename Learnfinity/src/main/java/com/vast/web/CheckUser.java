package com.vast.web;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vast.dao.LearnfinityDao;
import com.vast.dao.UserDao;
import com.vast.vo.Login;

public class CheckUser implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("textname");
        String password = request.getParameter("textpwd");
        LearnfinityDao dao = UserDao.getDaoInstance();
        HttpSession session = request.getSession(false);
        Login login = dao.getLoginDetails(name, password); 
        if (dao.checkUser(name, password)&&login != null) {
			//session = request.getSession();
			session.setAttribute("login", login);
            session.setAttribute("name", name);
            return "welcome.jsp";
		}
        else {
	        request.setAttribute("errorMessage", "Please enter valid username and password.");
	        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	        try {
				rd.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
     }
     return "index.jsp";
    }
}
