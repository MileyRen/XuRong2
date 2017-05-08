<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<SCRIPT language=javascript>
function printpr() //预览函数
{
document.all("qingkongyema").click();//打印之前去掉页眉，页脚
document.all("dayinDiv").style.display="none"; //打印之前先隐藏不想打印输出的元素（此例中隐藏“打印”和“打印预览”两个按钮）
var OLECMDID = 7;
var PROMPT = 1;
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
WebBrowser1.ExecWB(OLECMDID, PROMPT);
WebBrowser1.outerHTML = "";
document.all("dayinDiv").style.display="";//打印之后将该元素显示出来（显示出“打印”和“打印预览”两个按钮，方便别人下次打印）
}
function printTure() //打印函数
{
document.all('qingkongyema').click();//同上
document.all("dayinDiv").style.display="none";//同上
window.print();
document.all("dayinDiv").style.display="";
}
function doPage()
{
layLoading.style.display = "none";//同上
}
</SCRIPT>
<script language="VBScript">
dim hkey_root,hkey_path,hkey_key
hkey_root="HKEY_CURRENT_USER"
hkey_path="\Software\Microsoft\Internet Explorer\PageSetup"
'//设置网页打印的页眉页脚为空
function pagesetup_null()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
end function
//设置网页打印的页眉页脚为默认值
function pagesetup_default()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&w&b页码，&p/&P"
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&u&b&d"
end function
</script>
<title>查看打印出库记录</title>
</head>
<body>

<div>
<table id="top" border="1">
<tr align="center"><td colspan="9" align="center"><font  style="font-family:'微软雅黑'; font-size:30px">煦荣领用出库单</font></td></tr>
<tr>
	<td style="width:20%" colspan="2">组别：${shipinfo.employeeName}</td>
	<td style="width:20%" colspan="1">营业员：${shipinfo.humanName}</td>
	<td style="width:20%" colspan="3">日期：${shipinfo.depotDay}</td>
	<td style="width:20%" colspan="2">单号：${shipinfo.shippingId}</td>
	<td></td>
</tr>
<tr>
<td style="width:20%" colspan="2">总金额(元)：${shipinfo.moneyThis/100}</td>
<td style="width:20%" colspan="1">预估售价(元)：${preSale/100}</td>
<td style="width:20%" colspan="3"></td>
<td style="width:20%" colspan="2"></td>

<td></td>
</tr>
<tr ><!-- class="tr_top" -->
<th  class="title" style="width:6%">序号</th>
<th  class="title" style="width:14%">货品代码</th>
<th  class="title" style="width:20%">货品名称</th>
<th  class="title" style="width:7%">规格</th>
<th  class="title" style="width:7%">单位</th>
<th  class="title" style="width:6%">出库数量</th>
<th  class="title" style="width:10%">进价(分)</th>
<th  class="title" style="width:10%">金额(分)</th>
<th  class="title" style="width:15%">备注</th>
</tr>
<c:forEach items="${dlist}"  var="depot" varStatus="status">
<tr>
<td  style="width:6%">${status.index + 1}</td>
<td  style="width:14%">${depot.wares.wareCode}</td>
<td  style="width:20%">${depot.depotWareName}</td>
<td  style="width:7%">${depot.wares.wareNorm}</td>
<td  style="width:7%">${depot.wares.wareUnit}</td>
<td  style="width:6%">${depot.depotWareNum}</td>
<td  style="width:10%">${depot.depotWarePrice}</td>
<td  style="width:10%">${depot.depotWarePrice * depot.depotWareNum}</td>
<td  style="width:15%">${depot.remark}</td>
</tr>
</c:forEach>
<tr>
<td style="width:20%" colspan="2">制表：${shipinfo.tableor}</td>
<td style="width:20%" colspan="1">仓库：${shipinfo.wareHouse}</td>
<td style="width:20%" colspan="3">运营：${shipinfo.operator}</td>
<td style="width:20%" colspan="2">物流司机：${shipinfo.driverName}</td>
<td></td>
</tr>
</table>
</div>
<!--
<div class="content-box">  </div>
<div   align="right">   
  <input     style="color:#B45CC9"   type="button"     value="打印设置"   >     
  <input     style="color:#B45CC9"   type="button"       value="打印预览"   >     
  <input     style="color:#B45CC9"   type="button"     value="直接打印"   >   
  </div>
  -->
<div><p></div>
<DIV align="center" id="dayinDiv" name="dayinDiv">
<input type="button" class="tab" value="打印" onclick="printTure();">&nbsp;&nbsp;
<input type="hidden" class="tab" value="打印预览" onclick="printpr();">
<input type="hidden" name="qingkongyema" id="qingkongyema" class="tab" value="清空页码" onclick="pagesetup_null()">&nbsp;&nbsp;
<input type="hidden" class="tab" value="恢复页码" onclick="pagesetup_default()">
</DIV>
</body>
</html>