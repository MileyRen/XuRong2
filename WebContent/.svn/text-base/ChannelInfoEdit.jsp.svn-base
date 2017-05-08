<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<script language="javascript" type="text/javascript">
$(document).ready(function(){ 
	$("#commit").click(
		function(){
		//	alert("检测表单");
		if($("#wareId").val()==$("#hwareId").val()&&$("#normalStock").val()==$("#hnormalStock").val())
		{
			location.href="to_prochannel_page_3";
		}
		else
		{
			if((confirm("要生成历史记录吗？")))
			{
				$("#his").val("1");
			}
			return true;
		}
	});	
});
</script>
<title>编辑货道详细信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
编辑货道详细信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<form id="editchannel" name="editchannel"  action="<c:url value='/do_prochannel_edit_0'/>" method="post"  style="width:700px;">
 <table style="line-height:20px; width:600px; font-size: 14px;">
    <tr>
    <td width="25%">设备货道号:</td>
    <td width="40%"><input class="text-input" name="id" value="${channel.id}" type="text" id="id"  readonly="readonly"/></td>
  </tr>
  <tr>
    <td width="25%">售货机铭牌号:</td>
    <td width="40%"><input class="text-input" name="nodeInfo.nodeName" value="${channel.nodeInfo.nodeName}" type="text" id="nodeInfo.nodeName"  readonly="readonly"/></td>
  </tr>
  <tr>
    <td>货道编号:</td>
    <td><input class="text-input" name="channelId" value="${channel.channelId}" type="text" id="channelId"  readonly="readonly"/></td>
  </tr> 
  <tr>
    <td width="25%">商品编号:</td>
    <td width="40%">
    <input class="text-input"  readonly="readonly"  name="wareId" value="${channel.PGoodsInfo.wareId}" type="text" id="wareId" />
    <input name="hwareId" value="${channel.PGoodsInfo.wareId}" type="hidden" id="hwareId" />
    </td>
    <td  style="width:15%"><input type="button" name="btnSearpro" id="btnSearpro" class="button" value="选择商品" onclick="location.href='<c:url value="/to_goods_select_3?pcid=${channel.id}"/>'"></td>
  </tr>																									  <!-- onclick="location.href='<c:url value="/to_location_selectLocationInNode_3?id=${nodeinfo.nodeId}"/>'" -->
  <tr>
    <td>商品名称:</td>
    <td><input class="text-input" name="wareName" value="${channel.PGoodsInfo.wareName}" readonly="readonly" type="text" id="wareName"/>
  </tr>
    <tr>
    <td>额定存货量:</td>
    <td><input class="text-input" name="normalStock" value="${channel.normalStock}" type="text" id="normalStock"/>
    <input type="hidden" name="hnormalStock" value="${channel.normalStock}" id="hnormalStock"/></td>
  </tr>
  <tr>
    <td>
    <input type="hidden" name="his" id="his" value="0"/>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="commit" id="commit" class="button" value="提交"/>
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