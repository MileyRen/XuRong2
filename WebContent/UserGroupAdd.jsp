<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-1.8.2.js"></script>
<link rel="stylesheet" href="http://jquery.bassistance.de/treeview/jquery.treeview.css" type="text/css" />
<script type="text/javascript" src="js/jquery.treeview.js"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<script>
$(document).ready(function(){
$("#example").treeview();
});
</script>
<script type="text/javascript">
function checkform()
{
	var m=0;
	if(document.getElementById("groupName").value==""){
		alert("请填写组名！");
		return false;
	}
	if(document.getElementById("groupCheck").value=="1"){
		alert("请重新填写组名！");
		return false;
	}
}

function doAjax(){
    var uName = $("#groupName").val();
    if(uName==""){$("#groupInfo").html("<font color=\"red\">请填写用户名！</font>");$("#groupCheck").val("1");return false;}
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_group_find_3',
        data: JSON.stringify({
            groupName: uName
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "false") {
            	$("#groupInfo").html("<font color=\"red\">您输入的用户组已存在！请重新输入！</font>");
                $("#groupCheck").val("1");
            }
            else {
                $("#groupInfo").html("");
                $("#groupCheck").val("0");
            }
        },
    });
}

</script>
<title>新建用户组</title>
</head>
<body>
<div id="main-content">

<font  style="font-family:'微软雅黑'; font-size:30px">新建用户组</font>
<p>&nbsp;</p>

<div class="content-box">

<form id="creategroup" name="creategroup" action="<c:url value='/do_group_add_1'/>" method="post" onsubmit="return checkform()">
<input id="groupCheck" type="hidden" value="0"/>
<table>
  <tr>
    <td style="width:20%">用户组名称:</td>
    <td style="width:60%"><input class="text-input" name="groupName" type="text" id="groupName" onblur="doAjax()"/><font color="red">*</font><span id="groupInfo"></span></td>
  </tr>
    <tr>
  	<td>负责人姓名选择：</td>
  	<td>
	  	<select name="groupLeader" id="groupLeader" style="width:150px;">
	  	<c:forEach items="${empNames}" var="empNames" >
			<option value="${empNames.employeeName}">${empNames.employeeName}</option>
		</c:forEach>
	  	</select>
  	</td>
  </tr>
  <tr>
  	<td>上级组选择：</td>
  	<td>
	  	<select name="parentId" id="parentId" style="width:150px;">
	  	<c:forEach items="${groups}" var="group" >
			<option value="${group.groupId}">${group.groupName}</option>
		</c:forEach>
	  	</select>
  	</td>
  </tr>
    <tr>
    <td style="vertical-align: middle;">用户组描述:</td>
    <td><textarea name="groupDesc" id="groupDesc" rows="5"></textarea></td>
  </tr>
  <tr>
    <td></td>
    <td>
	    <input type="submit" name="Submit" id="Submit" value="提交"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="reset" value="重置"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/to_group_page_3"/>'"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>