<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML><HEAD><TITLE>web打印去掉页眉页脚，以及不想打印出的页面元素</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
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
</HEAD>
<BODY background="images/background_01.gif" leftMargin=0
topMargin=0 rightMargin=0 bottomMargin=0 style="BACKGROUND-POSITION: center 50%">
<DIV align=center>
你希望打印的内容..........
</DIV>
<DIV align="center" id="dayinDiv" name="dayinDiv"><input type="button" class="tab" value="打印" onclick="printTure();">&nbsp;&nbsp;
<input type="button" class="tab" value="打印预览" onclick="printpr();">
<input type="hidden" name="qingkongyema" id="qingkongyema" class="tab" value="清空页码" onclick="pagesetup_null()">&nbsp;&nbsp;
<input type="hidden" class="tab" value="恢复页码" onclick="pagesetup_default()">
</DIV>
</BODY>
</HTML>