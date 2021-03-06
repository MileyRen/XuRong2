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
<script type="text/javascript" src="js\My97DatePicker\WdatePicker.js"></script>
<title>查询商品信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
查询商品信息</font></p>

<p>&nbsp;</p>

<div class="content-box">
<form name="search" action="<c:url value='/do_ware_search_3?PageNo=0'/>" method="post" >
<table>
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px;">
<td  style="width:15%;"><input class="text-input" style="width: 80%" type="text" name="wareCode" value="${hpgi.wareCode}"/></td>
<td  style="width:20%;"><input class="text-input" style="width: 80%" type="text" name="wareName" value="${hpgi.wareName}"/></td>
<td  style="width:10%;"><input class="text-input" style="width: 80%" type="text" name="wareNorm" value="${hpgi.wareNorm}"/></td>
<td  style="width:10%;"><input class="text-input" style="width: 80%" type="text" name="wareBasePrice" value="${hpgi.wareBasePrice}"/></td>
<td  style="width:10%;"><input class="text-input" style="width: 80%" type="text" name="lastTime" value="${hpgi.lastTime}" onFocus="WdatePicker({dateFmt:'yyyyMMdd'})"/></td>
<td  style="width:5%;"><input class="text-input" style="width: 80%" readonly="readonly" type="hidden"/></td>
<td  style="width:5%"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:5%"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
<td  style="width:5%"><input type="button" name="btncreate" id="btncreate" class="button" value="新建" onclick="location.href='<c:url value="/to_ware_add_1"/>'"></td>
</tr>
</table>
</form>  


<form name="operate" action="<c:url value="/do_ware_search_3?PageNo=0"/>" method="post" >
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:15%">商品编码</th>
<th  class="title" style="width:20%">商品名称</th>
<th  class="title" style="width:10%">商品规格</th>
<th  class="title" style="width:10%">商品基价(分)</th>
<th  class="title" style="width:10%">更新时间</th>
<th  class="title" style="width:10%" colspan="2">操作</th>
<th  class="title" style="width:10%" colspan="2"></th>
<!-- <input type="button" name="btnimport" id="btnimport" class="button" value="Excel导入" onclick="location.href='<c:url value="/WareImport.jsp"/>'"> -->
</tr>
</thead>
<tbody>
<c:forEach items="${wareslist}" var="list">
<tr>
	<td style="width:15%">${list.wareCode}<input type="hidden" name="hId" value="${list.wareId}"/></td>
	<td style="width:20%">${list.wareName}</td>
	<td style="width:10%">${list.wareNorm}</td>
	<td style="width:10%">${list.wareBasePrice}</td>
	<td style="width:10%">${list.lastTime}</td>
	<td  class="td_center" style="width:10%" colspan="2"><a href= "<c:url value='to_ware_edit_2?Id=${list.wareId}'/>" >编辑</a></td>
	<td  class="td_center" style="width:10%" colspan="2"><a href= "<c:url value='do_ware_view_3?Id=${list.wareId}'/>" >详情</a></td>
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
	<a href="javascript:dosearch('do_ware_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_ware_search_3?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页</font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_ware_search_3?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_ware_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>
</div>
</div>
</div>
</body>
</html>