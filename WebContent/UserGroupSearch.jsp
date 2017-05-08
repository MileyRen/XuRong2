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
	alert("请选择记录！");
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
用户组信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value="/do_group_search_3?PageNo=0"/>" method="post" >
<table style="font-size: 16px;">
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px">
<td  style="width:10%">查询输入</td>
<td  style="width:10%"><input class="text-input" style="width: 80%" readonly="readonly"/></td>
<td  style="width:15%"><input class="text-input" style="width: 80%" type="text" name="groupName" value="${ug.groupName}"/></td>
<td  style="width:15%"><input class="text-input" style="width: 80%" type="text" name="groupLeader" value="${ug.groupLeader}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="parentId" value="${ug.parentId}"/></td>
<td colspan="3" style="text-align: right">
<input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/>
&nbsp;
<input type="button" name="reset" id="reset"  class="button" value="重置"/>
&nbsp;
<input type="button" name="btncreate" id="btncreate" class="button" value="新建用户组" onclick="location.href='<c:url value="/to_group_add_1"/>'">
</td>

</tr>
</table>
</form>        



<form name="operate" action="<c:url value="/do_group_delete_2"/>" method="post" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:10%"><input type="checkbox" class="check-all" onChange="checkAll(this.checked)"/>全选</th>
<th  class="title" style="width:10%">编号</th>
<th  class="title" style="width:15%">名称</th>
<th  class="title" style="width:15%">负责人</th>
<th  class="title" style="width:10%">上级编号</th>
<th  class="title" style="width:30%">描述</th>
<th  class="title" style="width:5%"></th>
<th  class="title" style="width:5%"></th>
</tr>
</thead>
<tbody>
<c:forEach items="${grouplist}"  var="group" >
<tr>
<td  style="width:8%"><input type="checkbox" name="check" value="${group.groupId}"/></td>
<td  style="width:10%">${group.groupId}</td>
<td  style="width:15%">${group.groupName}</td>
<td  style="width:15%">${group.groupLeader}</td>
<td  style="width:10%">${group.parentId}</td>
<td  style="width:30%">${group.groupDesc}</td>
<td  class="td_center" width=5%><a href= '<c:url value="/do_group_view_3"/>?id=${group.groupId}' >详细</a></td>
<td  style="width:5%"><a href= '<c:url value="/to_group_edit_0"/>?id=${group.groupId}'  >编辑</a></td>
</tr>
</c:forEach>

</tbody>
</table>
<p>&nbsp;</p>
<input type="submit" name="delete" value="删除"  class="button" />

</form>
<div class="pagination">
	共有${length}页&nbsp; 当前第${PageNo+1}页&nbsp;
	<a href="<c:url value = '/groupSearch?PageNo=0'/>">首页</a>
	
	<c:if test="${PageNo+1=='1'}">
	<a href="" onClick="return false" >上一页</a>
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="<c:url value = '/groupSearch?PageNo=${PageNo-1}'/>" >上一页</a>
	</c:if>
	<c:if test="${PageNo+1==length}">
	<a href="" onClick="return false" >下一页</a>
	</c:if>
	<c:if test="${PageNo+1!=length}">
	<a href="<c:url value = '/groupSearch?PageNo=${PageNo+1}'/>" >下一页</a>
	</c:if>
	<a href="<c:url value = '/groupSearch?PageNo=${length-1}'/>">尾页</a>

</div>

</div>
</div>
</div>
</body>
</html>