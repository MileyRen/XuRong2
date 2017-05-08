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
<script type="text/javascript">
function dosearch(choose) {
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 

}
</script>
<title>更新存货量</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
更新存货信息</font></p>
<p>&nbsp;</p>
<div class="content-box">
<div class="content-box-content">
<form name="operate" action='<c:url value="/do_prochannel_updatebyincr_0"/>' method="post" onsubmit="return checkvalue()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:15%">售货机货道编号</th>
<th  class="title" style="width:10%">当前存货数据库值</th>
<th  class="title" style="width:20%">商品名称</th>
<th  class="title" style="width:10%">加货增量</th>
</tr>
</thead>
<tbody>
<c:forEach items="${listci}"  var="channelStock">
<tr>
<td  width="15%" align="center" >
<input name="id" readonly="readonly" value="${channelStock.id}" type="hidden"/>
<input name="nodeInfo.nodeId" readonly="readonly" value="${channelStock.nodeInfo.nodeId}" type="hidden"/>
<input name="channelId" readonly="readonly" value="${channelStock.channelId}" type="text"/>
</td>
<td  width="10%" align="center" ><input type="text" name="currentNumber" readonly="readonly" value="${channelStock.currentNumber}"/></td>
<td  width="20%" align="center" ><input type="text" name="wareName" value="${channelStock.wareName}" style="background-color: yellow"/></td>
<td  width="10%" align="center" ><input type="text" name="incrementNumber" value="0" style="background-color: yellow"/></td>
</tr>
</c:forEach>
</tbody>
<tr>
<td><input type="submit" name="current" id="current" value="提交" class="button"/></td>
<td><input type="button" name="back" id="back" value="返回" class="button" onclick="location.href='<c:url value="/to_mynodes_page_3"/>'"/></td>
</tr>
</table>

</form>
</div></div>
</div>
</body>
</html>