<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
/*
 * $(document).ready(function(){ 
		alert("Ready");
		var _len = $("#tab tr").length;
		alert("_len:"+_len);
		var thistable = '"#price'+_len+'"';
		alert(thistable);
	    $(thistable).change(function(){
	    	alert("channge");
	    	$("#tab").append("<tr id="+_len+" align='center'>"
	    			+"<td style='width:10%'>"+_len+"</td>"
	    			+"<td style='width:10%'><input type='text' name='wname' id='wname'/></td>"
	    			+"<td style='width:10%'><input type='text' name='num' id='num'/></td>"
	    			+"<td style='width:10%'><input type='text' name='price+"_len"+' id='price+"_len"+'/></td>"
	    			+"<td style='width:10%'><input type='text' name='dremark' id='dremark'/></td>"
	    			+"</tr>");
	    	_len++;
	    });
	});
 */

function addTr(){
	 addRow($("tab"));
}

 function $(elementId){ 
	 if (document.getElementById) { 
	    return document.getElementById(elementId); 
	 }else if(document.all) { 
	    return document.all[elementId]; 
	 }else if(document.layers) { 
	    return document.layers[elementId]; 
	 } 
	 }
 
 function addRow(table) 
 { 
	 alert("addRow(table)");
    // 获取表格中的最后一行对象TR 
    var sampleRow = table.rows[table.rows.length - 1]; 
    // 获取表格中的最后一行对象TR中的所有TD对象集合，注意，获取的是一个含有多个TD对象的数组集合 
    var sampleCell = sampleRow.getElementsByTagName("td"); 
    // 获取当前表格中的行数序号，为了给每行的每个TD中的对象命名 
    var row = table.rows.length; 
    // 新创建一个TR对象，也是将要增加到表格中的新行 
    var newRow = document.createElement("tr"); 
    // 根据表格中最后一行sampleRow对象TR中的TD对象集合sampleCell，创建新行newRow中的TD对象集合newCell 

    // 遍历表格中的最后一行中TD对象集合，用来复制新增加的行中的每一个新的TD对象 
    for(var i = 0; i < sampleCell.length; i ++ ) 
    { 
       // 创建一个新的TD对象 
       var newCell = document.createElement("td"); 
       // 将最后一行中第i列的TD对象的内码赋给新行中第i列的新TD对象中 
       newCell.innerHTML = sampleCell[i].innerHTML; 
       // 给新行中第i列TD对象中的对象赋名 
       newCell.childNodes.item(0).name = "cell" + row + i; 
       // 在新增加的行中追加一个新的TD子对象 
       newRow.appendChild(newCell); 
    } 
    // 将新行增加到表格最后一行的父对象中，TR的父对象是TBODY，很多时候会被遗忘的...... 
    sampleRow.parentNode.appendChild(newRow); 
 } 
</script>
</head>
<body>
<table id="tab">
<thead>
<tr class="tr_top">
<th  class="title" style="width:20%">商品名称</th>
<th  class="title" style="width:10%">数量</th>
<th  class="title" style="width:10%">单价<font color="red">(分)</font></th>
<th  class="title" style="width:20%">备注</th>
</tr>
</thead>
<tbody>
<tr>
<td style='width:20%'><input class="text-input" type="text" name="wname" id="wname"/></td>
<td style='width:10%'><input class="text-input" type="text" name="num" id="num"/></td>
<td style='width:10%'><input class="text-input" type="text" name="price" id="price" onchange="return addTr()"/></td>
<td style='width:20%'><input class="text-input" type="text" name="remark" id="remark" value="无"/></td>
</tr>
</tbody>
</table>
</body>
</html>