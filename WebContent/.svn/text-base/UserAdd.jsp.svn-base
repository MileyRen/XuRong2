<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.8.2.js"></script>
<link rel="stylesheet" href="http://jquery.bassistance.de/treeview/jquery.treeview.css" type="text/css" />
<script type="text/javascript" src="js/jquery.treeview.js"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<script>
$(document).ready(function(){
$("#example").treeview();
});
</script>
<script type="text/javascript">
function checkform()
{
	var m=0;
	if(document.getElementById("userName").value==""){
		alert("请填写用户名！");
		return false;
	}
	if ($("#userCheck").val() == "1") {
        alert("用户名重复！");
        return false;
    }
	if(document.getElementById("employeeName").value==""){
		alert("请填写营业员组名！");
		return false;
	}
	if(document.getElementById("passWord").value==""){
		alert("请填写密码！");
		return false;
	}
	if(document.getElementById("passWord").value!=document.getElementById("repassWord").value){
		alert("确认密码与原密码不同！");
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
	var from=document.getElementById("createuser");
	for (var i=0 ; i <from.elements.length;i++)
	{
		if (from.elements[i].type=="checkbox")
		{
			from.elements[i].checked=v;
		}
	}
}

function doAjax(){
    var uName = $("#userName").val();
    if(uName==""){$("#usrInfo").html("<font color=\"red\">请填写用户名！</font>");$("#userCheck").val("1");return false;}
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_user_find_3',
        data: JSON.stringify({
            userName: uName
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "false") {
            	$("#usrInfo").html("<font color=\"red\">您输入的用户名已存在！请重新输入！</font>");
                $("#userCheck").val("1");
            }
            else {
                $("#usrInfo").html("");
                $("#userCheck").val("0");
            }
        },
    });
}

function doAjax2(){
    var eName = $("#employeeName").val();
    if(eName==""){$("#enameInfo").html("<font color=\"red\">请填写营业员组名称！</font>");$("#userCheck").val("1");return false;}
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_user_findename_3',
        data: JSON.stringify({
        	employeeName: eName
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "false") {
            	$("#enameInfo").html("<font color=\"red\">您输入的组名称已存在！请重新输入！</font>");
                $("#userCheck").val("1");
            }
            else {
                $("#enameInfo").html("");
                $("#userCheck").val("0");
            }
        },
    });
}
</script>
<title>新建用户</title>
</head>
<body>
<div id="main-content">

<font  style="font-family:'微软雅黑'; font-size:30px">新建用户</font>
<p>&nbsp;</p>

<div class="content-box">

<form id="createuser" name="createuser" action="<c:url value='/do_user_add_1'/>" method="post" onsubmit="return checkform()">
<input id="userCheck" type="hidden" value="0"/>
<table>
  <tr>
    <td style="width:15%">用户名:</td>
    <td><input class="text-input" name="userName" type="text" id="userName" onblur="doAjax()"/><font color="red">*</font><span id="usrInfo"></span></td>
  </tr>
  <tr>
  <tr>
    <td>营业员组名称:</td>
    <td><input class="text-input" name="employeeName" type="text" id="employeeName" onblur="doAjax2()"/><font color="red">*</font><span id="enameInfo"></span></td>
  </tr>
  <tr>
    <td>使用者真实姓名:</td>
    <td><input class="text-input" name="personList" type="text" id="personList" /><font color="red">(可多人)</font></td>
  </tr>
  <tr>
    <td>密码:</td>
    <td><input class="text-input" type="password" name="passWord" id="passWord"/><font color="red">*</font></td>
  </tr>
    <tr>
    <td>密码确认:</td>
    <td><input class="text-input" type="password" name="repassWord" id="repassWord"/><font color="red">*</font></td>
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
	    <input type="submit" name="Submit" id="Submit" value="提交"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="reset" value="重置"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/to_user_page_3"/>'"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>