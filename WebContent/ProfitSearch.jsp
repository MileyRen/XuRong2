<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script>
<title>查询利润信息</title>
</head>
<body>

<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
查询利润信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value = '/do_profit_search_3?PageNo=0'/>" method="post" >
<table>
<tr style="background: #fff;">
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" id="employeeName" name="employeeName" value="${pinfo.employeeName}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="year" value="${pinfo.year}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="month" value="${pinfo.month}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="turnOverCard" value="${pinfo.turnOverCard}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="turnOverCash" value="${pinfo.turnOverCash}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="moneyCount" value="${pinfo.moneyCount}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="profit" value="${pinfo.profit}"/></td>
<td  style="width:5%" colspan="1"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:5%" colspan="1"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
</tr>
</table>
</form>        

<form name="operate" action="" method="post">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:10%">营业员组名</th>
<th  class="title" style="width:10%">年份</th>
<th  class="title" style="width:10%">月份</th>
<th  class="title" style="width:10%">卡交易额</th>
<th  class="title" style="width:10%">现金交易</th>
<th  class="title" style="width:10%">上缴金额</th>
<th  class="title" style="width:10%">利润</th>
<th  class="title" style="width:10%" colspan="2">操作</th>
</tr>
<thead>
<tbody>


<c:forEach items="${plist}"  var="p">
<tr>
<td  style="width:10%">${p.employeeName}<input type="hidden" value="${p.profitId}" name="profitId" id="profitId"/></td>
<td  style="width:10%">${p.year}</td>
<td  style="width:10%">${p.month}</td>
<td  style="width:10%">${p.turnOverCard}</td>
<td  style="width:10%">${p.turnOverCash}</td>
<td  style="width:10%">${p.moneyCount}</td>
<td  style="width:10%">${p.profit}</td>
<td  class="td_center" width=5%></td>
<td  class="td_center" width=5%><a href="<c:url value = '/do_profit_view_3?pid=${p.profitId}'/>" >详情</a></td>
</tr>
</c:forEach>

</tbody>
</table>
<p>&nbsp;</p>
</form>
<div class="pagination">
	共有${length+1-1}页&nbsp; 当前第${PageNo+1}页&nbsp;
	
	<c:if test="${PageNo+1=='1'}">
	<a ><font color="gray">首页</font></a>
	<a ><font color="gray">上一页</font></a>
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="javascript:dosearch('do_profit_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_profit_search_3?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页</font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_profit_search_3?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_profit_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>	
</div>
</div>
</div>
</div>
</body>
</html>