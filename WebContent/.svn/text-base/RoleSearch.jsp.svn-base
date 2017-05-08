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
<script language="javascript" type="text/javascript">

function dosubmit(choose)
{ 
	document.forms["operate"].action= choose;
	document.forms["operate"].submit(); 
}

function checkform(){
	var checkboxs=document.getElementsByName("check");
	for(var i=0; i<checkboxs.length;i++){
		if(checkboxs[i].checked)
		{
			if(!confirm("确定要删除记录？")){
				return false;
			}
			else return true;
		}
	}
	alert("请选择记录!");
	return false;
}

</script>
<title>查询用户</title>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
角色信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="operate" action="<c:url value="/do_role_delete_2"/>" method="post" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:10%"><input type="checkbox" class="check-all" onChange="checkAll(this.checked)"/>全选</th>
<th  class="title" style="width:20%">角色编号</th>
<th  class="title" style="width:20%">角色名称</th>
<th  class="title" style="width:20%">角色描述</th>
<th  class="title" style="width:10%"></th>
<th  class="title" style="width:10%">
<input type="button" name="btncreate" id="btncreate" class="button" value="新建角色" onclick="location.href='<c:url value="/to_role_add_1"/>'">

</th>
</tr>
</thead>
<tbody>
<c:forEach items="${rolelist}" var="role">
<tr>
<td  style="width:10%"><input type="checkbox" name="check" value="${role.roleId}"/></td>
<td  style="width:20%">${role.roleId}</td>
<td  style="width:20%">${role.roleName}</td>
<td  style="width:20%">${role.roleDesc}</td>
<td  width=10%><a href= '<c:url value="/do_role_view_3"/>?id=${role.roleId}'>详细</a></td>
<td  width=10%><a href= '<c:url value="/to_role_edit_0"/>?id=${role.roleId}'>编辑</a></td>
</tr>
</c:forEach>
</tbody>
</table>
<p>&nbsp;</p>
<input type="submit" name="delete" value="删除"  class="button" />
</form>
</div>
</div>
</div>
</body>
</html>