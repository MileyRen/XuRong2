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
<script> 

function $(elementId){ 
if (document.getElementById) { 
   return document.getElementById(elementId); 
}else if(document.all) { 
   return document.all[elementId]; 
}else if(document.layers) { 
   return document.layers[elementId]; 
} 
} 
// 给表格增加一行，且与最后一行相同 
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
   for(i = 0; i < sampleCell.length; i ++ ) 
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
// 删除表格中的最后一行 
function deleteRow(table) 
{ 
   if(table.rows.length == 2) 
   window.alert("不允许删除最后一行数据！"); 
   else 
   table.deleteRow(table.rows.length - 1); 
} 
// 删除表格中第一列选中的行 
function deleteRows(table) 
{ 
   var i = table.rows.length - 1; 

   // 遍历表格中的所有行 
   while(i >= 1) 
   { 
      // 如果表格第1列中的选择框选中的话，就将该行删除 

      // 获取到表格的第i行 ：                            table.rows[i] 

      // 获取第i行的第1个TD对象：                        table.rows[i].childNodes.item(0) 

      // 获取第i行的第1个TD对象中的第一个对象：           table.rows[i].childNodes.item(0).childNodes.item(0) 

      // 获取第i行的第1个TD对象中的第一个对象的checked值：table.rows[i].childNodes.item(0).childNodes.item(0).checked 
      if(table.rows[i].childNodes.item(0).childNodes.item(0).checked == true) 
      { 
         if(i == 1) 
         window.alert("不允许删除最后一行数据！"); 
         else 
         table.deleteRow(i); 
      } 
      i = i - 1; 
   } 
} 
</script>
</head>
<body>
<table id="tb" border="1" cellpadding="0" cellspacing="0"> 
   <tr> 
     <td>模板编号</td> 
<td>模板名称</td> 
   </tr> 
   <tr> 
    <td> 
  <input type="text" name="ids" value=""/> 
</td>    
<td> 
  <input type="text" name="name" value=""/> 
</td>    
   </tr> 
</table> 
<input type="button" onclick="addRow($('tb'));" value="增加一行"/> 
<input type="button" onclick="deleteRow($('tb'));" value="删除一行"/> 
<input type="button" onclick="deleteRows($('tb'));" value="删除选中行"/> 

</body>
</html>