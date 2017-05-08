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
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">

</script>
<title>新建出库记录</title>
</head>
<body>
<div id="print" align="center" class="content-box">
<font  style="font-family:'微软雅黑'; font-size:30px">煦荣领用出库单</font>
<div class="content-box">
<table id="top">
<tr>
	<td style="width:6%">组别：</td><td style="width:6%">${shipinfo.employeeName}</td>
	<td style="width:6%">营业员：</td><td style="width:6%">${shipinfo.humanName}</td>
	<td style="width:6%">日期：</td><td style="width:6%">${shipinfo.lastTime}</td>
	<td style="width:6%">单号：</td><td style="width:6%">${shipinfo.shippingId}</td>
</tr>
</table>
<table id="dis" border="3">
<tr class="tr_top">
<th  class="title" style="width:6%">序号</th>
<th  class="title" style="width:12%">货品代码</th>
<th  class="title" style="width:20%">货品名称</th>
<th  class="title" style="width:9%">规格</th>
<th  class="title" style="width:6%">单位</th>
<th  class="title" style="width:6%">出库数量</th>
<th  class="title" style="width:9%">进价</th>
<th  class="title" style="width:9%">金额</th>
<th  class="title" style="width:15%">备注</th>
</tr>
<c:forEach items="${dlist}"  var="depot" varStatus="status">
<tr>
<td  style="width:6%">${status.index + 1}/></td>
<td  style="width:12%">${depot.wares.wareCode}</td>
<td  style="width:20%">${depot.depotWareName}</td>
<td  style="width:9%">${depot.wares.wareNorm}</td>
<td  style="width:6%">${depot.wares.wareUnit}</td>
<td  style="width:6%">${depot.depotWareNum}</td>
<td  style="width:9%">${depot.depotWarePrice}</td>
<td  style="width:9%">${depot.depotWarePrice}*${depot.depotWareNum}</td>
<td  style="width:15%">${depot.remark}</td>
</tr>
</c:forEach>
</table>
<table id="button">
<tr>
<td>制表：</td><td>${shipinfo.tableor}</td>
<td>仓库：</td><td>${shipinfo.wareHouse}</td>
<td>运营：</td><td>${shipinfo.operator}</td>
<td>物流司机：</td><td>${shipinfo.driverName}</td>
</tr>
</table>
</div>
</div>
</body>
</html>