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
	if(ids.length <= 0){alert("请搜索后再提交！");return false;}
	var ns=document.getElementsByName("normalStock");
	var cs=document.getElementsByName("currentNumber");
	var is=document.getElementsByName("incrementNumber");
	for(var i=0; i<ids.length; i++){
		if(parseInt(ns[i].value) < parseInt(cs[i].value) + parseInt(is[i].value)||parseInt(cs[i].value) + parseInt(is[i].value)<0){
		alert("请确保填写正确:\r 额定数量 > 当前存货 + 加货增量  >=0");
			return false;
		}
	}
	if(!confirm("确定按增量方式更新售货机!"))return false;
	return true;
}

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
<!-- 
<p><font style="font-family:'宋体'; font-size:18px;"  color="red" >通过填入增量列表，更新当前售货机货道商品数量为：更新值=数据库值+增量</font></p>
<font style="font-family:'宋体'; font-size:18px;"  color="red" >该方法可用于非实时更新而保持数据库值与真实值一致</font>
 -->
<div class="content-box">
<div class="content-box-content">
<form name="search" action="<c:url value='/do_prochannel_i_0'/>" method="post" onsubmit="return checkform()">
<table> 
<tr>
<td style="width:40%">售货机铭牌号:<input class="text-input" style="width: 40%" type="text" id="nodeName" name="nodeInfo.nodeName" value="${snodename}"/>
				<input type="submit" name="search"  value="搜索"  class="button"/>
</td>
<td><font color="red">${mapinfo}</font></td>
</tr>
</table>
</form>
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
</tr>
</table>

</form>
</div></div>
</div>
</body>
</html>