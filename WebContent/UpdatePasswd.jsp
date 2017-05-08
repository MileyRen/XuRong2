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
<script type="text/javascript">
function checkrepwd(){
 if(document.myform.npd.value !="" && document.myform.npd.value==document.myform.rpd.value)return true;
 else {
 	alert("请输入新密码，并确认一致！");
 	return false;
 	}
}
</script>
<title>修改密码</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
用户修改密码</font></p>
<p>&nbsp;</p>

<div class="content-box" >
<form action="<c:url value="/do_pwd_update_0"/>" method="post" id="updatepwd" name="myform"  style="width:700px;" onsubmit="return checkrepwd()">
 <table style="line-height:20px; width:600px; font-size: 14px;">
  <tr>
    <td width="30%">用户名:</td>
    <td width="50%" ><input class="text-input"  name="userName" value="${userinfo.userName}" readonly="readonly" type="text" id="textfield" />
    <input class="text-input"  name="userId" value="${userinfo.userId}" type="hidden" />
    </td>
  </tr>
<!--  
  <tr>
    <td width="30%">当前密码:</td>
    <td width="50%" ><input class="text-input"  name="password" value="${userinfo.passWord}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
-->
    <tr>
    <td width="30%">设置新密码:</td>
    <td width="50%"><input class="text-input" name="npd" type="password" id="npd" /><font color="red">*</font></td>
  </tr>
    <tr>
    <td width="30%">确认新密码:</td>
    <td width="50%"><input class="text-input" name="rpd"  type="password" id="rpd" /><font color="red">*</font></td>
  </tr>
  <tr>
  	<td width="30%"><font color="red">${infomation}</font></td>
  	<td width="50%"></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="submit" id="submit" class="button" value="提交">
    
    <td>
    <input type="button" name="back" id="back" value="返回" class="button" onclick="window.top.location='Welcome.jsp';">
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>