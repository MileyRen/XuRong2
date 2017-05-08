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

function dosearch(choose)
{ 
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 
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
用户信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value="/do_user_search_3?PageNo=0"/>" method="post" >
<table style="font-size: 16px;">
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px">
<td  style="width:15%; ">查询输入</td>
<td  style="width:15%;"><input class="text-input" style="width: 80%" type="text" name="userName" value="${u.userName}"/></td>
<td  style="width:15%"><input class="text-input" type="text" name="employeeName" value="${u.employeeName}"/></td>
<td  style="width:15%"><input class="text-input" type="text" name="role.roleName" value="${u.role.roleName}"/></td>
<td  style="width:15%"><input class="text-input" type="text" name="userGroup.groupName" value="${u.userGroup.groupName}"/></td>
  	<td style="width:15%">
  		<select name="userStatus">
  			<option value="${u.userStatus}" selected="selected">
				<c:if test="${u.userStatus ==1}">正常 </c:if>
				<c:if test="${u.userStatus ==2}">失效 </c:if>
			</option>
			<option value=""></option>
			<option value="1">正常</option>
			<option value="2">失效</option>
  		</select>
  	</td>
<td  style="width:5%"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:5%"><input type="button" name="btncreate" id="btncreate" class="button" value="新建用户" onclick="location.href='<c:url value="/to_user_add_1"/>'"></td>
</tr>
</table>
</form>        



<form name="operate" action="<c:url value="/do_user_delete_2"/>" method="post" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:15%"><input type="checkbox" class="check-all" onChange="checkAll(this.checked)"/>全选</th>
<th  class="title" style="width:15%">用户名</th>
<th  class="title" style="width:15%">员工姓名</th>
<th  class="title" style="width:15%">角色名称</th>
<th  class="title" style="width:15%">用户组名称</th>
<th  class="title" style="width:15%">账户状态</th>
<th  class="title" style="width:5%"></th>
<th  class="title" style="width:5%"></th>
</tr>
</thead>
<tbody>
<c:forEach items="${userlist}"  var="user" >
<tr>
<td  style="width:15%"><input type="checkbox" name="check" value="${user.userId}"/></td>
<td  style="width:15%">${user.userName}</td>
<td  style="width:15%">${user.employeeName}</td>
<td  style="width:15%">${user.role.roleName}</td>
<td  style="width:15%">${user.userGroup.groupName}</td>
<td  style="width:15%">
	<c:if test="${user.userStatus ==1}">正常 </c:if>
	<c:if test="${user.userStatus ==2}">失效 </c:if>
</td>
<td  class="td_center" width=5%><a href= '<c:url value="/do_user_view_3"/>?id=${user.userId}'>详细</a></td>
<td  style="width:5%"><a href= '<c:url value="/to_user_edit_0"/>?id=${user.userId}'>编辑</a></td>
</tr>
</c:forEach>

</tbody>
</table>
<p>&nbsp;</p>

<input type="submit" name="delete" value="删除"  class="button" />

</form>
<div class="pagination">
	共有${length}页&nbsp; 当前第${PageNo+1}页&nbsp;	
	<c:if test="${PageNo+1=='1'}">
	<a ><font color="gray">首页   </font></a>
	<a ><font color="gray">上一页</font></a>	
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="javascript:dosearch('do_user_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_user_search_3?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页    </font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_user_search_3?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_user_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>
</div>
</div>
</div>
</div>
</body>
</html>