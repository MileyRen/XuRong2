<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<link href="css/title.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"></script>
<title>我的售货机信息</title>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script src="./js/jquery.csv2table-0.02-b-4.2.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
function getFilePath(){
	var file=document.getElementById("file");
	alert(file);
	var path=document.selection.createRange().text;
	alert(path);
}

</script>
</head>

<body>
<!-- 
<input
       class   = "btn1"
       type    = "button"
       onclick = "$('#view8').csv2table('./data/Book12.csv');"
       value   = "Run">

<div id="view8"></div>
 -->
<form action='<c:url value="/importcsvtest"/>' id="frm" method="post">
<input type="file" name="filepath" id="filepath" maxlength="128"/>
<input type="button" value="测试" onclick="return getFilePath()"/>
<input type="submit" value="提交"/>
</form>
</body>
</html>