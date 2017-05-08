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

</script>
<title>信息导入详情</title>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
信息导入详情</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="operate" action="" method="post">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:20%">编号</th>
<th  class="title" style="width:20%">数据表名称</th>
<th  class="title" style="width:20%">操作者用户名</th>
<th  class="title" style="width:20%">操作时间</th>
<th  class="title" style="width:10%">操作</th>
</tr>
</thead>
<tbody>
<c:forEach items="${ilist}" var="info">
<tr>
<td  style="width:20%">${info.id}</td>
<td  style="width:20%">${info.tableName}</td>
<td  style="width:20%">${info.operater}</td>
<td  style="width:20%">${info.lastTime}</td>
<td  width=10%><a href= '<c:url value="/do_import_info_4"/>?tlbname=${info.tableName}&id=${info.id}'>导入</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</form>
</div>
</div>
</div>
</body>
</html>