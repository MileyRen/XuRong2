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
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">
function doAjax(){
	var vname = $("#versionName").attr("value");
	if(vname==""){
		$("#vninfo").html("<font color=\"red\">请填写货道版本名称！</font>");
		$("#vcheck").val("1");
		return false;
		}
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_channelgroup_find_3',
        data: JSON.stringify({
        	versionName: vname
        }),
        dataType: 'json',
        success: function(data){
            if (data && data.success == "false") {
            	$("#vninfo").html("<font color=\"red\">您输入的货道组版本名称已存在！请重新输入！</font>");
                $("#vcheck").val("1");
            }
            else {
                $("#vninfo").html("");
                $("#vcheck").val("0");
            }
        },
    });
}

$(document).ready(function(){
    var seq = 0;//序号
    //alert("ready");
    $("#but").click(function(){
    	//alert("button click!");
    	var wi = $("#wareId option:selected").attr("value");//.text();
    	//alert(dwn);
    	var wn = $("#wareId option:selected").text();//.text();
    	if(wi == ""){alert("请选择商品名");return false;}
    	var cid = $("#channelId").attr("value");
    	if(cid==""){alert("请填写货道编号");return false;}
    	var ns = $("#normalStock").attr("value");
    	if(ns==""){alert("请填写额定存货量");return false;}
    	var so = $("#stdOut").attr("value");
    	if(so==""){alert("请填写标准出货数");return false;}
    	var ty = $("#type").attr("value");
    	
    	$("#tab").append("<tr id="+seq+" align='center'>"
    			+"<td style='width:10%'><input type='text' name='wn' id='wn' value='"+wn+"'/><input type='hidden' name='wid' id='wid' value='"+wi+"'/></td>"
                +"<td style='width:20%'><input type='text' name='cid' id='cid' value='"+cid+"'/></td>"
			    +"<td style='width:10%'><input type='text' name='ns' id='ns' value='"+ns+"'/></td>"
			    +"<td style='width:20%'><input type='text' name='so' id='so' value='"+so+"'/></td>"
			    +"<td style='width:20%'><input type='text' name='ty' id='ty' value='"+ty+"'/></td>"
			    +"<td><a href=\'#\' onclick=\'deltr("+seq+")\'>删除</a></td>"
                +"</tr>");
    	seq++;
    	$("#listlen").attr("value",seq);//当前列表长度
    });
});

//删除<tr/>
var deltr =function(index)
{
	$("tr[id='"+index+"']").remove();//删除当前行
}

function checkform()
{
	if(document.getElementById("versionName").value==""){
		alert("请填写货道组版本名称!");
		return false;
	}
	if ($("#vcheck").val() == "1") {
        alert("版本名称重复！");
        return false;
    }
	if(document.getElementById("listlen").value == 0){
		alert("请添加项！");
		return false;
	}
}
</script>
<title>新建机器货道组</title>
</head>
<body>
<div id="main-content">
<font  style="font-family:'微软雅黑'; font-size:30px">新建机器货道组</font>
<p>&nbsp;</p>
<div class="content-box">
<form id="createdepot" name="createdepot" action="<c:url value='/do_channelgroup_add_1'/>" method="post" onsubmit="return checkform()">
<table id="sel">
  <tr>
    <td style="width:25%">请填写货道组版本名:</td>
    <td  style="width:25%"><input name="versionName" id="versionName" onblur="doAjax()"/></td>
    <td  style="width:50%"><span id="vninfo"></span></td>
</tr>
</table>
<table id="add">
<tr>

	<td style='width:20%'>
		<select name='wareId' id='wareId'>
			<option value=''>请选择</option>
			<c:forEach items='${wslist}' var='u' >
			<option value='${u.wareId}'>${u.wareName}</option>
			</c:forEach>
		</select>
	</td>
	<td style='width:10%'><input class="text-input" type="text" name="channelId" id="channelId"/></td>
	<td style='width:10%'><input class="text-input" type="text" name="normalStock" id="normalStock"/></td>
	<td style='width:10%'><input class="text-input" type="text" name="stdOut" id="stdOut" value="1"/></td>
	<td style='width:10%'><input class="text-input" type="text" name="type" id="type"/></td>
	<td style='width:10%'><input type="button" id="but" class="button" value="增加"/></td>
</tr>
</table>

<table id="tab">
<thead>
<tr class="tr_top">
<th  class="title" style="width:20%">商品名称</th>
<th  class="title" style="width:10%">货道编号</th>
<th  class="title" style="width:10%">额定存量</th>
<th  class="title" style="width:10%">标准出货</th>
<th  class="title" style="width:10%">类型</th>
<th  class="title" style="width:10%">操作</th>
</tr>
</thead>
<tbody>
<tr></tr>
</tbody>
</table>
<table id="op">
  <tr>
  <td></td>
    <td><input name="vcheck" id="vcheck" value="0" type="hidden"/>
    	<input name="listlen" id="listlen" value="0" type="hidden"/>
	    <input type="submit" name="submit" id="submit" value="提交"  class="button" />
    </td>
    <td></td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>