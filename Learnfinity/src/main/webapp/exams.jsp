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
			<a href="javaques.jsp"><img class="logo" src="images/java logo.png" alt="java"></a>
			<h3>Exam Name:Java</h3>
			<h3>Duration:15 minutes</h3>
		</div>
		<div class="course">
			<a href="htmlcssques.jsp"><img class="logo" src="images/htmlcss.jpg" alt="htmlcss"></a>
			<h3>Exam Name:HTML&CSS</h3>
			<h3>Duration:15 minutes</h3>
		</div>
		<div class="course">
			<a href="sqlques.jsp"><img class="logo" src="images/SQLlogo.png" alt="sql"></a>
			<h3>Exam Name:SQL</h3>
			<h3>Duration:15 minutes</h3>
		</div>
	</section>
	<section>
		<div class="course">
			<a href="jsques.jsp"><img class="logo" src="images/js logo.png" alt="javascript"></a>
			<h3>Exam Name:Java Script</h3>
			<h3>Duration:15 minutes</h3>
		</div>
		<div class="course">
			<a href="reactques.jsp"><img class="logo" src="images/reactlogo.png" alt="react"></a>
			<h3>Exam Name:React</h3>
			<h3>Duration:15 minutes</h3>
		</div>
		<div class="course">
			<a href="cppques.jsp"><img class="logo" src="images/cpp logo.png" alt="cpp"></a>
			<h3>Exam Name:C++</h3>
			<h3>Duration: 15 minutes</h3>
		</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>