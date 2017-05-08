<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<font style="font-family:'微软雅黑'; font-size:30px">商品详细信息</font>
<div class="content-box">
<form name="operate" action="" method="post">
<table style="line-height:20px; width:800px; font-size: 14px;">
 <tr>
	<td>
		更新时间：
        </td>
        <td><input type="text" id="lastTime" name="lastTime" value="${pinfo.lastTime}" class="text-input" readonly="readonly" />
	</td>
   </tr>
<tr>
    <td style="width:20%">商品编号：</td>
     <td> <input name="wareId" readonly="readonly" type="text" id="textfield" value="${pinfo.wareId}" class="text-input"/>
     <input type="hidden" name="id" value="${pinfo.wareId}"  /></td>
  </tr>
  <tr>
    <td>编码:</td>
    <td><input class="text-input" type="text" name="wareCode" id="wareCode" value="${pinfo.wareCode}"/></td>
  </tr>
  <tr>
    <td style="width:20%">商品名称：</td>
     <td> <input name="wareName" readonly="readonly" type="text" id="textfield" value="${pinfo.wareName}" class="text-input"/>
     <input type="hidden" name="id" value="${pinfo.wareId}"  /></td>
  </tr>
    <tr>
	<td>
		商品类型：
        </td>
        <td><input type="text" id="wareType" name="wareType" value="${pinfo.wareType}" class="text-input" readonly="readonly" />
	</td>
   </tr>
   <tr>
    <td>规格:</td>
    <td><input class="text-input" type="text" name="wareNorm" id="wareNorm" value="${pinfo.wareNorm}"/></td>
  </tr>
  <tr>
    <td>单位:</td>
    <td><input class="text-input" type="text" name="wareUnit" id="wareUnit" value="${pinfo.wareUnit}"/></td>
  </tr>

<tr>
	<td>
		商品进价：
    </td>
    <td>
    	<input type="text" id="wareBasePrice" name="wareBasePrice" value="${pinfo.wareBasePrice}" class="text-input" readonly="readonly" />
	</td>
</tr>

<tr>
	<td>
		商品描述：
	</td>
    <td>
    	<textarea id="wareDesc" name="wareDesc" style="width:300px;height:100px" readonly="readonly">${pinfo.wareDesc}</textarea>
	</td>
</tr>
<tr>
   <td></td>
    <td>
    <div style="margin:0px auto;">
    <input type="button" value="返回" class="button" onclick="location.href='<c:url value="/to_ware_page_3"/>'">
    </div>
    </td>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>