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
<script src="js/jquery-1.8.2.js" type="text/javascript" ></script> 
<script type="text/javascript">
function checkform()
{
	if(document.getElementById("employeeName").value==""){
		alert("请选择组名！");
		return false;
	}
}
function checkvalue(){
	var ids=document.getElementsByName("nodeName");
	if(ids.length <= 0){alert("请搜索后再提交！");return false;}
	return true;
}
function dosearch(choose) {
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 
}

window.onload=function(){
	$("#dis").hide();
	$("#addall").hide();
	$("#moneyIn").hide();
	$("#mlabel").hide();
	$("#search").hide();
	
    $("#type").change(function(){
    	var type = $("#type option:selected").attr("value");
    	if(type=="1"){
    		$("#dis").show();
    		$("#search").show();
    	}else if(type=="2"){
    		$("#addall").show();
    		$("#moneyIn").show();
    		$("#mlabel").show();
    	}
    });
    
	var ids=document.getElementsByName("nodeName");
	if(ids.length > 0){
		$("#dis").show();
		$("#search").show();
	}
	
	$("#addall").click(function(){
		if(document.getElementById("employeeName").value==""){
			alert("请选择组名！");
			return false;
		}
		if($("#moneyIn").val()==""||$("#moneyIn").val()==0){
	 		alert("请填写总金额！");
	      	return false;
 		}
 	document.forms["search"].action='do_money_add_1';//<c:url value='/do_nodeerr_add_1'/>
	document.forms["search"].submit();
	});
};
</script>
<title>新增组营业额上缴</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
组营业额上缴</font></p>
<div class="content-box">
<div class="content-box-content">
<form name="search" action="<c:url value='/do_map_usersearch_3'/>" method="post" onsubmit="return checkform()">
<table> 
<tr>
<td style="width:15%">
<select name="type" id="type" style="width:150px;">
	<option value="">请选择上缴方式</option>
	<option value="1">按售货机上缴</option>
	<option value="2">按总额上缴</option>
</select>
</td>
<td style="width:25%">
	<select name="employeeName" id="employeeName" style="width:150px;">
	<option value="">请选择营业员组</option>
		<c:forEach items="${users}" var="u" >
			<option value="${u}">${u}</option>
		</c:forEach>
	</select>
</td>
<td style="width:10%">
	<input type="submit" name="search" id="search" value="搜索"  class="button"/>
</td>
<td width="20%" id="mlabel">上缴总金额(分):</td><td width="20%"><input class="text-input" type="text" name="moneyIn" id="moneyIn"/></td><td width="10%"><input type="button" name="addall" id="addall" value="提交"  class="button"/></td>
</tr>
</table>
</form>
<form name="operate" action='<c:url value="/do_money_AddUN_0"/>' method="post" onsubmit="return checkvalue()">
<table id="dis">
<thead>
<tr class="tr_top">
<th  class="title" style="width:15%">营业员组</th>
<th  class="title" style="width:15%">售货机铭牌号</th>
<th  class="title" style="width:10%">上缴金额(分)</th>
</tr>
</thead>
<tbody>
<c:forEach items="${nmlist}"  var="nm">
<tr>
<td  width="10%" align="center" ><input type="text" name="employeeName" readonly="readonly" value="${nm.employeeName}"/></td>
<td  width="10%" align="center" ><input type="text" name="nodeName" readonly="readonly" value="${nm.nodeName}"/></td>
<td  width="10%" align="center" ><input type="text" name="moneyIn" value="0" style="background-color: yellow"/></td>
</tr>
</c:forEach>
</tbody>
<tr>
<td><input type="submit" name="current" id="current" value="提交" class="button"/>
<input type="hidden" id="ename" name="ename" value="${ename}"/>
</td>
</tr>
</table>

</form>
</div></div>
</div>
</body>
</html>