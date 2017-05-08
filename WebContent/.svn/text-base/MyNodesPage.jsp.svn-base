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
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
我的售货机</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content">
<form name="operate" action="" method="post">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:10%">设备编号</th>
<th  class="title" style="width:10%">设备铭牌号</th>
<th  class="title" style="width:10%">主板号</th>
<th  class="title" style="width:10%">设备类型</th>
<th  class="title" style="width:20%">设备地址</th>
<th  class="title" style="width:8%">操作</th>
</tr>
<thead>
<tbody>

<c:forEach items="${list_vending}"  var="list_vending">
<tr>
<td  style="width:10%">${list_vending.nodeId}</td>
<td  style="width:10%">${list_vending.nodeName}</td>
<td  style="width:10%">${list_vending.macAddr}</td>
<td  style="width:10%">${list_vending.machineType}</td>
<td  style="width:20%">${list_vending.nodeAddr}</td>
<td  style="width:8%"><a href="<c:url value = '/do_mychannel_Isearch_0?nid=${list_vending.nodeId}'/>">更新存货</a></td>

</tr>
</c:forEach>

</tbody>
</table>
<p>&nbsp;</p>
</form>
</div>
</div>
</div>
</body>
</html>