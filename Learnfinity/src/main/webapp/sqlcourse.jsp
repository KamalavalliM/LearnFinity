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
    <a class="pdf" href="courses.jsp">Back</a>
    <h2>SQL</h2>
    <section class="coursechild">
    <div>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/HXV3zeQKqGY?si=JQz-Nz1gUSUqzNVP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
  </div>
    <div>
        <h3>TOPICS COVERED</h3>
        <ul>
            <li>Introduction to SQL and Databases</li>
            <li>Basic SQL Queries</li>
            <li>Joins and Relationships</li>
            <li>Aggregate Functions and Grouping</li>
            <li>Subqueries and Nested Queries</li>
            <li>Data Modification (DML)</li>
            <li>Database Design and Normalization</li>
        </ul>
        <div class="pdf">
             <a href="pdfdownloadsql">Click here to download Notes</a>
        </div>
    </div>
    </section>
</body>
</html>