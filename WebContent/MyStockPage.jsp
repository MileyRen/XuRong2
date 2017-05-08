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
function checkform()
{
	if(document.getElementById("year").value==""){
		alert("请选择年！");
		return false;
	}
	if(document.getElementById("month").value==""){
		alert("请选择月！");
		return false;
	}
}
</script>
<title>货物存储量信息</title>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
本营业员组货物存储量信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value="/do_mystock_search_3"/>" method="post" onsubmit="return checkform()">
<table style="font-size: 16px;">
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px">
<td style="width:15%">请选择查询年月</td>
<td  style="width:10%">
	<select name="year" id="year">
	  	<option value="">请选择年份</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
	</select>
</td>
<td  style="width:10%">
	<select name="month" id="month">
	  	<option value="">请选择月份</option>
		<option value="01">01</option>
		<option value="02">02</option>
		<option value="03">03</option>
		<option value="04">04</option>
		<option value="05">05</option>
		<option value="06">06</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
	</select>
</td>
<td  style="width:8%"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td style="width:40%"></td>
</tr>
</table>
</form>        

<form name="operate" action="" method="post">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:6%">序号</th>
<th  class="title" style="width:15%">商品名称</th>
<th  class="title" style="width:9%">年-月</th>
<th  class="title" style="width:9%">上月存留数量</th>
<th  class="title" style="width:9%">当月取货数量</th>
<th  class="title" style="width:9%">当前真实数量</th>
<th  class="title" style="width:18%">更新时间</th>
</tr>
</thead>
<tbody>
<c:forEach items="${mslist}"  var="depot" varStatus="status">
<tr>
<td  style="width:6%">${status.index + 1}</td>
<td  style="width:15%">${depot.wareName}</td>
<td  style="width:9%">${depot.year}-${depot.month}</td>
<td  style="width:9%">${depot.lastMonthNum}</td>
<td  style="width:9%">${depot.depotWareNum}</td>
<td  style="width:9%">${depot.currentWareNum}</td>
<td  style="width:18%">${depot.lastTime}</td>
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