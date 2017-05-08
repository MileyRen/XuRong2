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
function startprint(Id){
	window.document.body.innerHTML = Id.innerHTML; 
	window.print();
	window.close();
	return;
	}

function PrintTable(Id){ 
	var mStr; 
	mStr = window.document.body.innerHTML ; 
	var mWindow = window; 
	window.document.body.innerHTML =Id.innerHTML; 
	mWindow.print(); 
	window.document.body.innerHTML = mStr; 
	} 
	
$(document).ready(function(){
    //<tr/>居中
    $("#tab tr").attr("align","center");
    alert("I am Ready!");
    //增加<tr/>
    $("#but").click(function(){
        var _len = $("#tab tr").length;
        alert(_len);
        var pre = _len -1;
        alert(pre);
        var value = $("#eName"+pre+"  option:selected").text();
        alert(value);
        $("#tab").append("<tr id="+_len+" align='center'>"
                            +"<td style='width:10%'>"+_len+"</td>"
                            +"<td><select name='eName' id='eName'><c:forEach items='${users}' var='u' ><option value='${u.employeeName}'>${u.employeeName}</option></c:forEach></select></td>"
                            +"<td style='width:20%'><input type='text' name='money"+_len+"' id='money"+_len+"' /></td>"
                            //+"<td><input type='text' name='i' value='"+i+"'/></td>"
                            +"<td style='width:10%'><a href=\'#\' onclick=\'deltr("+_len+")\'>删除</a></td>"
                        +"</tr>");
        $("#num").val(_len);
    });
});

//删除<tr/>
var deltr =function(index)
{
    var _len = $("#tab tr").length;
    //alert($("#tab tr").length);
    $("tr[id='"+index+"']").remove();//删除当前行
    for(var i=index+1,j=_len;i<j;i++)
    {
        var nextENameVal = $("#eName'"+i+"'").val();
    //alert("eName"+i+":"+nextENameVal);
        var nextMoneyVal = $("#money"+i).val();
        $("tr[id=\'"+i+"\']")
            .replaceWith("<tr id="+(i-1)+" align='center'>"
            				+"<td>"+(i-1)+"</td>"
            				//+"<td style='width:20%'><select name='eName"+(i-1)+"' id='eName"+(i-1)+"'><option value='"+nextENameVal+"' selected='selected'>"+nextENameVal+"</option><c:forEach items='${users}' var='u' ><option value='${u.employeeName}'>${u.employeeName}</option></c:forEach></select></td>"
            				+"<td style='width:20%'><select name='eName"+(i-1)+"' id='eName"+(i-1)+"'><c:forEach items='${users}' var='u' ><option value='${u.employeeName}'>${u.employeeName}</option></c:forEach></select></td>"
                            +"<td><input type='text' name='money"+(i-1)+"' id='money"+(i-1)+"' value='"+nextMoneyVal+"'/></td>"
                            +"<td><a href=\'#\' onclick=\'deltr("+(i-1)+")\'>删除</a></td>"
                        +"</tr>");
        $("#eName"+i).val(nextENameVal);
    }
    $("#num").val($("#num").val()-1);
}
</script>
<title>添加营业额上缴</title>


</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
添加营业额上缴信息</font></p>
<p>&nbsp;</p>

<form name="operate" action="<c:url value="/do_test_jquery_0"/>" method="post">
 <table id="tab" border="1" width="60%" align="center" style="margin-top:20px">
<thead>
<tr class="tr_top">
<th  class="title" style="width:10%">序号</th>
<th  class="title" style="width:20%">员工姓名</th>
<th  class="title" style="width:20%">金钱数量</th>
<th  class="title" style="width:10%">操作</th>
</tr>
</thead>
<tbody>
	<tr>
		<td>1</td>
		<td><select name='eName' id='eName'><c:forEach items='${users}' var='u' ><option value='${u.employeeName}'>${u.employeeName}</option></c:forEach></select></td>
		<td style='width:20%'><input type='text' name='money"+_len+"' id='money"+_len+"' /></td>
		<td style='width:10%'><a href='#' onclick='deltr("+_len+")'>删除</a></td>
	</tr>
</tbody>
</table>
        <input name="num" id="num" type="text" value="numtest" type="hidden"/>
        <input type="button" id="but" class="button" value="增加"/>
        <input type="submit" class="button" value="提交"/>
        <input type="button" onclick="return PrintTable(tab)" value="打 印">
    <table>
  <tr>
    <td style="width:15%">员工姓名:</td>
    <td>
    <!-- <input class="text-input" name="moneyName" type="text" id="moneyName" onblur="doAjax()"/> -->
    <select name="employeeName" id="employeeName">
    <option selected="selected" value="">请选择</option>
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
	</td>
  </tr>
  </table>
</form>
</div>
</body>
</html>