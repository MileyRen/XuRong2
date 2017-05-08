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
<title>查询货道组信息</title>
<script type="text/javascript">
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
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
查询货道组信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value="/do_channelgroup_search_3"/>" method="post" >
<table style="font-size: 16px;">
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px">
<td style="width:15%">选择版本：</td>
<td  style="width:15%">
	<select name="versionName" id="versionName">
	<option value="">请选择</option>
	  	<c:forEach items="${vnames}" var="v" >
			<option value="${v}">${v}</option>
		</c:forEach>
	</select>
	
</td>
<td  style="width:5%"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td style="width:45%">
	<c:if test="${what == ''}">查看全部信息</c:if>
	<c:if test="${what != ''}">查看${cglist.get(0).versionName}的信息</c:if>
</td>
<!-- 
<td style="width:10%"><input type="button" name="btnAdd" id="btnAdd"  class="button" value="为货道组添加货道" onclick='href="<c:url value='/to_pwd_page_0'/>"'/></td>
 -->
</tr>
</table>
</form>        

<form name="operate" action="<c:url value="/do_channelgroup_delete_2"/>" method="post" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:9%"><input type="checkbox" class="check-all" onChange="checkAll(this.checked)"/>全选</th>
<th  class="title" style="width:9%">版本名称</th>
<th  class="title" style="width:9%">货道编号</th>
<th  class="title" style="width:9%">商品名称</th>
<th  class="title" style="width:5%">存货量</th>
<th  class="title" style="width:5%">出货数</th>
<th  class="title" style="width:9%">类型</th>
<th  class="title" style="width:9%">描述</th>
<th  class="title" style="width:12%">更新时间</th>
<th  class="title" style="width:5%">操作</th>

</tr>
</thead>
<tbody>
<c:forEach items="${cglist}"  var="cg" >
<tr>
<td  style="width:9%"><input type="checkbox" name="check" value="${cg.id}"/></td>
<td  style="width:9%">${cg.versionName}</td>
<td  style="width:9%">${cg.channelId}</td>
<td  style="width:9%">${cg.wares.wareName}</td>
<td  style="width:5%">${cg.normalStock}</td>
<td  style="width:5%">${cg.stdOut}</td>
<td  style="width:9%">${cg.type}</td>
<td  style="width:15%">${cg.des}</td>
<td  style="width:12%">${cg.lastTime}</td>
<td  class="td_center" width=5%><a href="<c:url value = '/to_channelgroup_edit_0?id=${cg.id}'/>" >编辑</a></td>
</tr>
</c:forEach>

</tbody>
</table>
<p>&nbsp;</p>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="delete" value="删除"  class="button" />
</form>
</div>
</div>
</div>
</body>
</html>