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
		if(ans1.equalsIgnoreCase("First-class functions")) ++score;
		if(ans2.equalsIgnoreCase("The calling object ")) ++score;
		if(ans3.equalsIgnoreCase("All of the above")) ++score;
		if(ans4.equalsIgnoreCase("object")) ++score;
		if(ans5.equalsIgnoreCase("An object that represents the eventual completion or failure of an asynchronous operation")) ++score;
		if(ans6.equalsIgnoreCase("Both A and B")) ++score;
		if(ans7.equalsIgnoreCase("false")) ++score;
		if(ans8.equalsIgnoreCase("Both B and C")) ++score;
		if(ans9.equalsIgnoreCase("Both B and C")) ++score;
		if(ans10.equalsIgnoreCase("Both B and C")) ++score;
		
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