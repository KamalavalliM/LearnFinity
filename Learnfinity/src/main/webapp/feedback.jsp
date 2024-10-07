<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp"%>
<body>
<c:if test="${empty sessionScope.login}">
		<jsp:forward page="index.jsp">
			<jsp:param name="msg" value="Your Not Authenticated" />
		</jsp:forward>
</c:if>
	<%@include file="header.jsp"%>
	<a href="welcome.jsp" class = "pdf">Home</a>
	<form class="feed" action="thankspage.jsp">	
	<table>
	<tr>
		<th>Rate Course Content</th>
		<td><input type="radio" name="cc" value="1"/>1</td>
		<td><input type="radio" name="cc" value="2"/>2</td>
		<td><input type="radio" name="cc" value="3"/>3</td>
		<td><input type="radio" name="cc" value="4"/>4</td>
		<td><input type="radio" name="cc" value="5"/>5</td>
	</tr>
	<tr>
		<th>Rate User Experience</th>
		<td><input type="radio" name="ue" value="1"/>1</td>
		<td><input type="radio" name="ue" value="2"/>2</td>
		<td><input type="radio" name="ue" value="3"/>3</td>
		<td><input type="radio" name="ue" value="4"/>4</td>
		<td><input type="radio" name="ue" value="5"/>5</td>
	</tr>
	<tr>
		<th>Rate Assessment and Exams</th>
		<td><input type="radio" name="ae" value="1"/>1</td>
		<td><input type="radio" name="ae" value="2"/>2</td>
		<td><input type="radio" name="ae" value="3"/>3</td>
		<td><input type="radio" name="ae" value="4"/>4</td>
		<td><input type="radio" name="ae" value="5"/>5</td>
	</tr>
	<tr>
		<th>Rate Instructor Support</th>
		<td><input type="radio" name="is" value="1"/>1</td>
		<td><input type="radio" name="is" value="2"/>2</td>
		<td><input type="radio" name="is" value="3"/>3</td>
		<td><input type="radio" name="is" value="4"/>4</td>
		<td><input type="radio" name="is" value="5"/>5</td>
	</tr>
	<tr>
		<th>Rate Overall Experience</th>
		<td><input type="radio" name="oe" value="1"/>1</td>
		<td><input type="radio" name="oe" value="2"/>2</td>
		<td><input type="radio" name="oe" value="3"/>3</td>
		<td><input type="radio" name="oe" value="4"/>4</td>
		<td><input type="radio" name="oe" value="5"/>5</td>
	</tr>
	<tr>
		<td><input type="submit" value="Submit"/></td>
	</tr>
	</table>
	</form>
	<%@include file="footer.jsp" %>
</body>
</html>