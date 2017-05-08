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
</script>

<title>编辑货道信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
编辑货道信息</font></p>
<p>&nbsp;</p>

<div class="content-box">

<form action="<c:url value="/do_channelgroup_edit_0"/>" method="post" name="myform"  style="width:700px;">
 <table style="line-height:20px; width:600px; font-size: 14px;">
  <tr>
    <td width="30%">编号:</td>
    <td width="50%"  style="background:"><input class="text-input" name="id" value="${cginfo.id}" readonly="readonly" type="text" id="id" /></td>
  </tr>
    <tr>
    <td width="30%">货道版本名称:</td>
    <td width="50%"><input class="text-input" name="versionName" value="${cginfo.versionName}" readonly="readonly" type="text" id="versionName" /></td>
  </tr>
    <tr>
    <td>货道编号:</td>
    <td width="50%">
    <input class="text-input" name="channelId" value="${cginfo.channelId}" type="text" id="channelId" />
    <input name="hchannelId" value="${cginfo.channelId}" type="hidden" id="hchannelId" />
    </td>
    
  </tr>
    <tr>
    <td>商品名称:</td>
    <td style='width:50%'>
		<select name='wares.wareId' id='wares.wareId'>
			<option value='${cginfo.wares.wareId}'>${cginfo.wares.wareName}</option>
			<c:forEach items='${wslist}' var='u' >
			<option value='${u.wareId}'>${u.wareName}</option>
			</c:forEach>
		</select>
	</td>
	<!-- <td width="50%"><input class="text-input" name="wares.wareId" value="${cginfo.wares.wareId}" readonly="readonly" type="text" id="wares.wareId" /></td> -->
    
  </tr>
    <tr>
    <td>额定存货量:</td>
    <td width="50%">
    <input class="text-input" name="normalStock" value="${cginfo.normalStock}" type="text" id="normalStock"/>
    </td>
  </tr>
  <tr>
    <td>标准出货量:</td>
    <td width="50%"><input class="text-input" name="stdOut" value="${cginfo.stdOut}" type="text" id="stdOut" /></td>
  </tr>
  <tr>
    <td>类型:</td>
    <td width="50%"><input class="text-input" name="type" value="${cginfo.type}" type="text" id="type" /></td>
  </tr>
  <tr>
    <td>更新时间:</td>
    <td width="50%"><input class="text-input" name="lastTime" value="${cginfo.lastTime}" type="text" id="lastTime" /></td>
  </tr>
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