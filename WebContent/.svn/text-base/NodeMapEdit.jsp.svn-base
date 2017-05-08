<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />

<title>更新售货机配置信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
编辑售货机配置</font></p>
<p>&nbsp;</p>

<div class="content-box">

<form action="<c:url value="/do_map_edit_0"/>" method="post" name="myform"  style="width:700px;">
 <table style="line-height:20px; width:600px; font-size: 14px;">
  <tr>
    <td width="30%">设备编号:</td>
    <td width="50%"  style="background:"><input class="text-input" style="background:gray" name="nodeId" value="${mapinfo.nodeId}" readonly="readonly" type="text" id="textfield" />
    <input name="id" value="${mapinfo.id}" readonly="readonly" type="hidden"/>
    <input name="nodeName" value="${mapinfo.nodeName}" readonly="readonly" type="hidden"/>
    </td>
  </tr>
  <tr>
    <td>选择用户:</td>
  	<td>
	  	<select name="userId" id="userId">
	       <c:forEach items="${users}" var="users">
			<option value="${users.userId}">${users.employeeName}</option>
		</c:forEach>
		</select>
	</td>
  </tr>
  
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="commit" id="commit" class="button" value="提交">
    <td>
    <input type="button" name="back" id="back" value="取消" class="button" onclick='javascript:history.go(-1);'>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>

</html>