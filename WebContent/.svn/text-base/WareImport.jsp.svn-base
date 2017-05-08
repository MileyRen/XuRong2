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
<script language="javaScript">
function checkform(){
	/*
	alert("1");
	var file = document.getElementById("file").text;
	alert(file);
	if(file==""){alert("请选择文件");return false;}
	else if(!file.concat("/")){alert("请使用IE9.0或以上版本浏览器！");return false;}
	return true;
	*/
}
</script>
<title>导入新商品</title>
</head>
<body>
<div id="main-content">
<font  style="font-family:'微软雅黑'; font-size:30px">导入新商品</font>
<p>&nbsp;</p>
<div class="content-box">
<form id="wareimport" name="wareimport" action="<c:url value='/do_ware_importview_1'/>" onsubmit="return checkform()" method="post">
<table>
<tr>
<td style="wideth:15%"><input type="file" name="file" id="file"/></td>
<td style="wideth:15%"><input type="submit" name="submit" id="submit" value="查看" class="button"/></td>
<td style="wideth:30%"><input type="hidden" value="${fileinfo}"/></td>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>