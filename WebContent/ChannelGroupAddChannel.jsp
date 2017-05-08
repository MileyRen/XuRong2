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
<script type="text/javascript">
function checkform(){
	if(document.getElementById("versionName").value==""){
		alert("请选择货道组版本名称!");
		return false;
	}
	if(document.getElementById("channelId").value==""){
		alert("请填写货道编号!");
		return false;
	}
	if(document.getElementById("wares.wareId").value==""){
		alert("请选择商品编号!");
		return false;
	}
	if(document.getElementById("normalStock").value==""){
		alert("请填写额定存货量!");
		return false;
	}
	if(document.getElementById("stdOut").value==""){
		alert("请填写标准出货数!");
		return false;
	}
}

window.onload=function(){
	//var index=$("#hmonopoly").val();
	//$("form[name='search']").find("select").val(index);
};
</script>

<title>货道组添加货道</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
货道组添加货道</font></p>
<p>&nbsp;</p>

<div class="content-box">

<form action="<c:url value="/do_channelgroup_addchann_1"/>" method="post" name="myform"  style="width:700px;" onsubmit="return checkform()">
 <table style="line-height:20px; width:600px; font-size: 14px;">
<tr>
    <td style="width:25%">货道组版本名:</td>
    <td  style="width:25%">
	<select name="versionName" id="versionName">
	<option value="">请选择</option>
	  	<c:forEach items="${vnames}" var="v" >
			<option value="${v}">${v}</option>
		</c:forEach>
	</select>
	</td>
	<td style="width:50%"></td>
</tr>
    <tr>
    <td>货道编号:</td>
    <td width="25%"><input class="text-input" name="channelId" type="text" id="channelId" /></td>
    <td><font color="red">请确保编号不重复</font></td>
  </tr>
    <tr>
    <td>商品名称:</td>
    <td style='width:25%'>
		<select name='wares.wareId' id='wares.wareId'>
		<option value="">请选择</option>
			<c:forEach items='${wslist}' var='u' >
			<option value='${u.wareId}'>${u.wareName}</option>
			</c:forEach>
		</select>
	</td>
  </tr>
    <tr>
    <td>额定存货量:</td>
    <td width="25%">
    <input class="text-input" name="normalStock" type="text" id="normalStock"/>
    </td>
  </tr>
  <tr>
    <td>标准出货量:</td>
    <td width="25%"><input class="text-input" name="stdOut" value="1" type="text" id="stdOut" /></td>
  </tr>
  <tr>
    <td>类型:</td>
    <td width="25%"><input class="text-input" name="type" type="text" id="type" /></td>
  </tr>
  <!-- 
  <tr>
    <td>更新时间:</td>
    <td width="25%"><input class="text-input" name="lastTime" type="text" id="lastTime" /></td>
  </tr>
   -->
  <tr>
    <td>
    <input type="submit" name="commit" id="commit" class="button" value="提交">
    <!-- 
    <td>
    <input type="button" name="back" id="back" value="取消" class="button" onclick='href="<c:url value='ChannelGroupSearch.jsp'/>"'>
    </td>
     -->
  </tr>
</table>
</form>
</div>
</div>
</body>

</html>