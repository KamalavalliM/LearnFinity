<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp"%>
<script src="jsfunction.js"></script>
<script>
function validate(){
	document.getElementById("err1").innerHTML="";
	var ename = document.frm1.textname.value;
	var res = true;
	if(!validateName(ename)){
		document.getElementById("err1").innerHTML= "Name Must Contain Alphabet only"
		res=false;
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
			<td><input type="text" name="textname"></td>
			<td id="err1"></td>
			</tr>
			<tr>
			<td>Enter Password</td>
			<td><input type="password" name="textpwd"></td>
			</tr>
			<tr>
			<td colspan="2" align="center"><input type="submit" value="Login"/></td>
		</table>
			<div>Not a user<a class="button"  href="register.jsp"> Register</a></div>
		</form>
	</div>
</body>
</html>