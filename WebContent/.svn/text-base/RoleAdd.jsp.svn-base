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
	var from=document.getElementById("createrole");
	for (var i=0 ; i <from.elements.length;i++)
	{
		if (from.elements[i].type=="checkbox")
		{
			from.elements[i].checked=v;
		}
	}
}
</script>
<title>新建角色</title>
</head>
<body>
<div id="main-content">

<font  style="font-family:'微软雅黑'; font-size:30px">新建角色</font>
<p>&nbsp;</p>

<div class="content-box">

<form id="createrole" name="createrole" action="<c:url value='/do_role_add_1'/>" method="post" onsubmit="return checkform()">
<input id="roleCheck" type="hidden" value="0"/>
<table>
  <tr>
    <td style="width:15%">角色名称:</td>
    <td><input class="text-input" name="roleName" type="text" id="roleName"/><font color="red">*</font></td>
  </tr>
  <tr>
  <tr>
    <td>角色描述:</td>
    <td><input class="text-input" name="roleDesc" type="text" id="roleDesc" /></td>
  </tr>
 <tr>
    <td valign="top">角色权限:</td>
    <td>
        <div style="overflow:hidden; ">
			<ul id="example" class="filetree">
				<li class="closed"><span class="folder"><input type="checkbox" name="checkall" onclick="allCheck(this.checked)">所有权限</span>
					<ul>
					<li class="closed"><span class="folder"><input type="checkbox" name="usercheckall" onclick="modelCheckAll('userrole', this.checked)">用户及组管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="userRole" value="0">编辑
							<input type="checkbox" name="userRole" value="1">添加
							<input type="checkbox" name="userRole" value="2">删除
							<input type="checkbox" name="userRole" value="3">查看
							</span>
						</li>
						</ul>
					</li>
					
					<li class="closed"><span class="folder"><input type="checkbox" name="rolecheckall" onclick="modelCheckAll('role', this.checked)">角色管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="roleRole" value="0">编辑
							<input type="checkbox" name="roleRole" value="1">添加
							<input type="checkbox" name="roleRole" value="2">删除
							<input type="checkbox" name="roleRole" value="3">查看
							</span>
						</li>
						</ul>
					</li>

					<li class="closed"><span class="folder"><input type="checkbox" name="nodecheckall" onclick="modelCheckAll('noderole', this.checked)">设备管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="nodeRole" value="0">编辑
							<input type="checkbox" name="nodeRole" value="1">添加
							<input type="checkbox" name="nodeRole" value="2">删除
							<input type="checkbox" name="nodeRole" value="3">查看
							<!-- <input type="checkbox" name="nodeRole" value="4">分配 -->
							</span>
						</li>
						</ul>
					</li>
					
					<li class="closed"><span class="folder"><input type="checkbox" name="mapcheckall" onclick="modelCheckAll('maprole', this.checked)">设备分配信息管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="mapRole" value="0">编辑
							<!-- <input type="checkbox" name="mapRole" value="1">添加 -->
							<input type="checkbox" name="mapRole" value="2">删除
							<input type="checkbox" name="mapRole" value="3">查看
							<input type="checkbox" name="mapRole" value="4">分配
							</span>
						</li>
						</ul>
					</li>
					
					<li class="closed"><span class="folder"><input type="checkbox" name="channelcheckall" onclick="modelCheckAll('channelrole', this.checked)">货道及货道组管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="channelRole" value="0">编辑
							<input type="checkbox" name="channelRole" value="1">添加
							<input type="checkbox" name="channelRole" value="2">删除						
							<input type="checkbox" name="channelRole" value="3">查看
							</span>
						</li>
						</ul>
					</li>
					
					<li class="closed"><span class="folder"><input type="checkbox" name="locacheckall" onclick="modelCheckAll('optemprole', this.checked)">临时表管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="optempRole" value="0">记录处理
							<input type="checkbox" name="optempRole" value="2">删除
							<input type="checkbox" name="optempRole" value="3">查看
							</span>
						</li>
						</ul>
					</li>
	
					<li class="closed"><span class="folder"><input type="checkbox" name="warecheckall" onclick="modelCheckAll('warerole', this.checked)">商品管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="wareRole" value="0">编辑
							<input type="checkbox" name="wareRole" value="1">添加
							<input type="checkbox" name="wareRole" value="2">删除
							<input type="checkbox" name="wareRole" value="3">查看
							</span>
						</li>
						</ul>
					</li>
					
					<li class="closed"><span class="folder"><input type="checkbox" name="mapcheckall" onclick="modelCheckAll('depotrole', this.checked)">仓库出货信息管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="depotRole" value="0">编辑
							<input type="checkbox" name="depotRole" value="1">添加
							<input type="checkbox" name="depotRole" value="2">删除
							<input type="checkbox" name="depotRole" value="3">查看
							</span>
						</li>
						</ul>
				  </li>
				 
				 <li class="closed"><span class="folder"><input type="checkbox" name="mapcheckall" onclick="modelCheckAll('moneyrole', this.checked)">营业额上缴信息管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="moneyRole" value="0">编辑
							<input type="checkbox" name="moneyRole" value="1">添加
							<input type="checkbox" name="moneyRole" value="2">删除
							<input type="checkbox" name="moneyRole" value="3">查看
							</span>
						</li>
						</ul>
				  </li>
				  
				  <li class="closed"><span class="folder"><input type="checkbox" name="mapcheckall" onclick="modelCheckAll('profitrole', this.checked)">利润清算信息管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="profitRole" value="0">编辑
							<input type="checkbox" name="profitRole" value="1">添加
							<input type="checkbox" name="profitRole" value="2">删除
							<input type="checkbox" name="profitRole" value="3">查看
							</span>
						</li>
						</ul>
				  </li>
					</ul>
				</li>
			</ul>
        </div>
    </td>
  </tr>
  <tr>
    <td></td>
    <td>
	    <input type="submit" name="Submit" id="Submit" value="提交"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="reset" value="重置"  class="button" />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/do_role_search_3"/>'"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>