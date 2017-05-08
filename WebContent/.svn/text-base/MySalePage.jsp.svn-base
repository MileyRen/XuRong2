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
  	<link rel="stylesheet" type="text/css" href="myCSS.css" />
    <script type="text/javascript" src="js\My97DatePicker\WdatePicker.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<style type="text/css">  
<!--  
body{  
     margin:50px auto 0 auto;  
     padding: 0;  
     font-family: Verdana, Arial, Helvetica, sans-serif;  
     font-size: 12px;  
     text-decoration: none;  
}  
a {text-decoration: none;color: #d90000;}  
ul {width: 300px; padding:10px 15px 10px 25px;border: 1px solid #ccc;background: #efefef;}  
li {width: 300px; height:28px; line-height:28px;}  
li a {  
display: block;  
width: 300px;  
overflow: hidden;  
white-space: nowrap;  
-o-text-overflow: ellipsis; /*--4 opera--*/  
text-overflow: ellipsis;}  
  
li:not(p)  
{ clear: both;}  
li:not(p) a  
{max-width: 276px;float: left;}/*--firefox   so BT--*/  
li:not(p):after  
{content: "";float: left;width:25px;padding-left: 5px;color: #d90000;}  
  
-->  
.line_text
{
width:200px;
white-space:nowrap;
word-break:keep-all;
overflow:hidden;
text-overflow:ellipsis;
}
</style> 
<title>我的商品销售</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
我的特殊商品销售</font></p>
<div class="content-box">
<div class="content-box-content">
<form name="operate" action='<c:url value="do_mysale_add_0"/>' method="post" onsubmit="return checkvalue()">
<table id="dis">
<thead>
<tr class="tr_top">
<th  class="title" style="width:10%">机器编号</th><!--  -->
<th  class="title" style="width:10%">机器铭牌号</th>
<th  class="title" style="width:10%">货道编号</th>
<th  class="title" style="width:10%">商品名称</th>
<th  class="title" style="width:10%">销售数量</th>
<th  class="title" style="width:10%">销售价格</th>
<th  class="title" style="width:10%">理论售价</th>
</tr>
</thead>
<tbody>
<c:forEach items="${slist}"  var="nm">
<tr>
<td  width="10%"><input type="text" name="nodeId" readonly="readonly" value="${nm.nodeId}"/></td>
<td  width="10%"><input type="text" name="nodeName" readonly="readonly" value="${nm.nodeName}"/></td>
<td  width="10%"><input type="text" name="channelId" readonly="readonly" value="${nm.channelId}"/></td>
<td  width="10%"><input type="text" name="wareName" readonly="readonly" value="${nm.wareName}"/></td>
<td  width="10%"><input type="text" name="saleNum" value="0"/></td><!-- value="${nm.saleNum}" -->
<td  width="10%"><input type="text" name="salePrice" value="${nm.salePrice}"/></td>
<td  width="10%"><input type="text" name="thoeryPrice" value="${nm.thoeryPrice}"/></td>
</tr>
</c:forEach>
</tbody>
<tr>
<td width="10%">请选择日期</td>
<td width="10%"><input name="Time" id="Time" type="text"  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
<td width="10%"><input type="hidden" id="ename" name="ename" value="${ename}"/></td>
</tr>
<tr>
<td><input type="submit" name="current" id="current" value="提交" class="button"/>
</td>
</tr>
</table>

</form>
</div></div>
</div>
</body>
</html>