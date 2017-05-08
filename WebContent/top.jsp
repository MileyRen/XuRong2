<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--<style >
a:link { color:#000000;text-decoration:none}
a:hover {color:#666666;}
a:visited {color:#000000;text-decoration:none}
td {font-size:9pt; filter:dropshadow(color=#FFFFFF,offx=1,offy=1); color:#000000; }
img {filter:alpha(opacity:100); chroma(color=#FFFFFF)}
</style>
-->
<base target="right"/>
<script  language="javascript">

var dvnews_majorVer=3.2;
var dvnews_minorVer=1216;
var dvnews_beta=false;

function preloadImg(src)
{
	var img=new Image();
	img.src=src;
}

preloadImg("images/admin_top_open.gif");
var displayBar=true;
function switchBar(obj)
{
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.src="images/admin_top_open.gif";
		obj.title="打开左边管理菜单";
	}else{
		parent.frame.cols="180,*";
		displayBar=true;
		obj.src="images/admin_top_close.gif";
		obj.title="关闭左边管理菜单";
	}
}
</script> 
</head>
<!--<body  style="margin:0px; background-color:#00FF00">-->
<body background="images/admin_top_bg.gif" style="margin:0px;">

<table border="0" cellpadding="0" cellspacing="0" style="width:1170px;">
<tr valign="top">
	<td style="height:10px; width:60%">
	<img onClick="switchBar(this)" src="images/admin_top_close.gif" alt="关闭左边管理菜单" style="cursor:auto" />
	</td>
	<td style="height:10px; width:14%; align:right" align="right"> 欢迎您！ </td><!-- ${userinfo.userName} -->
</tr>
</table>
</body>
</html>