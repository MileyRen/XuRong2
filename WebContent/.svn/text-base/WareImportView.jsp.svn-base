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
<script language="javascript" type="text/javascript">
function dosearch(choose)
{ 
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 
}

</script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<title>商品信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
商品信息</font></p>

<p>&nbsp;</p>

<div class="content-box">
<form name="operate" action="<c:url value="/do_ware_import_1"/>" method="post" >
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:15%">商品编码</th>
<th  class="title" style="width:15%">商品名称</th>
<th  class="title" style="width:15%">商品规格</th>
</tr>
</thead>
<tbody>
<c:forEach items="${wareslist}" var="list">
<tr>
	<td  width="15%" align="center"><input type="text" name="wareCode" value="${list.wareCode}" readonly="readonly"/></td>
	<td  width="15%" align="center"><input type="text" name="wareName" value="${list.wareName}" readonly="readonly"/></td>
	<td  width="15%" align="center"><input type="text" name="wareNorm" value="${list.wareNorm}" readonly="readonly"/></td>
</tr>
</c:forEach>
<tr>
<td><input type="submit" name="submit" id="submit" value="提交" class="button"/>
<input type="button" name="back" id="back" value="返回" class="button" onclick="location.href='<c:url value="/WareImport.jsp"/>'"/></td>
</tr>
</tbody>
</table>
</form>
</div>
</div>
</body>
</html>