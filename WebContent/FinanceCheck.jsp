<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://jquery.bassistance.de/treeview/jquery.treeview.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<script src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">
function checkform()
{
	if(document.getElementById("employeeName").value==""){
		alert("请填写员工姓名！");
		return false;
	}
	if(document.getElementById("wareCost").value==""){
		alert("请确认该组已做过货物清算！");
		return false;
	}
}

function doAjax(){
	var ename = $("#employeeName option:selected").attr("value");
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_profit_find_3',
        data: JSON.stringify({
        	employeeName: ename
        }),
        dataType: 'json',
        success: function(data){
        	if(data.success){
	        	$("#turnOverCard").attr("value",data.profit.turnOverCard);
	        	$("#turnOverCash").attr("value",data.profit.turnOverCash);
	        	$("#wareCost").attr("value",data.profit.wareCost);
	        	$("#manageCost").attr("value",Math.round((data.profit.turnOverCash+data.profit.turnOverCash) * 0.1));
	        	$("#moneyCount").attr("value",data.moneyCount);
	        	$("#profitId").attr("value",data.profit.profitId);
	        	
	        	$("#op").show();//2013-06-28修改页面，无数据时不显示
        	}
        	else{
        		$("#op").hide();
        	}
        },
    });
}

$(document).ready(function(){
    $("#op").hide();
    
    $("#employeeName").change(function(){
    	var ename = $("#employeeName option:selected").attr("value");
    	if(ename!=""){
    		doAjax();
//    		$("#op").show();
    	}else{
//    		$("#op").hide();
    	}
    });
});

</script>
<title>财务清算</title>
</head>
<body>
<div id="main-content">

<font  style="font-family:'微软雅黑'; font-size:30px">财务清算</font>
<p>&nbsp;</p>

<div class="content-box">

<form id="createPro" name="createPro" action="<c:url value='/do_finance_check_3'/>" method="post" onsubmit="return checkform()">
<table id="sel">
  <tr>
    <td style="width:15%">请选择营业员组名:</td>
    <td>
    <select name="employeeName" id="employeeName">
    	<option value="">请选择</option>
	  	<c:forEach items="${users}" var="u" >
	  		<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
	</td>
	<td>注：单位为<font color="red">分</font></td>
	<td style="width:35%"></td>
  </tr>
</table>
<table id="op">
<tr>
    <td>商品成本:</td>
    <td><input class="text-input" type="text" name="wareCost" id="wareCost" readonly="readonly"/></td>
  </tr>
<tr>
    <td>刷卡交易额:</td>
    <td><input class="text-input" type="text" name="turnOverCard" id="turnOverCard" readonly="readonly"/></td>
  </tr>
  <tr>
    <td>现金交易额:</td>
    <td><input class="text-input" type="text" name="turnOverCash" id="turnOverCash" readonly="readonly"/></td>
  </tr>
  <tr>
    <td>上缴交易额:</td>
    <td><input class="text-input" type="text" name="moneyCount" id="moneyCount" readonly="readonly"/></td>
  </tr>
    <tr>
    <td>人员管理费:</td>
    <td><input class="text-input" type="text" name="manageCost" id="manageCost"/></td>
  </tr>
  <tr>
    <td>点位补贴:</td>
    <td><input class="text-input" type="text" name="loactionAllowance" id="loactionAllowance" value="0"/></td>
  </tr>
  <tr>
    <td>点位费用:</td>
    <td><input class="text-input" type="text" name="locationCost" id="locationCost" value="0"/></td>
  </tr>
  <tr>
    <td>汽车燃油费:</td>
    <td><input class="text-input" type="text" name="carGasCost" id="carGasCost" value="0"/></td>
  </tr>
  <tr>
    <td>汽车修理费:</td>
    <td><input class="text-input" type="text" name="carRepaireCost" id="carRepaireCost" value="0"/></td>
  </tr>
	<tr>
    <td>工资:</td>
    <td><input class="text-input" type="text" name="wages" id="wages" value="0"/></td>
  </tr>
  <tr>
    <td>四金:</td>
    <td><input class="text-input" type="text" name="insurances" id="insurances" value="0"/></td>
  </tr>
  <tr>
    <td>税收:</td>
    <td><input class="text-input" type="text" name="cost6" id="cost6" value="0"/></td>
  </tr>
    <tr>
    <td>其他费用1:</td>
    <td><input class="text-input" type="text" name="cost1" id="cost1" value="0"/></td>
  </tr>
  <tr>
    <td>其他费用2:</td>
    <td><input class="text-input" type="text" name="cost3" id="cost3" value="0"/></td>
  </tr>
  <tr>
    <td>其他费用3:</td>
    <td><input class="text-input" type="text" name="cost4" id="cost4" value="0"/></td>
  </tr>
  <tr>
    <td>其他费用4:</td>
    <td><input class="text-input" type="text" name="cost5" id="cost5" value="0"/></td>
  </tr>
  <tr>
    <td></td>
    <td><input type="hidden" id="profitId" name="profitId"/>
	    <input type="submit" name="submit" id="submit" value="提交" class="button" />
	    
	  <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="重置"  class="button" /> --> 
    </td>
  </tr>
  </table>
</form>
</div>
</div>
</body>
</html>