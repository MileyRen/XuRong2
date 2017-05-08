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

function dosubmit(choose)
{ 
	document.forms["operate"].action= choose;
	document.forms["operate"].submit(); 
}

</script>
<title>特殊商品销售</title>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
特殊商品销售信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value="/do_sale_search_3"/>" method="post" >
<table style="font-size: 16px;">
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px">
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="year" value="${s.year}"/></td>
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="month" value="${s.month}"/></td>
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="day" value="${s.day}"/></td>
<!-- 
<td  style="width:8%">
<input class="text-input" style="width: 80%" type="text" name="employeeName" value="${s.employeeName}"/>
</td>
 -->
<td style="width:8%">
	<select name="employeeName" id="employeeName">
	<c:if test="${d.employeeName == ''}"><option value="">请选择</option></c:if>
	<c:if test="${d.employeeName != ''}"><option value="${d.employeeName}">${d.employeeName}</option><option value="">请选择</option></c:if>
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
</td>
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="nodeName" value="${s.nodeName}"/></td>
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="channelId" value="${s.channelId}"/></td>
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="wareName" value="${s.wareName}"/></td>
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="saleNum" value="${s.saleNum}"/></td>
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="salePrice" value="${s.salePrice}"/></td>
<td  style="width:8%"><input class="text-input" style="width: 80%" type="text" name="thoeryPrice" value="${s.thoeryPrice}"/></td>
<td  style="width:8%"><input class="button" type="submit" name="submit" value="搜索"/></td>
</tr>
</table>
</form>        

<form name="operate" action="<c:url value='/do_sale_check_4'/>" method="post">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:8%">年</th>
<th  class="title" style="width:8%">月</th>
<th  class="title" style="width:8%">日</th>
<th  class="title" style="width:8%">营业员组名</th>
<th  class="title" style="width:8%">机器铭牌号</th>
<th  class="title" style="width:8%">货道编号</th>
<th  class="title" style="width:8%">商品名称</th>
<th  class="title" style="width:8%">销售数量</th>
<th  class="title" style="width:8%">销售价格</th>
<th  class="title" style="width:8%">理论售价</th>
<th  class="title" style="width:8%"></th>
</tr>
</thead>
<tbody>
<c:forEach items="${slist}"  var="s" >
<tr>
<td  style="width:8%">${s.year}<input class="text-input" type="hidden" name="saleId" value="${s.saleId}"/></td>
<td  style="width:8%">${s.month}</td>
<td  style="width:8%">${s.day}</td>
<td  style="width:8%">${s.employeeName}</td>
<td  style="width:8%">${s.nodeName}</td>
<td  style="width:8%">${s.channelId}</td>
<td  style="width:8%">${s.wareName}</td>
<td  style="width:8%">${s.saleNum}</td>
<td  style="width:8%">${s.salePrice}</td>
<td  style="width:8%">${s.thoeryPrice}</td>
<td  style="width:8%"></td>
</tr>
</c:forEach>

</tbody>
<tr><td>总额</td><td>${count}</td></tr>
<tr><td></td><td><input type="submit" id="check" name="check" value="核算"/></td></tr>
</table>
<p>&nbsp;</p>

</form>
</div>
</div>
</div>
</body>
</html>