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
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script>
<title>查询货道历史信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
货道历史信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value='/do_channelhis_search_3?PageNo=0'/>" method="post" >
<table style="font-size: 16px;">
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px;">
<td  style="width:15%; padding-left: 0px"><input class="text-input" style="width: 80%" type="text" name="nodeId" value="${p.nodeId}"/>
<input class="text-input" style="width: 80%" type="hidden" name="id" value="${p.id}"/></td>
<td  style="width:15%; padding-left: 0px"><input class="text-input" style="width: 80%" type="text" name="channelId" value="${p.channelId}"/></td>
<td  style="width:15%; padding-left: 0px"><input class="text-input" style="width: 80%" type="text" name="nodeGroupName" value="${p.nodeGroupName}"/></td>
<td  style="width:15%; padding-left: 0px"><input class="text-input" style="width: 80%" type="text" name="wareName" value="${p.wareName}"/></td>
<td  style="width:15%; padding-left: 0px">
<input class="text-input" style="width: 40%" type="text" name="mintime" value="${ltime}" maxlength="8"/>
<input class="text-input" style="width: 40%" type="text" name="maxtime" value="${rtime}" maxlength="8"/>
</td>
<td  style="width:8%; padding-left: 0px"><input class="text-input" style="width: 80%" type="text" name="currentNumber" value="${p.currentNumber}"/></td>
<td  style="width:8%; padding-left: 0px"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:8%" colspan="1"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
<!-- <td  style="width:8%; padding-left: 0px"><input type="reset" name="reset" id="reset"  class="button" value="重置"/></td> -->
</tr>
</table>
</form>  

<form name="operate" action="" method="post">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:15%">设备编号</th>
<th  class="title" style="width:15%">货道编号</th>
<th  class="title" style="width:15%">设备组名称</th>
<th  class="title" style="width:15%">商品名称</th>
<th  class="title" style="width:15%">更新时间</th>
<th  class="title" style="width:8%">当前数量</th>
<th  class="title" style="width:8%">加货数量</th>
<th  class="title" style="width:8%">额定数量</th>

</tr>
</thead>
<tbody>
<c:forEach items="${cilist}" var="channel">
<tr>
	<td style="width:15%">${channel.nodeId}</td>
	<td style="width:15%">${channel.channelId}</td>
	<td style="width:10%">${channel.nodeGroupName}</td>
	<td style="width:15%">${channel.wareName}</td>
	<td style="width:15%">${channel.lastTime.toString().substring(0, 19)}</td>
	<td style="width:8%">${channel.currentNumber}</td>
	<td style="width:8%">${channel.incrementNumber}</td>
	<td style="width:8%">${channel.normalStock}</td>
</tr>
</c:forEach>
</tbody>
</table>
</form>
<div class="pagination">
	共有${length+1-1}页&nbsp; 当前第${PageNo+1}页&nbsp;	
	<c:if test="${PageNo+1=='1'}">
	<a ><font color="gray" >首页</font></a>
	<a ><font color="gray" >上一页</font></a>	
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="javascript:dosearch('do_channelhis_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_channelhis_search_3?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页</font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_channelhis_search_3?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_channelhis_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>
</div>
</div>
</div>
</div>
</body>
</html>