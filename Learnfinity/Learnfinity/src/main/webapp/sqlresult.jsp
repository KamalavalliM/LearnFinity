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
		if(ans1.equalsIgnoreCase("TRUNCATE")) ++score;
		if(ans2.equalsIgnoreCase("Combines rows from two or more tables based on a related column")) ++score;
		if(ans3.equalsIgnoreCase("UPDATE")) ++score;
		if(ans4.equalsIgnoreCase("A column that uniquely identifies each row in a table")) ++score;
		if(ans5.equalsIgnoreCase("COUNT()")) ++score;
		if(ans6.equalsIgnoreCase("To aggregate data across multiple rows")) ++score;
		if(ans7.equalsIgnoreCase("A query nested inside another query")) ++score;
		if(ans8.equalsIgnoreCase("It filters records after aggregation")) ++score;
		if(ans9.equalsIgnoreCase("CREATE")) ++score;
		if(ans10.equalsIgnoreCase("Only records from table1")) ++score;
		
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