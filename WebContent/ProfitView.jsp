<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<title>售货机详细信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
查看售货机详细信息</font></p>
<p>&nbsp;</p>
<div class="content-box">

<form action="" method="post" name="myform"  style="width:700px;">
 <table style="line-height:20px; width:600px; font-size: 14px;">
  <tr>
    <td>营业员组:</td>
    <td><input class="text-input" type="text" readonly="readonly" readonly="readonly" name="employeeName" id="employeeName" value="${pinfo.employeeName}"/></td>
  </tr>
  <tr>
    <td>刷卡交易额:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="turnOverCard" id="turnOverCard" value="${pinfo.turnOverCard}"/></td>
  </tr>
  <tr>
    <td>现金交易额:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="turnOverCash" id="turnOverCash" value="${pinfo.turnOverCash}"/></td>
  </tr>
  <tr>
    <td>上缴交易额:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="moneyCount" id="moneyCount" value="${pinfo.moneyCount}"/></td>
  </tr>
    <tr>
    <td>人员管理费:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="manageCost" id="manageCost" value="${pinfo.manageCost}"/></td>
  </tr>
  <tr>
    <td>点位补贴:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="loactionAllowance" id="loactionAllowance" value="${pinfo.loactionAllowance}"/></td>
  </tr>
  <tr>
    <td>点位费用:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="locationCost" id="locationCost" value="${pinfo.locationCost}"/></td>
  </tr>
  <tr>
    <td>汽车燃油费:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="carGasCost" id="carGasCost" value="${pinfo.carGasCost}"/></td>
  </tr>
  <tr>
    <td>汽车修理费:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="carRepaireCost" id="carRepaireCost" value="${pinfo.carRepaireCost}"/></td>
  </tr>
	<tr>
    <td>工资:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="wages" id="wages" value="${pinfo.wages}"/></td>
  </tr>
  <tr>
    <td>四金:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="insurances" id="insurances" value="${pinfo.insurances}"/></td>
  </tr>
    <tr>
    <td>其他费用:</td>
    <td><input class="text-input" type="text" readonly="readonly" name="cost1" id="cost1" value="${pinfo.cost1}"/></td>
  </tr>
      <tr>
    <td>
    </td><td>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="back" id="back" value="返回" class="button" onclick="javascript:history.go(-1);"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>