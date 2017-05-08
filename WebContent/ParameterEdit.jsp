<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<title>参数信息</title>
</head>
<body>
<div id="main-content">
<font  style="font-family:'微软雅黑'; font-size:30px">参数信息</font>
<p>&nbsp;</p>
<div class="content-box">
<form name="operate" action="<c:url value="/do_param_update_1"/>" method="post" style="width: 100%" onsubmit="return checkform()">
<table>
<tr>
	<td>延迟时间：</td>
	<td><input class="text-input" name="priip" type="text" value="${param.delayTime}"></td>
</tr>
<tr>
	<td>查询周期：</td>
	<td><input class="text-input" name="fport" type="text" value="${param.cycleTime}"></td>
</tr>
<tr>
    <td></td>
    <td>
    <input type="submit" name="modify" value="修改" class="button"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>