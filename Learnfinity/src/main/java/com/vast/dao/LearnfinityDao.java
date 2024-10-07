package com.vast.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vast.Exception.UserAlreadyFoundException;
import com.vast.vo.Course;
import com.vast.vo.Login;
import com.vast.vo.Score;
import com.vast.vo.User;

public interface LearnfinityDao {
	public boolean addUser(User user) throws UserAlreadyFoundException;
	public boolean checkUser(String name,String password);
	public List<Course> viewAllCourses();
	public boolean uniqueuser(String email);
	public List<Score> viewScore();
	Login getLoginDetails(String uname, String pwd);
	String doLogout(HttpServletRequest request, HttpServletResponse response);
}
