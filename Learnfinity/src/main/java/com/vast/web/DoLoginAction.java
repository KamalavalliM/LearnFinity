package com.vast.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vast.dao.LearnfinityDao;
import com.vast.dao.UserDao;
import com.vast.vo.Login;

public class DoLoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LearnfinityDao dao = UserDao.getDaoInstance();
		String viewName = "index.jsp";
		String uname = request.getParameter("textname");
		String pwd = request.getParameter("textpwd");
		Login login = dao.getLoginDetails(uname, pwd);
		HttpSession session = request.getSession(false);
		if (null != login) {
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(10 * 60);
			viewName = "index.jsp";
		} else {
			request.setAttribute("msg", "you are not authenticated, check your credentials.");
		}
		return viewName;

	}

}
