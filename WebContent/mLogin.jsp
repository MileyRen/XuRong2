<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mobile login</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<body>
<div align="center">
<form action="<c:url value="/mloginCheck"/>" method="post">
<table height="100%" border=2>
<tr><td align="center"><font color="blue">泰正后台手机登陆系统</font></td></tr>
<tr><td>用户名:<input type="text" name="userName" value="admin"></td></tr>
<tr><td>密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="text" name="passwd" value="123" ></td></tr>
<tr><td align="right" ><input type="submit" name="Submit" value="登陆"></td></tr>
</table>
</form>
</div>
</body>
</html>