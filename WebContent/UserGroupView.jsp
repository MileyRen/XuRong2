<%@ page language="java" import="java.lang.String.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>查看用户组</title>
</head>
<body>
<div id="main-content">

<font style="font-family:'微软雅黑'; font-size:30px">${Group.groupName}的详细信息</font>
<p>&nbsp;</p>
<div class="content-box">
<form>
<table>
  <tr>
    <td style="width:15%">用户组名称:</td>
    <td><input class="text-input medium-input" name="groupName" type="text" id="uname" value="${Member.groupName}" readonly="readonly"/>
    <input name="groupId" id="id" type="hidden" value="${Member.groupId}" />
    </td>
  </tr>
  <tr>
    <td>用户组负责人:</td>
    <td><input class="text-input" name="groupLeader" type="text" id="groupLeader" value="${Member.groupLeader}" readonly="readonly"/></td>
  </tr>
  <tr>
    <td>用户组描述:</td>
    <td><input class="text-input" name="groupDesc" type="text" id="groupDesc" value="${Member.groupDesc}" readonly="readonly"/></td>
  </tr>
  <tr>
    <td>用户组上级:</td>
    <td><input class="text-input" name="parentId" type="text" id="parentId" value="${Member.parentId}" readonly="readonly"/></td>
  </tr>
  <tr>
  	<td style="width:15%"></td>
  	<td ><input type="button" class="button" name="back" value="返回" onclick="javascript:history.go(-1);"></td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>