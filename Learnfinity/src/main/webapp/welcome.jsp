<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List,com.vast.vo.*,com.vast.dao.*" %>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp" %>
<script type="text/javascript" src="jsfunction.js"></script>
<body onload="slideshow()">
<%@include file="header.jsp" %>
<c:if test="${empty sessionScope.login}">
		<jsp:forward page="index.jsp">
			<jsp:param name="msg" value="Your Not Authenticated" />
		</jsp:forward>
</c:if>
	<% 
		session = request.getSession(false);
        String username = (session != null) ? (String) session.getAttribute("name") : null;
        if (username != null) {
     %>
     <h1 id="user">Welcome, <%=username%>!</h1>
     <%} %>
	<nav class="nav">
		<div><a href="courses.jsp">Courses</a></div>
		<div><a href="exams.jsp">Exams</a></div>
		<div><a href="feedback.jsp">Feedback</a></div>
		<div><a href="logout">Logout</a></div>
	</nav>
	<div id="slide" class="slideshow">
			
	</div>
	<div class="welcomediv">
	<div class="content">
	<h3><b>ABOUT US</b></h3>
	<p  style="font-size: 1.6em;"> Learnfinity is an online learning platform designed to provide comprehensive courses 
	and assessments across various subjects. It aims to enhance learning through 
	interactive content, engaging assessments, and a user-friendly interface.
	Learnfinity aims to create an engaging, effective learning experience, helping 
	students to master new skills and achieve their academic or professional goals 
	through structured courses and assessments. Our portal contains both courses and exams
	paving the way to both practice and study simultaneously.</p></div>
	<div class="content">
	
	<table  id="resultTable">
		<thead id="border">
			<tr>
				<th >Course Name</th>
				<th>Duration</th>
			</tr>
		</thead>
			<%
			  LearnfinityDao dao=UserDao.getDaoInstance();
			  List<Course>lst=dao.viewAllCourses();
			  for(Course course:lst){
				  out.println("<tr>");
				  out.println("<td >"+course.getCoursename()+"</td>");
				  out.println("<td>"+course.getDuration()+"</td>");
				  out.println("</tr>");
			  }
			%>
	</table>
	</div>
   </div>
			<%
			String email=(String)getServletContext().getAttribute("email");
			int id=UserDao.getId(email);
			List<Score>scorelst=dao.viewScore();
			boolean hasScore=false;
			if(scorelst!=null){
			  for(Score score:scorelst){
				  if(score.getId()==id){
					  hasScore=true;
					  break;
				  }
			  }
			}
			if(hasScore){
		    %>
		    <table id="resultTable">
			<thead id="border">
			<tr>
				<th>Exam Name</th>
				<th>Score</th>
				<th>Attempted Date</th>
			</tr>
			</thead>
			<% 
			for(Score score:scorelst){
			 if(score.getId()==id){
				out.println("<tr>");
				out.println("<td >"+score.getExam_name()+"</td>");
				out.println("<td>"+score.getScore()+"</td>");
				out.println("<td>"+score.getDate()+"</td>");
				out.println("</tr>");
				}
			  }
			}
			%>
	</table>
   <%@include file="footer.jsp" %>
</body>
</html>