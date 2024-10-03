<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="MetaData.jsp"%>
<script src="jsfunction.js"></script>
<script>
function validate(){
	document.getElementById("err1").innerHTML="";
	document.getElementById("err2").innerHTML="";
	var ename = document.frm1.textname.value;
	var email = document.frm1.textemail.value;
	var res = true;
	if(!validateName(ename)){
		document.getElementById("err1").innerHTML= "Name Must Contain Alphabet! only"
		res=false;
	}
	if(!validateEmail(email)){
		document.getElementById("err2").innerHTML= "Invalid Email format";
		res=false;
	}
	return res;
}
</script>
<body>
	<%@include file="header.jsp"%>
	<article class="login" style="font-size:20px;">
		<form name="frm1" action="adduser" onsubmit="return validate();">
			<table>
				<tr>
				<th>Enter your Name</th>
				<td><input type="text" name="textname" required="required"/></td>
				<td id="err1"></td>
				</tr>
				<tr>
				<th>Enter your Age</th>
				<td><input type="number" name="textage" min="14" max="100" required="required"/></td>
				</tr>
				<tr>
				<th>Enter Email</th>
				<td><input type="text" name="textemail" required="required"/></td>
				<td id="err2"></td>
				</tr>
				<tr>
				<th>Enter Password</th>
				<td><input type="password" name="textpwd" required="required"/></td>
				</tr>
				<tr>
				<th>Confirm Password</th>
				<td><input type="password" name="textcpwd" required="required"/></td>
				</tr>
				<tr>
				<td colspan="2" align="center"><input type="submit" value="Register"/></td>
			</table>
		</form>
	</article>
</body>
</html>