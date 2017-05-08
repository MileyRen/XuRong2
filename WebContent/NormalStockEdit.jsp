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
function checkform()
{
	if(document.getElementById("nodeName").value==""){
		alert("请填写售货机铭牌号！");
		return false;
	}
}

function checkvalue(){
	var ids=document.getElementsByName("id");
	if(ids.length<=0){alert("请搜索后再提交！");return false;}
	var ns=document.getElementsByName("normalStock");
	for(var i=0; i<ids.length; i++){
		if(ns[i].value==""){alert("存货量不能为空!");return false;}
	}
	if(!confirm("确认按所填写数据更新额定存货量？"))return false;
	return true;
}

function dosearch(choose) {
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 

}
</script>
<title>更新存货信息</title>
</head>
<body>
<div id="main-content">

<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
编辑额定存货量</font></p>
<p>&nbsp;</p>

<div class="content-box"  align="center">
<div class="content-box-content"  align="center">
<form name="search" action="<c:url value='/do_prochannel_searchallforeditnormalstock_0'/>" method="post" onsubmit="return checkform()">
<table> 
<tr>
<td style="width:40%">售货机铭牌号:   <input class="text-input" style="width: 40%" type="text" id="nodeName" name="nodeInfo.nodeName" value="${snodename}"/>
				<input type="submit" name="search"  value="搜索"  class="button"/>
</td>
<td><font color="red">${mapinfo}</font></td>
</tr>
</table>
</form>
<form name="operate" action='<c:url value="/do_prochannel_editnormalstock_0"/>' method="post" onsubmit="return checkvalue()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:15%">售货机货道号</th>
<th  class="title" style="width:15%">额定数量</th>
</tr>
</thead>
<tbody>
<c:forEach items="${pclist}"  var="channelStock">
<tr>
<td  width="15%" align="center" ><input name="id" readonly="readonly" value="${channelStock.id}" type="hidden"/>
<input name="channelId" readonly="readonly" value="${channelStock.channelId}" type="text"/>
</td>
<td  width="15%" align="center" ><input type="text" name="normalStock" value="${channelStock.normalStock}"/></td>
</tr>
</c:forEach>
</tbody>
<tr>
<td><input type="submit" name="current" id="current" value="提交" class="button"/></td>
</tr>
</table>

</form>
</div></div>
</div>
</body>
</html>