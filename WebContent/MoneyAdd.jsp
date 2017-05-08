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
<script type="text/javascript">
function checkform()
{
	var m=0;
	if(document.getElementById("users.userId").value==""){
		alert("请填写员工姓名！");
		return false;
	}
	if(document.getElementById("moneyIn").value==""){
		alert("请填写上缴金额！");
		return false;
	}
}
</script>
<title>新建上缴记录</title>
</head>
<body>
<div id="main-content">

<font  style="font-family:'微软雅黑'; font-size:30px">新建上缴记录</font>
<p>&nbsp;</p>

<div class="content-box">

<form id="createmoney" name="createmoney" action="<c:url value='/do_money_add_1'/>" method="post" onsubmit="return checkform()">
<input id="moneyCheck" type="hidden" value="0"/>
<table>
  <tr>
    <td style="width:15%">员工姓名:</td>
    <td>
    <!-- <input class="text-input" name="moneyName" type="text" id="moneyName" onblur="doAjax()"/> -->
    <select name="employeeName" id="employeeName">
    	<option value="">请选择组</option>
	  	<c:forEach items="${users}" var="u">
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
	</td>
  </tr>
  <tr>
    <td>金钱数量:</td>
    <td><input class="text-input" type="text" name="moneyIn" id="moneyIn"/></td>
  </tr>
  <tr>
  <td><input type="submit" name="current" id="current" value="提交" class="button"/></td>
  <td><input type="button" name="back" id="back" value="返回" class="button" onclick="location.href='<c:url value="/to_money_page_3"/>'"/></td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>