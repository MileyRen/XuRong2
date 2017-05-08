<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<script type="text/javascript">
function checkform()
{
	if(document.getElementById("uname").value==""){
		alert("请填写用户名！");
		return false;
	}
	if(document.getElementById("ename").value==""){
		alert("请填写员工名称！");
		return false;
	}
	if(document.getElementById("pwd").value==""){
		alert("请填写密码！");
		return false;
	}
}

function modelCheckAll(name, v){
	var checks = document.getElementsByName(name); 
	if(checks.length)
	{ 
		for(var i=0;i<checks.length;i++) 
		{ 
			checks[i].checked = v; 
		} 
	}
	else
	{ 
		checks.checked = v; 
	} 
}

function allCheck(v){
	var from=document.getElementById("editMember");
	for (var i=0 ; i <from.elements.length;i++)
	{
		if (from.elements[i].type=="checkbox")
		{
			from.elements[i].checked=v;
		}
	}
}
</script>
<title>编辑用户</title>
</head>
<body>
<div id="main-content">
<font  style="font-family:'微软雅黑'; font-size:30px">编辑用户</font>
<div class="content-box" >
<form id="editMember" name="editMember" action="<c:url value="/do_user_update_0"/>" method="post" onsubmit="return checkform()">

<table>
  <tr>
    <td style="width:15%">用户名:</td>
    <td><input class="text-input medium-input" name="userName" type="text" id="uname" value="${Member.userName}" readonly="readonly"/>
    <input name="userId" id="id" type="hidden" value="${Member.userId}" />
    </td>
  </tr>
  <tr>
    <td>员工名称:</td>
    <td><input class="text-input medium-input" name="employeeName" type="text" id="ename" value="${Member.employeeName}" />
    </td>
  </tr>
    <tr>
    <td>使用者真实姓名:</td>
    <td><input class="text-input" name="personList" type="text" id="personList"  value="${Member.personList}"/><font color="red">(可多人)</font></td>
  </tr>
  <tr>
    <td>用户密码:</td>
    <td><input class="text-input medium-input" type="passWord" name="passWord" id="pwd" value="${Member.passWord}"/></td>
  </tr>
  <tr>
  	<td>帐号状态：</td>
  	<td>
  		<select name="userStatus" style="width:150px;">
  			<option value="${Member.userStatus}" selected="selected">
				<c:if test="${Member.userStatus ==1}">正常 </c:if>
				<c:if test="${Member.userStatus ==2}">失效 </c:if>
			</option>
			<option value="1">正常</option>
			<option value="2">失效</option>
  		</select>
  	</td>
  </tr>
  <tr>
  	<td>角色选择：</td>
  	<td>
  		<select name="role.roleId" style="width:150px;">
		<c:forEach items="${roles}" var="role" >
			<option value="${role.roleId}">${role.roleName}</option>
		</c:forEach>
  		</select>
  	</td>
  </tr>
    <tr>
  	<td>用户组选择：</td>
  	<td>
	  	<select name="userGroup.groupId" id="userGroupId" style="width:150px;">
	  	<c:forEach items="${groups}" var="group" >
			<option value="${group.groupId}">${group.groupName}</option>
		</c:forEach>
	  	</select>
  	</td>
  </tr>
  <tr>
    <td></td>
    <td>
    <input type="submit" name="commit" id="commit" value="提交" class="button"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/to_user_page_3"/>'"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>