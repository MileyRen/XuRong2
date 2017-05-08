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
	if(document.getElementById("employeeName").value==""){
		alert("请填写营业员组名！");
		return false;
	}
}

function checkvalue(){
	var ids=document.getElementsByName("stockId");
	if(ids.length <= 0){alert("请搜索后再提交！");return false;}
	if(!confirm("确定更新!"))return false;
	return true;
}

function dosearch(choose) {
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 
}
</script>
<title>库存清算</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
库存清算信息</font></p>
<p>&nbsp;</p>
<div class="content-box">
<div class="content-box-content">
<form name="search" action="<c:url value='/do_stock_checksearch_3'/>" method="post" onsubmit="return checkform()">
<table>
<tr>
    <td style="width:20%">请选择营业员组名:</td>
    <td style="width:20%">
    <select name="employeeName" id="employeeName" STYLE="width: 85%">
    <option value="">请选择</option>
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
	</td>
	<td style="width:10%"><input type="submit" value="搜索"/></td>
	
	<td style="width:50%"><font color="red">${who}</font>   上次清算时间：  <font color="red">${lasttime}</font></td>
	<!-- <td style="width:50%"></td> -->
  </tr>
</table>
</form>
<form name="operate" action="<c:url value='/do_stock_update_0'/>" method="post" onsubmit="return checkvalue()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" width="20%">商品名称</th>
<th  class="title" width="10%">上月留存数</th>
<th  class="title" width="10%">本月取货数</th>
<th  class="title" width="10%">理论清算数</th>
<th  class="title" width="10%">真实清算数</th>
</tr>
</thead>
<tbody>
<c:forEach items="${mslist}"  var="ml">
<tr>
<td  width="20%">
<input class="text-input" style="width: 80%" type="text" name="wareName" readonly="readonly" value="${ml.wareName}"/>
<input type="hidden" name="stockId" readonly="readonly" value="${ml.stockId}"/>
</td>
<td  width="10%"><input class="text-input" style="width: 80%" type="text" name="lastMonthNum" readonly="readonly" value="${ml.lastMonthNum}"/></td>
<td  width="10%"><input class="text-input" style="width: 80%" type="text" name="depotWareNum" readonly="readonly" value="${ml.depotWareNum}"/></td>
<td  width="10%"><input class="text-input" style="width: 80%" type="text" name="currentWareNum" readonly="readonly" value="${ml.currentWareNum}"/></td>
<td  width="10%"><input class="text-input" style="width: 80%;background-color:yellow" type="text" name="checkStoreNum" value="${ml.currentWareNum}"/></td>
</tr>
</c:forEach>
</tbody>
<tr>
<td><input type="submit" name="current" id="current" value="提交" class="button"/>
<input name="ename" id="ename" type="hidden" value="${eName}" readonly="readonly"/>
</td>
</tr>
</table>

</form>
</div></div>
</div>
</body>
</html>