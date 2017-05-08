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

<script language="javascript" type="text/javascript">
window.onload=function(){
	var index=$("#hmonopoly").val();
	$("form[name='search']").find("select").val(index);
};
/*
 $(document).ready(function(){ 
		$("#commit").click(
				function(){
				//	alert("检测表单");
				if($("#simNo").val()==$("#hsimNo").val()&&$("#locationId").val()==$("#hlocationId").val()&&$("#monopoly").val()==$("#hmonopoly").val())
				{
					location.href="to_node_page_3";
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
 */

</script>

<title>编辑售货机信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
编辑售货机信息</font></p>
<p>&nbsp;</p>

<div class="content-box">

<form action="<c:url value="/do_node_update_0"/>" method="post" name="myform"  style="width:700px;">
 <table style="line-height:20px; width:600px; font-size: 14px;">
  <tr>
    <td width="30%">设备编号:</td>
    <td width="50%"  style="background:"><input class="text-input" style="background:gray" name="nodeId" value="${nodeinfo.nodeId}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td width="30%">设备铭牌号:</td>
    <td width="50%"><input class="text-input" name="nodeName" value="${nodeinfo.nodeName}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td width="20%">请选择货道组:</td>
    <td width="40%">
    <select name="versionName" id="versionName">
    <option value="${nodeinfo.versionName}">${nodeinfo.versionName}</option>
	  	<c:forEach items="${vnames}" var="v" >
			<option value="${v}">${v}</option>
		</c:forEach>
	</select>
	<input type="hidden" value="${nodeinfo.versionName}" name="hversionName" id="hversionName"/>
    </td>
  </tr>
  <tr>
    <td width="20%">请选择设备组:</td>
    <td width="40%">
    <select name="nodeGroupInfo.nodeGroupId" id="nodeGroupInfo.nodeGroupId">
    <option value="${nodeinfo.nodeGroupInfo.nodeGroupId}">${nodeinfo.nodeGroupInfo.nodeGroupName}</option>
	  	<c:forEach items="${ngilist}" var="v" >
			<option value="${v.nodeGroupId}">${v.nodeGroupName}</option>
		</c:forEach>
	</select>
    </td>
  </tr>
    <tr>
    <td>连接状态:</td>
    <td width="50%"><input class="text-input" name="nodeStatus" value="${nodeinfo.nodeStatus}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td>主板号:</td>
    <td width="50%"><input class="text-input" name="macAddr" value="${nodeinfo.macAddr}" readonly="readonly" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td>SIM卡号:</td>
    <td width="50%">
    <input class="text-input" name="simNo" value="${nodeinfo.simNo}" type="text" id="simNo"/>
    </td>
  </tr>
      <tr>
    <td>机器类型:</td>
    <td width="50%"><input class="text-input" name="machineType" value="${nodeinfo.machineType}" type="text" id="textfield" /></td>
  </tr>
    <tr>
    <td>是否专卖:</td>
  	<td>
	  	<select name="monopoly" id="monopoly">
	       <option value="1" selected="selected">非专卖</option>
	       <option value="2">是专卖</option>
		</select>
	</td>
  </tr>
  
    <tr>
    <td>机器地址:</td><!-- <input class="text-input" name="nodeAddr" value="${nodeinfo.nodeAddr}" type="text" id="textfield" /> -->
    <td><textarea name="nodeAddr" cols="30" rows="5">${nodeinfo.nodeAddr}</textarea></td>
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