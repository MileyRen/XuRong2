<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<link rel="stylesheet" type="text/css" href="myCSS.css" />
    <script type="text/javascript" src="js\My97DatePicker\WdatePicker.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ParamPage</title>
<style type="text/css">  
<!--  
body{  
     margin:50px auto 0 auto;  
     padding: 0;  
     font-family: Verdana, Arial, Helvetica, sans-serif;  
     font-size: 12px;  
     text-decoration: none;  
}  
a {text-decoration: none;color: #d90000;}  
ul {width: 300px; padding:10px 15px 10px 25px;border: 1px solid #ccc;background: #efefef;}  
li {width: 300px; height:28px; line-height:28px;}  
li a {  
display: block;  
width: 300px;  
overflow: hidden;  
white-space: nowrap;  
-o-text-overflow: ellipsis; /*--4 opera--*/  
text-overflow: ellipsis;}  
  
li:not(p)  
{ clear: both;}  
li:not(p) a  
{max-width: 276px;float: left;}/*--firefox   so BT--*/  
li:not(p):after  
{content: "";float: left;width:25px;padding-left: 5px;color: #d90000;}  
  
-->  
.line_text
{
width:200px;
white-space:nowrap;
word-break:keep-all;
overflow:hidden;
text-overflow:ellipsis;
}
</style> 
</head>
<body>
Param Page
<table width="98%"  height="98%" align="center">
  <tr height="10%">
    <td align="center" > 姓名:
      <input name="xm" id="xm" type="text" class="iput1" /> 
       身份证号:<input name="sfzh" id="sfzh" type="text" class="iput1" value="" /> 
       开始时间:<input name="startTime" id="startTime" type="text" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endTime\')}'})"  />
       结束时间:<input name="endTime"   id="endTime" type="text" class="iput1"    onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startTime\')}',maxDate:'%y-%M-%d %H:%m:%s'})"  />
       &nbsp;&nbsp;&nbsp;
       <input type="button" name="cx" onclick="getResult()" value="查询" />
      </td>
  </tr>
  <tr>
    <td><iframe height="50px;" src="" id="result" width="100%"></iframe></td>
  </tr>
</table>
<table>
<ul>  
<li><a href="#" title="一个定位于不同语言国家的企业网站势必需要">一个定位于不同语言国家的企业网站言国家的企业网站言国家的企业网站势必需要</a></li>  
<li><a href="#" title="离开网站（或者只是利用第三方网站）去谈电子商务是不可能的企业的网址被称为“网络商标”也是企业无形资产的组成部分业形象和文化的重要">离开网站（或者只是利用第三方网站）去谈电子商务是不可能的企业的网址被称为“网络商标” 也是企业无形资产的组成部分业形象和文化的重要</a></li>  
<li><a href="#" title="网站的目的消费者和受众的特点是什么国家的企业网站势必需要">网站的目的消费者和受众的特点是什么国家的企业网站势必需要</a></li>  
<li><a href="#" title="一个定位于不同语言国家的企业网站">一个定位于不同语言国家的企业网站</a></li>  
<li><a href="#" title="一个定位于的消费者和受众的特点是什么站势必需要">一个定位于的消费者和受众的特点是什么站势必需要</a></li>  
<li><a href="#" title="离开网站（或者只是利用第三方网站）去谈电子商务是不可能的企业的网址被称为“网络商标”也是企业无形资产的组成部分业形象和文化的重要">离开网站（或者只是利用第三方网站）去谈电子商务是不可能的企业的网址被称为“网络商标” 也是企业无形资产的组成部分业形象和文化的重要</a></li>  
</ul>
</table>

<span class="line_text">客户端解决标题显示太长省略多余部分并加省略号的样式</span>
<li class="line_text">客户端解决标题显示太长省略多余部分并加省略号的样式</li>
<div class="line_text">客户端解决标题显示太长省略多余部分并加省略号的样式</div>

</body>
</html>