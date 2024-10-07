<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp" %>
<body>
<c:if test="${empty sessionScope.login}">
		<jsp:forward page="index.jsp">
			<jsp:param name="msg" value="Your Not Authenticated" />
		</jsp:forward>
</c:if>
	<%@include file="header.jsp" %>
	<a href="welcome.jsp" class = "pdf">Home</a>
	<section>
		<div class="course">
			<a href="javacourse.jsp"><img class="logo" src="images/java logo.png" alt="java"></a>
			<h3>Course Name:Java</h3>
			<h3>Duration:30 hrs</h3>
			<h3>Objective</h3>
			<ul>
				<li>Will able to learn from scratch</li>
				<li>Can able to develop projects</li>
			</ul>
		</div>
		<div class="course">
			<a href="htmlcsscourse.jsp"><img class="logo" src="images/htmlcss.jpg" alt="htmlcss"></a>
			<h3>Course Name:HTML&CSS</h3>
			<h3>Duration:30 hrs</h3>
			<h3>Objective</h3>
			<ul>
				<li>Will able to learn from scratch</li>
				<li>Can able to develop projects</li>
			</ul>
		</div>
		<div class="course">
			<a href="sqlcourse.jsp"><img class="logo" src="images/SQLlogo.png" alt="sql"></a>
			<h3>Course Name:SQL</h3>
			<h3>Duration:30 hrs</h3>
			<h3>Objective</h3>
			<ul>
				<li>Will able to learn from scratch</li>
				<li>Can able to develop projects</li>
			</ul>
		</div>
	</section>
	<section>
		<div class="course">
			<a href="jscourse.jsp"><img class="logo" src="images/js logo.png" alt="javascript"></a>
			<h3>Course Name:Java Script</h3>
			<h3>Duration:20 hrs</h3>
			<h3>Objective</h3>
			<ul>
				<li>Will able to learn from scratch</li>
				<li>Can able to develop projects</li>
			</ul>
		</div>
		<div class="course">
			<a href="reactcourse.jsp"><img class="logo" src="images/reactlogo.png" alt="react"></a>
			<h3>Course Name:React</h3>
			<h3>Duration:25 hrs</h3>
			<h3>Objective</h3>
			<ul>
				<li>Will able to learn from scratch</li>
				<li>Can able to develop projects</li>
			</ul>
		</div>
		<div class="course">
			<a href="cppcourse.jsp"><img class="logo" src="images/cpp logo.png" alt="cpp"></a>
			<h3>Course Name:C++</h3>
			<h3>Duration:24 hrs</h3>
			<h3>Objective</h3>
			<ul>
				<li>Will able to learn from scratch</li>
				<li>Can able to develop projects</li>
			</ul>
		</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>