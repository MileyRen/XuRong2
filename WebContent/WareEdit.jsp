<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<title>商品信息</title>
 
</head>
<body>
<div id="main-content">
<font style="font-family:'微软雅黑'; font-size:30px">更新商品详细信息</font>
<div class="content-box">
<form name="operate" action="do_ware_update_0" method="post">
<table style="line-height:20px; width:800px; font-size: 14px;">
 <tr>
	<td>
		上次更新时间：
        </td>
        <td><input type="text" id="lTime" name="lTime" value="${pinfo.lastTime}" class="text-input" readonly="readonly" />
	</td>
   </tr>
<tr>
    <td style="width:20%">编号：</td>
     <td>
	<input name="wareId" readonly="readonly" type="text" id="textfield" value="${pinfo.wareId}" class="text-input"/>
     </td>
</tr>
<tr>
  <td style="width:20%">商品编码：</td>
 <td> 
 	<input name="wareCode" type="text" id="textfield" value="${pinfo.wareCode}" class="text-input"/>
 </td>
</tr>
<tr>
  <td style="width:20%">商品名称：</td>
 <td> 
 	<input name="wareName" type="text" id="textfield" value="${pinfo.wareName}" class="text-input"/>
 </td>
</tr>
<tr>
  <td style="width:20%">商品热度：</td>
 <td> 
 	<input name="count" readonly="readonly" type="text" id="textfield" value="${pinfo.count}" class="text-input"/>
 </td>
</tr>
<tr>
  <td style="width:20%">商品规格：</td>
 <td> 
 	<input name="wareNorm" type="text" id="textfield" value="${pinfo.wareNorm}" class="text-input"/>
 </td>
</tr>
<tr>
  <td style="width:20%">商品单位：</td>
 <td> 
 	<input name="wareUnit" type="text" id="textfield" value="${pinfo.wareUnit}" class="text-input"/>
 </td>
</tr>
<tr>
	<td style="width:20%">商品类型：</td>
    <td>
    	<input type="text" id="wareType" name="wareType" value="${pinfo.wareType}" class="text-input" />
	</td>
</tr>
<tr>
	<td style="width:20%">商品状态：</td>
    <td>
    	<input type="text" id="wareStatus" name="wareStatus" value="${pinfo.wareStatus}" class="text-input" />
	</td>
</tr>
<tr>
	<td>商品基价(分):</td>
    <td>
    	<input type="text" id="wareBasePrice" name="wareBasePrice" value="${pinfo.wareBasePrice}" class="text-input"/>
	</td>
</tr>
<tr>
	<td>
		商品描述：
	</td>
    <td>
    	<textarea id="wareDesc" name="wareDesc" style="width:300px;height:100px">${pinfo.wareDesc}</textarea>
	</td>
</tr>
<tr>
   <td></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" id="submit" name="submit" value="提交" class="button">&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="返回" class="button" onclick="location.href='<c:url value="/to_ware_page_3"/>'">
    </td>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>