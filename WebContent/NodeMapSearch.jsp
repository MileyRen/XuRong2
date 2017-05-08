<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
/**
 * function changeclickvalue(){
		monopoly=1;
 }
 */
</script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
<title>售货机分配查询</title>
</head>
<body>

<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
售货机分配查询</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value = '/do_map_search_3?PageNo=0'/>" method="post" >
<table>
<tr style="background: #fff;">
<td  style="width:10%">查询输入</td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="hidden" name="id" value="${nm.id}" id="id"/></td>
<td  style="width:15%"><input class="text-input" style="width: 80%" type="text" name="nodeId" value="${nm.nodeId}"/></td>
<td  style="width:15%"><input class="text-input" style="width: 80%" type="text" name="nodeName" value="${nm.nodeName}"/></td>
<td  style="width:15%"><input class="text-input" style="width: 80%" type="text" name="userId" value="${nm.userId}"/></td>
<td  style="width:15%"><input class="text-input" style="width: 80%" type="text" name="employeeName" value="${nm.employeeName}"/></td>
<td  style="width:5%" colspan="1"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:5%" colspan="1"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
</tr>
</table>
</form>        

<form name="operate" action="<c:url value = '/do_map_del_2'/>" method="post" onsubmit="return checkform()">
<input type="hidden" name="id" value="${nm.id}" id="id"/>
<input type="hidden" name="nodeId" value="${nm.nodeId}"/>
<input type="hidden" name="nodeName" value="${nm.nodeName}"/>
<input type="hidden" name="userId" value="${nm.userId}"/>
<input type="hidden" name="employeeName" value="${nm.employeeName}"/>
<input type="hidden" name="PageNo" value="${PageNo}"/>
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:10%"><input type="checkbox" class="check-all" onChange="checkAll(this.checked)"/>全选</th>
<th  class="title" style="width:10%">记录编号</th>
<th  class="title" style="width:15%">设备编号</th>
<th  class="title" style="width:15%">设备铭牌号</th>
<th  class="title" style="width:15%">用户编号</th>
<th  class="title" style="width:15%">用户组名</th>
<th  class="title" style="width:10%" colspan="2">操作</th>
</tr>
<thead>
<tbody>


<c:forEach items="${maplist}"  var="maplist">
<tr>
<td  style="width:10%"><input type="checkbox" name="check" value="${maplist.id}"/></td>
<td  style="width:10%">${maplist.id}</td>
<td  style="width:15%">${maplist.nodeId}</td>
<td  style="width:15%">${maplist.nodeName}</td>
<td  style="width:15%">${maplist.userId}</td>
<td  style="width:15%">${maplist.employeeName}</td>
<td  class="td_center" width=10% colspan="2"><a href="<c:url value = '/to_map_edit_0?id=${maplist.id}'/>" >更新用户</a></td>
<!-- 
<td  class="td_center" width=10%><a href="<c:url value = '/do_map_del_2?id=${maplist.id}'/>" >删除</a></td>
 -->
</tr>
</c:forEach>

</tbody>
</table>
<p>&nbsp;</p>
<input type="submit" name="delete" value="删除"  class="button" />
</form>
<div class="pagination">
	共有${length+1-1}页&nbsp; 当前第${PageNo+1}页&nbsp;
	
	<c:if test="${PageNo+1=='1'}">
	<a ><font color="gray">首页</font></a>
	<a ><font color="gray">上一页</font></a>
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="javascript:dosearch('do_map_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_map_search_3?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页</font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_map_search_3?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_map_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>	
</div>
</div>
</div>
</div>
</body>
</html>