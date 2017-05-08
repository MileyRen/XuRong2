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
<!-- <script src="js/jquery-1.4.2.min.js"></script> -->
<link rel="stylesheet" href="css/jquery-ui.css" />
<script type="text/javascript" src="js\My97DatePicker\WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style.css" />
<style>
  .custom-combobox {
    position: relative;
    display: inline-block;
  }
  .custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
    /* support: IE7 */
    *height: 1.7em;
    *top: 0.1em;
  }
  .custom-combobox-input {
    margin: 0;
    padding: 0.3em;
  }
  </style>
<script language="javascript" type="text/javascript">
function FormatNumber(srcStr, nAfterDot){
var srcStr,nAfterDot;
var resultStr,nTen;
var i, j;
srcStr = ""+srcStr+"";
strLen = srcStr.length;
dotPos = srcStr.indexOf(".",0);
if (dotPos == -1){
   resultStr = srcStr+".";
   for (i=0;i<nAfterDot;i++){
    resultStr = resultStr+"0";
   }
}else{
   if ((strLen - dotPos - 1) >= nAfterDot){
    nAfter = dotPos + nAfterDot + 1;
    nTen =1;
    for(j=0;j<nAfterDot;j++){
     nTen = nTen*10;
    }
    resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
   }else{
    resultStr = srcStr;
    for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
     resultStr = resultStr+"0";
    }
   }
}
return resultStr;
}

function doAjax(){
	var ename = $("#employeeName option:selected").attr("value");
	alert(ename);
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_money_find_3',
        data: JSON.stringify({
        	employeeName: ename
        }),
        dataType: 'json',
        success: function(data){
        	$("#moneyin").attr("value",data.moneyIn);
        	$("#moneycount").attr("value",data.moneyCount);
        },
    });
}

$(document).ready(function(){
	 $("#employeeName").change(function(){
	    var ename = $("#employeeName option:selected").attr("value");
	    alert(ename);
	    if(ename!=""){
	    	doAjax();
	    }
	 });
});

</script>
  
<script type="text/javascript">
function myCheck()  
{  
   for(var i=0;i<document.createdepot.elements.length-1;i++)  
   {  
      if(document.createdepot.elements[i].value=="")  
      {  
      //   alert("当前表单不能有空项");  
	//一进入页面将光标定位到第一个input  
         document.createdepot.elements[i].focus();  
         return false;  
      }  
   }  
   return true;  
} 

function addTr(){
	 if(myCheck())addRow($("tab"));
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
<title>新建出库记录</title>
</head>
<body>
<div id="main-content">
<font  style="font-family:'微软雅黑'; font-size:30px">新建出库记录</font>
<p>&nbsp;</p>
<div class="content-box">
<form id="createdepot" name="createdepot" action="<c:url value='/do_depot_addU_1'/>" method="post" onsubmit="return checkform()">
<table id="top">
  <tr>
    <td style="width:15%">组名:</td>
    <td>
    <select name="employeeName" id="employeeName">
    <option value="">请选择</option>
	  	<c:forEach items="${users}" var="u">
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select></td>
	<td>营业员：</td><td><input name="humanName" id="humanName" value=""/></td>
	<td>日期：</td><td><input name="Time" id="Time" type="text" value="${thisday}" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
	<td>单号：</td><td><input name="shippingId" id="shippingId" value="${shippingId}"/></td>
  </tr>
<tr>
<td style='width:12%'>今日上缴营业额</td><td style='width:12%'><input name="moneyin" id="moneyin" type="text" value="" readonly="readonly"/></td>
<td style='width:12%'>当月累计剩余额</td><td style='width:12%'><input name="moneycount" id="moneycount" type="text" value="" readonly="readonly"/></td>
</tr>
</table>

<table id="tab">
<thead>
<tr class="tr_top">
<th  class="title" style="width:20%">商品名称</th>
<th  class="title" style="width:10%">数量</th>
<th  class="title" style="width:10%">单价<font color="red">(分)</font></th>
<th  class="title" style="width:20%">备注</th>
<th  class="title" style="width:10%">操作</th>
<!-- <font color="red">分</font> 
<th  class="title" style="width:20%">商品编号</th>
<th  class="title" style="width:10%">规格</th>
<th  class="title" style="width:8%">单位</th>
-->
</tr>
</thead>
<tbody>
<tr>
<td style='width:20%'><!-- <input class="text-input" type="text" name="wname" id="wname"/> -->
<select name='wname' id='wname'>
  		<c:forEach items='${wares}' var='u' >
			<option value='${u.wareId}'>${u.wareName}</option>
		</c:forEach>
	</select>
</td>
<td style='width:10%'><input class="text-input" type="text" name="num" id="num" onchange="return addTr()"/></td>
<td style='width:10%'><input class="text-input" type="text" name="price" id="price" onchange="return addTr()"/></td>
<td style='width:20%'><input class="text-input" type="text" name="remark" id="remark" value="无" onchange="return addTr()"/></td>
<td style='width:10%'>删除</td>
</tr>
</tbody>
</table>
<table id="op">
  <tr>
  <td></td>
    <td>
	    <input type="submit" name="submit" id="submit" value="提交"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <!-- <input type="reset" value="重置"  class="button" /> -->
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/to_depot_addU_1"/>'"/>
    </td>
    <td></td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>