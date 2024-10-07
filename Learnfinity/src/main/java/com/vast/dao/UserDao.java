package com.vast.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.vast.Exception.UserAlreadyFoundException;
import com.vast.util.ExamDbConstants;
import com.vast.vo.Course;
import com.vast.vo.Login;
import com.vast.vo.Score;
import com.vast.vo.User;

public class UserDao implements LearnfinityDao{
	static Logger logger =Logger.getLogger("vast");
	
	private static LearnfinityDao dao=new UserDao();
	private UserDao() {
		
	}
	static{
		try {
			Class.forName(ExamDbConstants.DRIVER);
			logger.debug("Class loaded");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static LearnfinityDao getDaoInstance() {
		return dao;
	}
	
	@Override
	public boolean addUser(User user) throws UserAlreadyFoundException {
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ExamDbConstants.URL,ExamDbConstants.UNAME,ExamDbConstants.PSWD);
			logger.debug("Connection Established");
			if(uniqueuser(user.getEmail())) {
				String sql="insert into login(user_name,password,email) values(?,?,?)";
				PreparedStatement st=conn.prepareStatement(sql);
				st.setString(1, user.getUser_name());
				st.setString(2, user.getPassword());
				st.setString(3, user.getEmail());;
				int res=st.executeUpdate();
				logger.debug("Data retrived");
				if(res>0)
					return true;
				return false;
			}
			else
				throw new UserAlreadyFoundException("User already exists please login");
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
	
	public List<String> getEmail(){
		List<String> lst=new ArrayList<>();
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ExamDbConstants.URL,ExamDbConstants.UNAME,ExamDbConstants.PSWD);
			logger.debug("Connection Established");
			String sql="select * from login";
			PreparedStatement st=conn.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			logger.debug("Data retrived");
			while(rs.next()) {
				lst.add(rs.getString("email"));
			}
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
	
	public boolean uniqueuser(String email) {
		List<String>lst=getEmail();
		for(String useremail:lst) {
			if(useremail.equalsIgnoreCase(email))
				return false;
		}
		return true;
	}
	
	public static int getId(String email) {
		int id=0;
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ExamDbConstants.URL,ExamDbConstants.UNAME,ExamDbConstants.PSWD);
			logger.debug("Connection Established");
			String sql="select user_id from login where email=?";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs=st.executeQuery();
			logger.debug("data retrived");
			if(rs.next())
				id=rs.getInt("user_id");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		finally {
			try {
				conn.close();
				System.out.println("Connection Closed");
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return id;
	}
	
	public static boolean addScore(Score score) {
		Connection conn = null;
        try {
            conn = DriverManager.getConnection(ExamDbConstants.URL,ExamDbConstants.UNAME,ExamDbConstants.PSWD);
            String query = "INSERT INTO score (user_id,exam_name,score,attempted) VALUES (?, ?, ?, ?)";
            PreparedStatement st = conn.prepareStatement(query);
            st.setInt(1, score.getId());
            st.setString(2, score.getExam_name());
            st.setInt(3, score.getScore());
            LocalDate localDate = score.getDate();
            Date sqlDate = Date.valueOf(localDate); // Use Date.valueOf() to convert
            st.setDate(4, sqlDate); 
            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
        return false;
	}
	
	public List<Score> viewScore(){
		List<Score> lst=new ArrayList<>();
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ExamDbConstants.URL, ExamDbConstants.UNAME, ExamDbConstants.PSWD);
			String sql="select * from score";
			PreparedStatement st=conn.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				int id=Integer.parseInt(rs.getString("user_id"));
				String exam_name=rs.getString("exam_name");
				int score=Integer.parseInt(rs.getString("score"));
				String date=rs.getString("attempted");
				DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate localdate=LocalDate.parse(date, dtf);
				Score userscore=new Score(id,exam_name,score,localdate);
				lst.add(userscore);
			}
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}
		return lst;
	}
	
	public Login getLoginDetails(String uname, String pwd) {
		Connection conn = null;
		Login login = null;
		try {
			conn = DriverManager.getConnection(ExamDbConstants.URL, ExamDbConstants.UNAME, ExamDbConstants.PSWD);
			logger.debug("connected to Mysqlserver sucessfully");
			String sql = "select user_name,password from login where user_name =? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				login = new Login();
				login.setUserName(rs.getString("user_name"));
				login.setPwd(rs.getString("password"));
			}
			logger.info("Login retrived from DataBase");

		} catch (SQLException e) {
			logger.error(e.getMessage());
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return login;
	}

	@Override
	public String doLogout(HttpServletRequest request, HttpServletResponse response) {
		String viewName = "index.jsp";
		HttpSession session = request.getSession(false);
		if (null != session) {
			session.invalidate();
		}
		request.setAttribute("msg", "you have logged out.");
		return viewName;

	}

}
