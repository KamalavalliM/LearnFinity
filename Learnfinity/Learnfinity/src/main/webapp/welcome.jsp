<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List,com.vast.vo.Course,com.vast.dao.*" %>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp" %>
<script type="text/javascript" src="jsfunction.js"></script>
<body onload="slideshow()">
<%@include file="header.jsp" %>
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
	</nav>
	<div id="slide" class="slideshow">
			
	</div>
	<div class="welcomediv">
	<div class="content">
	<h3><b>About Us</b></h3>
	<p> Learnfinity is an online learning platform designed to provide comprehensive courses 
	and assessments across various subjects. It aims to enhance learning through 
	interactive content, engaging assessments, and a user-friendly interface.
	Learnfinity aims to create an engaging, effective learning experience, helping 
	students to master new skills and achieve their academic or professional goals 
	through structured courses and assessments. Our portal contains both courses and exams
	paving the way to both practice and study simultaneously.</p></div>
	<div class="content">
	
	<table>
		<thead>
			<tr>
				<th>Course Name</th>
				<th>Course Duration</th>
			</tr>
		</thead>
			<%
			  LearnfinityDao dao=new UserDao();
			  List<Course>lst=dao.viewAllCourses();
			  for(Course course:lst){
				  out.println("<tr>");
				  out.println("<td>"+course.getCoursename()+"</td>");
				  out.println("<td>"+course.getDuration()+"</td>");
				  out.println("</tr>");
			  }
			%>
	</table>
	</div>
   </div>
   <%@include file="footer.jsp" %>
</body>
</html>