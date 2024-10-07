<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.vast.dao.UserDao"%>
<%@page import="com.vast.vo.Score"%>
<%@page import="java.time.LocalDate" %>
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
	<a class="pdf" href="welcome.jsp">Exit</a>
	<%
	String[] correctAnswers = {
		"To handle side effects in functional components",
		"componentDidMount",
		"To share data between components without props drilling",
		"By using `shouldComponentUpdate` or `React.memo'",
		"An object that represents the eventual completion or failure of an asynchronous operation",
		"Both B and C",
		"The state does not update and may lead to unexpected behavior",
		" It groups multiple children without adding extra nodes to the DOM ",
		"Callbacks",
		"To manage global application state in a predictable way"};
		
	int score = 0;
	for (int i = 1; i <= 10; i++) {
		String ans = request.getParameter("qn" + i);
		
		if (ans != null && !ans.trim().isEmpty()) {
			if (ans.equalsIgnoreCase(correctAnswers[i - 1])) {
				score++;
			}
		}
	}

	String name="React";
	double percentage = (score / 10.0) * 100; 
	String result = percentage >= 50 ? "pass" : "fail";
	String certificate = result.equals("pass") ? "You will receive ur certificate Soon" : "OOPS!..YOu failed to pass the exam";
	
	String email=(String)getServletContext().getAttribute("email");
	int id=UserDao.getId(email);
	LocalDate date=LocalDate.now();
	Score userscore=new Score(id,name,score,date);
	UserDao.addScore(userscore);
	%>
	<h3 style="text-align: center;">RESULT SUMMARY</h3>
	<table id="resultTable" >
		<tr>
			<th>Name</th>
			<th><%=name %></th>
		</tr>
		<tr>
			<th>Score</th>
			<th><%=score %></th>
		</tr>
		<tr>
			<th>Percentage</th>
			<th><%=percentage %></th>
		</tr>
		<tr>
			<th>Result</th>
			<th><%=result %></th>
		</tr>
		<tr>
			<th>Certificate</th>
			<th><%=certificate %></th>
		</tr>
	</table>
</body>
</html>