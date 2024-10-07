package com.vast.web;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.vast.Exception.UserAlreadyFoundException;
import com.vast.dao.LearnfinityDao;
import com.vast.dao.UserDao;
import com.vast.vo.User;

public class AddUser implements Action {
static Logger logger = Logger.getLogger("vast");
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LearnfinityDao dao = UserDao.getDaoInstance();
		
		String name=request.getParameter("textname");
		String password=request.getParameter("textcpwd");
		String email=request.getParameter("textemail");	
		User user=new User(name,password,email);
		
		logger.info("user : "+user);
		try {
			if(dao.addUser(user))
			{
				request.setAttribute("user", user);
				return "index.jsp";
			}
			else {
				response.getWriter().write("User cannot be added");
			}
		} catch (UserAlreadyFoundException | IOException e) {
			logger.error("User already exists: " + user.getEmail());
            request.setAttribute("errorMessage", "User with this email already exists. Please Login");
            return "register.jsp"; 
		} 
		return "index.jsp";
	}

}
