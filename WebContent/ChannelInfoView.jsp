<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<title>查看货道详细信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
查看货道详细信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<form id="viewchannel" name="viewchannel"  action="" method="post"  style="width:700px;">
 <table style="line-height:20px; width:600px; font-size: 14px;">
  <tr>
    <td width="30%">售货机铭牌号:</td>
    <td width="60%"><input class="text-input" name="nodeName" value="${channel.nodeInfo.nodeName}" readonly="readonly" type="text" id="nodeName" /></td>
  </tr>
  <tr>
    <td>货道编号:</td>
    <td><input class="text-input" name="channelId" value="${channel.channelId}" readonly="readonly" type="text" id="chnnelId" /></td>
  </tr>
  <tr>
    <td>额定存货量:</td>
    <td><input class="text-input" name="normalStock" value="${channel.normalStock}" readonly="readonly" type="text" id="normalStock" /></td>
  </tr>  
  <tr>
    <td>当前存货量:</td>
    <td><input class="text-input" name="currentStock" value="${channel.currentStock}" readonly="readonly" type="text" id="currentStock" /></td>
  </tr>
  <tr>
    <td>商品名称:</td>
    <td><input class="text-input" name="wareName" value="${channel.PGoodsInfo.wareName}" readonly="readonly"  type="text" id="wareName" /></td>
  </tr>
    <tr>
    <td>商品类型:</td>
    <td><input class="text-input" name="wareType" value="${channel.PGoodsInfo.wareType}" readonly="readonly"  type="text" id="wareType" /></td>
  </tr>
  <tr>
    <td>商品描述:</td>
    <!-- <td><input class="text-input" name="wareDesc" value="${channel.PGoodsInfo.wareDesc}" readonly="readonly"  type="text" id="wareDesc" /></td> -->
    <td><textarea id="wareDesc" style="width:300px;height:100px" name="wareDesc"  readonly="readonly">${channel.PGoodsInfo.wareDesc}</textarea></td>
  </tr> 
  <tr>
    <td></td>
    <td>
    <input type="button" name="back" id="back" value="返回" class="button" onclick="javascript:history.go(-1);"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>

</html>