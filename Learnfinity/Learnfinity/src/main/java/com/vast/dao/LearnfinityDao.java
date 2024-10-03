package com.vast.dao;

import java.util.List;

import com.vast.vo.Course;
import com.vast.vo.User;

public interface LearnfinityDao {
	public boolean addUser(User user);
	public boolean checkUser(String name,String password);
	public List<Course> viewAllCourses();
}
