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
	if(document.getElementById("employeeName").value==""){
		alert("请填写员工姓名！");
		return false;
	}
	if(document.getElementById("depotWareNum").value==""){
		alert("请填写商品数量！");
		return false;
	}
	if(document.getElementById("depotWarePrice").value==""){
		alert("请填写商品价格！");
		return false;
	}
}

function modelCheckAll(name, v){
	var checks = document.getElementsByName(name); 
	if(checks.length)
	{ 
		for(var i=0;i<checks.length;i++) 
		{ 
			checks[i].checked = v; 
		} 
	}
	else
	{ 
		checks.checked = v; 
	} 
}

function allCheck(v){
	var from=document.getElementById("createdepot");
	for (var i=0 ; i <from.elements.length;i++)
	{
		if (from.elements[i].type=="checkbox")
		{
			from.elements[i].checked=v;
		}
	}
}

function doAjax(){
    var uName = $("#depotName").val();
    if(uName==""){$("#usrInfo").html("<font color=\"red\">请填写用户名！</font>");$("#depotCheck").val("1");return false;}
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_depot_find_3',
        data: JSON.stringify({
            depotName: uName
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "false") {
            	$("#usrInfo").html("<font color=\"red\">您输入的用户名已存在！请重新输入！</font>");
                $("#depotCheck").val("1");
            }
            else {
                $("#usrInfo").html("");
                $("#depotCheck").val("0");
            }
        },
    });
}

</script>
<title>新建出库记录</title>
</head>
<body>
<div id="main-content">

<font  style="font-family:'微软雅黑'; font-size:30px">新建出库记录</font>
<p>&nbsp;</p>

<div class="content-box">

<form id="createdepot" name="createdepot" action="<c:url value='/do_depot_add_1'/>" method="post" onsubmit="return checkform()">
<input id="depotCheck" type="hidden" value="0"/>
<table>
  <tr>
    <td style="width:15%">请选择营业员组名:</td>
    <td>
    <select name="employeeName" id="employeeName" onchange="doAjax()">
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
	<font color="red">*</font><span id="moneyInfo"></span></td>
  </tr>
  <tr>
    <td>商品名称:</td>
    <td><select name="depotWareName" id="depotWareName">
	  	<c:forEach items="${wares}" var="u" >
			<option value="${u.wareName}">${u.wareName}</option>
		</c:forEach>
	</select></td>
  </tr>
  <tr>
    <td>商品数量:</td>
    <td><input class="text-input" type="text" name="depotWareNum" id="depotWareNum"/></td>
  </tr>
    <tr>
    <td>商品单价:</td>
    <td><input class="text-input" type="text" name="depotWarePrice" id="depotWarePrice"/><font color="red">分</font></td>
  </tr>
  <tr>
    <td></td>
    <td>
	    <input type="submit" name="Submit" id="Submit" value="提交"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="reset" value="重置"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/to_depot_page_3"/>'"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>