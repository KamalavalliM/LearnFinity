<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp" %>
<body>
	<%@include file="header.jsp" %>
	<a class="pdf" href="welcome.jsp">Exit</a>
	<%
		String ans1=request.getParameter("qn1");
		String ans2=request.getParameter("qn2");
		String ans3=request.getParameter("qn3");
		String ans4=request.getParameter("qn4");
		String ans5=request.getParameter("qn5");
		String ans6=request.getParameter("qn6");
		String ans7=request.getParameter("qn7");
		String ans8=request.getParameter("qn8");
		String ans9=request.getParameter("qn9");
		String ans10=request.getParameter("qn10");
	
		int score=0;
		if(ans1.equalsIgnoreCase("All of the above")) ++score;
		if(ans2.equalsIgnoreCase("To clean up resources when an object goes out of scope")) ++score;
		if(ans3.equalsIgnoreCase("Ability to call the same method on different objects and get different results")) ++score;
		if(ans4.equalsIgnoreCase("yes")) ++score;
		if(ans5.equalsIgnoreCase("new")) ++score;
		if(ans6.equalsIgnoreCase("A method that can be overridden in derived classes")) ++score;
		if(ans7.equalsIgnoreCase("Constructors can be overloaded")) ++score;
		if(ans8.equalsIgnoreCase("To allow a function or class to access private members of another class")) ++score;
		if(ans9.equalsIgnoreCase("All of the above")) ++score;
		if(ans10.equalsIgnoreCase("It will lead to undefined behavior")) ++score;
		
		double percentage=score*10;
		String result=percentage>=75?"pass":"fail";
		String certificate=null;
		if(result.equals("pass"))
			certificate="Yes...";
		else
			certificate="No... Try again";
	%>
	<table>
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