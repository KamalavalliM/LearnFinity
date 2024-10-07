<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp"%>
<script src="jsfunction.js"></script>
<script>
function validate(){
	    document.getElementById("err1").innerHTML = "";
	    document.getElementById("err2").innerHTML = "";

	    var ename = document.forms['frm1']['textname'].value;
	    var email = document.forms['frm1']['textemail'].value;

	    var res = true;

	    if (!validateName(ename)) {
	        document.getElementById("err1").innerHTML = "Name must contain alphabet only!";
	        res = false;
	    }
	    
	    if (!validateEmail(email)) {
	        document.getElementById("err2").innerHTML = "Email should be in a proper format!";
	        res = false;
	    }

	    return res;
}
</script>
<body>
	<%@include file="header.jsp"%>
	<div class="login">
		<form action="checkuser" name="frm1" onsubmit="return validate();">
		<table>
			<tr>
			<td>Enter User name</td>
			<td><input type="text" name="textname" required></td>
			<td id="err1"></td>
			</tr>
			<tr>
			<tr>
			<td>Enter Email</td>
			<td><input type="text" name="textemail" required></td>
			<td id="err2"></td>
			</tr>
			<tr>
			<td>Enter Password</td>
			<td><input type="password" name="textpwd" required></td>
			</tr>
			<tr>
			<td colspan="2" align="center"><input type="submit" value="Login"/></td></tr>
		</table>
			<div>Not a user<a class="button"  href="register.jsp"> Register</a></div>
		</form>
	</div>
	<% if (request.getAttribute("errorMessage") != null) { %>
            <div  style="color:red; text-align: center; font-size: 3em;"><%= request.getAttribute("errorMessage") %></div>
        <% } %>
</body>
</html>