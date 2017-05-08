<%@ page language="java" import="java.lang.String.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<link rel="stylesheet" href="http://jquery.bassistance.de/treeview/jquery.treeview.css" type="text/css" />
<script type="text/javascript" src="http://jquery.bassistance.de/treeview/jquery.treeview.js"></script>
<script>
$(document).ready(function(){
$("#example").treeview();
});
</script>
<title>查看用户</title>
</head>
<body>
<div id="main-content">

<font style="font-family:'微软雅黑'; font-size:30px">${Member.userName}的详细信息</font>
<p>&nbsp;</p>
<div class="content-box">
<form>
<table>
  <tr>
    <td style="width:15%">用户名:</td>
    <td><input  class="text-input medium-input"  name="userName" type="text" id="uname" value="${Member.userName}" readonly="readonly"/>
    <input name="id"  type="hidden" value="${Member.userId}" />
    </td>
  </tr>
  <tr>
    <td>员工名称:</td>
    <td><input class="text-input medium-input" name="employeeName" type="text" id="ename" value="${Member.employeeName}" readonly="readonly" />
    </td>
  </tr>
  <tr>
    <td>使用者真实姓名:</td>
    <td><input class="text-input" name="personList" type="text" id="personList" value="${Member.personList}" readonly="readonly" /></td>
  </tr>
  <tr>
  	<td>帐号状态：</td>
  	<td>
		<c:if test="${Member.userStatus ==1}">正常 </c:if>
		<c:if test="${Member.userStatus ==2}">失效 </c:if>
  	</td>
  </tr>
  <tr>
  	<td>角色名称：</td>
  	<td><input class="text-input" type="text" name="role.RoleName" id="RoleName" value="${Member.role.roleName}" readonly="readonly" /></td>
  </tr>
    <tr>
  	<td>用户组名称：</td>
  	<td><input class="text-input" type="text" name="userGroup.groupName" id="groupName" value="${Member.userGroup.groupName}" readonly="readonly" /></td>
  </tr>
    <tr>
  	<td>上级编号：</td>
  	<td><input class="text-input" type="text" name="leaderId" id="leaderId" value="${Member.leaderId}" readonly="readonly"/></td>
  </tr>
  <tr>
  	<td style="width:15%"></td>
  	<td ><input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/to_user_page_3"/>'"/></td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>