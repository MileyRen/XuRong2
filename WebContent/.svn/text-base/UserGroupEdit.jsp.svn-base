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
<title>编辑用户组</title>
</head>
<body>
<div id="main-content">
<font  style="font-family:'微软雅黑'; font-size:30px">编辑用户组</font>
<div class="content-box" >
<form id="editGroup" name="editGroup" action="<c:url value="/do_group_update_0"/>" method="post" onsubmit="return checkform()">

<table>
  <tr>
    <td style="width:15%">用户组名称:</td>
    <td><input class="text-input medium-input" name="groupName" type="text" id="uname" value="${Member.groupName}" readonly="readonly"/>
    <input name="groupId" id="id" type="hidden" value="${Member.groupId}" />
    </td>
  </tr>
  <tr>
    <td>用户组负责人:</td>
    <td><input class="text-input" name="groupLeader" type="text" id="groupLeader" value="${Member.groupLeader}"/><font color="red">*</font></td>
  </tr>
  <tr>
    <td>用户组描述:</td>
    <td><input class="text-input" name="groupDesc" type="text" id="groupDesc" value="${Member.groupDesc}"/><font color="red">*</font></td>
  </tr>
  <tr>
  	<td>用户组上级选择：</td>
  	<td>
	  	<select name="parentId" id="parentId" style="width:150px;">
	  		<option value="${Member.parentId}">${Member.groupName}</option>
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
    <input type="button" name="back" id="back" value="返回" class="button" onclick="javascript:history.go(-1);"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>