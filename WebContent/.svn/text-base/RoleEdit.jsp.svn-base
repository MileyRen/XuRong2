<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<link rel="stylesheet" href="http://jquery.bassistance.de/treeview/jquery.treeview.css" type="text/css" />
<script type="text/javascript" src="http://jquery.bassistance.de/treeview/jquery.treeview.js"></script>
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
	var from=document.getElementById("editRole");
	for (var i=0 ; i <from.elements.length;i++)
	{
		if (from.elements[i].type=="checkbox")
		{
			from.elements[i].checked=v;
		}
	}
}
</script>
<title>编辑角色</title>
</head>
<body>
<div id="main-content">
<font  style="font-family:'微软雅黑'; font-size:30px">编辑角色</font>
<div class="content-box" >
<form id="editRole" name="editRole" action="<c:url value="/do_role_update_0"/>" method="post" onsubmit="return checkform()">

<table>
  <tr>
    <td style="width:15%">角色名称:</td>
    <td><input class="text-input medium-input" name="roleName" type="text" id="roleName" value="${roleInfo.roleName}" readonly="readonly"/>
    <input name="roleId" id="id" type="hidden" value="${roleInfo.roleId}" />
    </td>
  </tr>
  <tr>
    <td>角色描述:</td>
    <td><input class="text-input medium-input" name="roleDesc" type="text" id="roleDesc" value="${roleInfo.roleDesc}" />
    </td>
   
  </tr>

  <tr>
    <td valign="top">用户权限:</td>
    <td>
		<div style="overflow:hidden; ">
			<ul id="example" class="filetree">
				<li ><span class="folder"><input type="checkbox" name="checkall" onclick="allCheck(this.checked)">所有权限</span>
					<ul>
					<li ><span class="folder"><input type="checkbox" name="usercheckall" onclick="modelCheckAll('userRole', this.checked)">用户及组管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox"  name="userRole" value="0" ${fn:substring(roleInfo.userRole, 0, 1)=="1"? 'checked':'unchecked'}>编辑
							<input type="checkbox"  name="userRole" value="1" ${fn:substring(roleInfo.userRole, 1, 2)=="1"? 'checked':'unchecked'}>添加
							<input type="checkbox"  name="userRole" value="2" ${fn:substring(roleInfo.userRole, 2, 3)=="1"? 'checked':'unchecked'}>删除
							<input type="checkbox"  name="userRole" value="3" ${fn:substring(roleInfo.userRole, 3, 4)=="1"? 'checked':'unchecked'}>查看
							</span>
						</li>
						</ul>
					</li>
					
					<li ><span class="folder"><input type="checkbox" name="rolecheckall" onclick="modelCheckAll('roleRole', this.checked)">角色管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox"  name="roleRole" value="0" ${fn:substring(roleInfo.roleRole, 0, 1)=="1"? 'checked':'unchecked'}>编辑
							<input type="checkbox"  name="roleRole" value="1" ${fn:substring(roleInfo.roleRole, 1, 2)=="1"? 'checked':'unchecked'}>添加
							<input type="checkbox"  name="roleRole" value="2" ${fn:substring(roleInfo.roleRole, 2, 3)=="1"? 'checked':'unchecked'}>删除
							<input type="checkbox"  name="roleRole" value="3" ${fn:substring(roleInfo.roleRole, 3, 4)=="1"? 'checked':'unchecked'}>查看
							</span>
						</li>
						</ul>
					</li>

					<li ><span class="folder"><input type="checkbox" name="nodecheckall" onclick="modelCheckAll('nodeRole', this.checked)">设备管理</span>
						<ul>
						<li>
							<span class="file">
							<!-- 
							<input type="checkbox"  name="nodeRole" value="0" ${fn:substring(roleInfo.nodeRole,0,1)=="1"?'checked':'unchecked'}>编辑
							<input type="checkbox"  name="nodeRole" value="1" ${fn:substring(roleInfo.nodeRole,1,2)=="1"?'checked':'unchecked'}>添加
							-->
							<input type="checkbox"  name="nodeRole" value="0" ${fn:substring(roleInfo.nodeRole,0,1)=="1"?'checked':'unchecked'}>编辑
							<input type="checkbox"  name="nodeRole" value="1" ${fn:substring(roleInfo.nodeRole,1,2)=="1"?'checked':'unchecked'}>添加
							<input type="checkbox"  name="nodeRole" value="2" ${fn:substring(roleInfo.nodeRole,2,3)=="1"?'checked':'unchecked'}>删除
							<input type="checkbox"  name="nodeRole" value="3" ${fn:substring(roleInfo.nodeRole,3,4)=="1"?'checked':'unchecked'}>查看
							<!-- <input type="checkbox"  name="nodeRole" value="4" ${fn:substring(roleInfo.nodeRole,4,5)=="1"?'checked':'unchecked'}>分配 -->
							</span>
						</li>
						</ul>
					</li>
					
					<li ><span class="folder"><input type="checkbox" name="mapcheckall" onclick="modelCheckAll('mapRole', this.checked)">设备分配信息管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox"  name="mapRole" value="0" ${fn:substring(roleInfo.mapRole,0,1)=="1"?'checked':'unchecked'}>编辑
							<!-- <input type="checkbox"  name="mapRole" value="1" ${fn:substring(roleInfo.mapRole,1,2)=="1"?'checked':'unchecked'}>添加 -->
							<input type="checkbox"  name="mapRole" value="2" ${fn:substring(roleInfo.mapRole,2,3)=="1"?'checked':'unchecked'}>删除					
							<input type="checkbox"  name="mapRole" value="3" ${fn:substring(roleInfo.mapRole,3,4)=="1"?'checked':'unchecked'}>查看
							<input type="checkbox"  name="mapRole" value="4" ${fn:substring(roleInfo.mapRole,4,5)=="1"?'checked':'unchecked'}>分配
							</span>
						</li>
						</ul>
					</li>
					
					<li class="folder"><span class="folder"><input type="checkbox" name="channelcheckall" onclick="modelCheckAll('channelRole', this.checked)">货道(组)管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="channelRole" value="0" ${fn:substring(roleInfo.channelRole,0,1)=="1"?'checked':'unchecked'}>编辑
							<input type="checkbox" name="channelRole" value="1" ${fn:substring(roleInfo.channelRole,1,2)=="1"?'checked':'unchecked'}>添加
							<input type="checkbox" name="channelRole" value="2" ${fn:substring(roleInfo.channelRole,2,3)=="1"?'checked':'unchecked'}>删除
							<input type="checkbox" name="channelRole" value="3" ${fn:substring(roleInfo.channelRole,3,4)=="1"?'checked':'unchecked'}>查看
							</span>
						</li>
						</ul>
					</li>
					
					<li class="folder"><span class="folder"><input type="checkbox" name="optempcheckall" onclick="modelCheckAll('optempRole', this.checked)">临时表管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox"  name="optempRole" value="0" ${fn:substring(roleInfo.optempRole,0,1)=="1"?'checked':'unchecked'}>更新处理
							<input type="checkbox"  name="optempRole" value="2" ${fn:substring(roleInfo.optempRole,2,3)=="1"?'checked':'unchecked'}>删除
							<input type="checkbox"  name="optempRole" value="3" ${fn:substring(roleInfo.optempRole,3,4)=="1"?'checked':'unchecked'}>查看
							</span>
						</li>
						</ul>
					</li>
					
					<li ><span class="folder"><input type="checkbox" name="warecheckall" onclick="modelCheckAll('wareRole', this.checked)">商品管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox"  name="wareRole" value="0" ${fn:substring(roleInfo.wareRole,0,1)=="1"?'checked':'unchecked'}>编辑
							<input type="checkbox"  name="wareRole" value="1" ${fn:substring(roleInfo.wareRole,1,2)=="1"?'checked':'unchecked'}>添加
							<input type="checkbox"  name="wareRole" value="2" ${fn:substring(roleInfo.wareRole,2,3)=="1"?'checked':'unchecked'}>删除
							<input type="checkbox"  name="wareRole" value="3" ${fn:substring(roleInfo.wareRole,3,4)=="1"?'checked':'unchecked'}>查看
							</span>
						</li>
						</ul>
					</li>
					
					<li ><span class="folder"><input type="checkbox" name="depotcheckall" onclick="modelCheckAll('depotRole', this.checked)">仓库出货信息管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="depotRole" value="0" ${fn:substring(roleInfo.depotRole,0,1)=="1"?'checked':'unchecked'}>编辑
							<input type="checkbox" name="depotRole" value="1" ${fn:substring(roleInfo.depotRole,1,2)=="1"?'checked':'unchecked'}>添加
							<input type="checkbox" name="depotRole" value="2" ${fn:substring(roleInfo.depotRole,2,3)=="1"?'checked':'unchecked'}>删除
							<input type="checkbox" name="depotRole" value="3" ${fn:substring(roleInfo.depotRole,3,4)=="1"?'checked':'unchecked'}>查看
							</span>
						</li>
						</ul>
					</li>
					
					<li ><span class="folder"><input type="checkbox" name="moneycheckall" onclick="modelCheckAll('moneyRole', this.checked)">营业额上缴信息管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="moneyRole" value="0" ${fn:substring(roleInfo.moneyRole,0,1)=="1"?'checked':'unchecked'}>编辑
							<input type="checkbox" name="moneyRole" value="1" ${fn:substring(roleInfo.moneyRole,1,2)=="1"?'checked':'unchecked'}>添加
							<input type="checkbox" name="moneyRole" value="2" ${fn:substring(roleInfo.moneyRole,2,3)=="1"?'checked':'unchecked'}>删除
							<input type="checkbox" name="moneyRole" value="3" ${fn:substring(roleInfo.moneyRole,3,4)=="1"?'checked':'unchecked'}>查看
							</span>
						</li>
						</ul>
					</li>
					
					<li ><span class="folder"><input type="checkbox" name="profitcheckall" onclick="modelCheckAll('profitRole', this.checked)">利润清算信息管理</span>
						<ul>
						<li>
							<span class="file">
							<input type="checkbox" name="profitRole" value="0" ${fn:substring(roleInfo.profitRole,0,1)=="1"?'checked':'unchecked'}>编辑
							<input type="checkbox" name="profitRole" value="1" ${fn:substring(roleInfo.profitRole,1,2)=="1"?'checked':'unchecked'}>添加
							<input type="checkbox" name="profitRole" value="2" ${fn:substring(roleInfo.profitRole,2,3)=="1"?'checked':'unchecked'}>删除
							<input type="checkbox" name="profitRole" value="3" ${fn:substring(roleInfo.profitRole,3,4)=="1"?'checked':'unchecked'}>查看
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
    <input type="submit" name="commit" id="commit" value="提交" class="button"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="back" id="back" value="返回" class="button" onclick="javascript:history.go(-1);"/>
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>