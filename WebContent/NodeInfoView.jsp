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
    <td width="30%">节点ID:</td>
    <td width="50%"><input class="text-input" name="nodeId" value="${nodeinfo.nodeId}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td>连接状态:</td>
    <td><input class="text-input" name="nodestatus" value="${nodeinfo.nodeStatus}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td>主板号:</td>
    <td><input class="text-input" name="macaddr" value="${nodeinfo.macAddr}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td>SIM卡号:</td>
    <td><input class="text-input" name="simno" value="${nodeinfo.simNo}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td>机器类型:</td>
    <td><input class="text-input" name="machinetype" value="${nodeinfo.machineType}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td>是否专卖:</td>
    <td  style="width:10%">
	<c:if test="${nodeinfo.monopoly == '1'}">非专卖</c:if>
	<c:if test="${nodeinfo.monopoly == '2'}">是专卖</c:if>
</td>
  </tr>
  <tr>
    <td>机器地址:</td><!-- <input class="text-input" name="nodeAddr" value="${nodeinfo.nodeAddr}" readonly="readonly" type="text" id="textfield" /> -->
    <td><textarea name="nodeAddr" cols="30" rows="5" readonly="readonly">${nodeinfo.nodeAddr}</textarea></td>
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