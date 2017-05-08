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
<script src="js/jquery-1.8.2.js"></script>
<script language="javascript" type="text/javascript">
function doAjax(){
    var nid = $("#nodeId").val();
    if(nid==""){$("#idinfo").html("<font color=\"red\">请填写售货机编号！</font>");$("#check").val("1");return false;}
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_node_findid_3',
        data: JSON.stringify({
        	nodeId: nid
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "false") {
            	$("#idinfo").html("<font color=\"red\">您输入的售货机编号已存在！请重新输入！</font>");
                $("#check").val("1");
            }
            else {
                $("#idinfo").html("");
                $("#check").val("0");
            }
        },
    });
}

function doAjax2(){
    var nname = $("#nodeName").val();
    if(nname==""){$("#nameinfo").html("<font color=\"red\">请填写售货机铭牌号！</font>");$("#check").val("1");return false;}
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_node_findname_3',
        data: JSON.stringify({
        	nodeName: nname
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "false") {
            	$("#nameinfo").html("<font color=\"red\">您输入的售货机铭牌号已存在！请重新输入！</font>");
                $("#check").val("1");
            }
            else {
                $("#nameinfo").html("");
                $("#check").val("0");
            }
        },
    });
}

function checkform()
{
	if(document.getElementById("nodeId").value==""){
		alert("请填写机器编号！");
		return false;
	}
	if(document.getElementById("nodeName").value==""){
		alert("请填写铭牌号！");
		return false;
	}
	if ($("check").val() == "1") {
        alert("请确认所填内容！");
        return false;
    }
		
}
</script>

<title>添加售货机信息</title>
</head>
<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
添加售货机信息</font></p>
<p>&nbsp;</p>

<div class="content-box">

<form action="<c:url value="/do_node_add_1"/>" method="post" name="myform"  style="width:700px;" onsubmit="return checkform()">
 <table style="line-height:20px; width:600px; font-size: 14px;">
  <tr>
    <td width="20%">设备编号:</td>
    <td width="40%"><input class="text-input" name="nodeId" value="${nodeinfo.nodeId}"  type="text" id="nodeId" onblur="doAjax()"/></td><td><font color="red">*</font><span id="idinfo"></span></td>
  </tr>
  <tr>
    <td width="20%">设备铭牌号:</td>
    <td width="40%"><input class="text-input" name="nodeName" value="${nodeinfo.nodeName}"  type="text" id="nodeName" onblur="doAjax2()"/></td><td><font color="red">*</font><span id="nameinfo"></span></td>
  </tr>
  <tr>
    <td width="20%">请选择货道组:</td>
    <td width="40%">
    <select name="versionName" id="versionName">
	  	<c:forEach items="${vnames}" var="v" >
			<option value="${v}">${v}</option>
		</c:forEach>
	</select>
    </td>
  </tr>
 <tr>
    <td width="20%">请选择设备组:</td>
    <td width="40%">
    <select name="nodeGroupInfo.nodeGroupId" id="nodeGroupInfo.nodeGroupId">
	  	<c:forEach items="${ngilist}" var="v" >
			<option value="${v.nodeGroupId}">${v.nodeGroupName}</option>
		</c:forEach>
	</select>
    </td>
  </tr>
  <tr>
    <td>主板号:</td>
    <td width="40%"><input class="text-input" name="macAddr" value="${nodeinfo.macAddr}"  type="text" id="macAddr" /></td>
  </tr>
    <tr>
    <td>SIM卡号:</td>
    <td width="40%">
    <input class="text-input" name="simNo" value="${nodeinfo.simNo}" type="text" id="simNo"/>
    </td>
  </tr>
      <tr>
    <td>机器类型:</td>
    <td width="40%">
    <!-- <input class="text-input" name="machineType" value="${nodeinfo.machineType}" type="text" id="machineType" /> -->
    <select name="machineType" id="machineType">
	  	<c:forEach items="${mtypelist}" var="mt" >
			<option value="${mt}">${mt}</option>
		</c:forEach>
	 </select>
	 </td>
  </tr>
    <tr>
    <td>是否专卖:</td>
  	<td>
	  	<select name="monopoly" id="monopoly">
	       <option value="1" selected="selected">非专卖</option>
	       <option value="2">是专卖</option>
		</select>
		<input name="hmonopoly" id="hmonopoly" type="hidden" value="${nodeinfo.monopoly}" />
	</td>
  </tr>
  
    <tr>
    <td>机器地址:</td><!-- <input class="text-input" name="nodeAddr" value="${nodeinfo.nodeAddr}" type="text" id="textfield" /> -->
    <td><textarea name="nodeAddr" cols="30" rows="5">${nodeinfo.nodeAddr}</textarea></td>
  </tr>
  
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="commit" id="commit" class="button" value="提交">
    <input type="hidden" name="check" id="check" value="0"/>
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