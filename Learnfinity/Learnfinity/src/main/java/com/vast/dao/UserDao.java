package com.vast.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.vast.util.ExamDbConstants;
import com.vast.vo.Course;
import com.vast.vo.User;

public class UserDao implements LearnfinityDao{
	static Logger logger =Logger.getLogger("vast");
	static{
		try {
			Class.forName(ExamDbConstants.DRIVER);
			logger.debug("Class loaded");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	@Override
	public boolean addUser(User user) {
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ExamDbConstants.URL,ExamDbConstants.UNAME,ExamDbConstants.PSWD);
			logger.debug("Connection Established");
			String sql="insert into login(user_name,email,password) values(?,?,?)";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setString(1, user.getUser_name());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPassword());
			int res=st.executeUpdate();
			logger.debug("Data retrived");
			if(res>0)
				return true;
			return false;
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}
		finally {
			try {
				conn.close();
				logger.debug("Connection Closed");
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
		}
		return false;
	}
	
	public boolean checkUser(String name,String password) {
		Connection conn=null;
		String uname=null;
		String upassword=null;
		try {
			conn=DriverManager.getConnection(ExamDbConstants.URL,ExamDbConstants.UNAME,ExamDbConstants.PSWD);
			logger.debug("Connection Established");
			String sql="select * from login where user_name=? and password=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, password);
			ResultSet rs=st.executeQuery();
			logger.debug("Data retrived");
			while(rs.next()) {
				uname=rs.getString("user_name");
				upassword=rs.getString("password");
			}
			if(uname==null||upassword==null)
				return false;
			if(uname.equalsIgnoreCase(name)&&upassword.equalsIgnoreCase(password))
				return true;
			
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}
		finally {
			try {
				conn.close();
				logger.debug("Connection Closed");
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
		}
		return false;
		
	}

	@Override
	public List<Course> viewAllCourses() {
		List<Course>lst=new ArrayList<>();
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ExamDbConstants.URL, ExamDbConstants.UNAME, ExamDbConstants.PSWD);
			logger.debug("Connection Established");
			String sql="select * from course";
			PreparedStatement st=conn.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			logger.debug("Data retrived");
			while(rs.next()) {
				String name=rs.getString("course_name");
				int duration=rs.getInt("duration");
				Course course=new Course(name,duration);
				lst.add(course);
			}
			logger.debug("Data added to List");
			
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}
		finally {
			try {
				conn.close();
				logger.debug("Connection Closed");
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
		}
		return lst;
	}
	
}
