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
function dosearch(choose)
{ 
	document.forms["search"].action= choose;
	document.forms["search"].submit(); 
}

</script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script>
<title>查询售货机</title>
</head>
<body>

<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
售货机信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value = '/do_node_search_3?PageNo=0'/>" method="post" >
<table>
<tr style="background: #fff;">
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="nodeId" value="${nodeinfo.nodeId}" id="nodeId"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="nodeName" value="${nodeinfo.nodeName}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="macAddr" value="${nodeinfo.macAddr}"/></td>
<!-- 
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="machineType" value="${nodeinfo.machineType}"/></td>
 -->
 <td style="width:10%">
	  	<select name="isAssign" id="isAssign">
	  	<c:if test="${nodeinfo.isAssign == ''}"><option value="">请选择</option></c:if>
	  	<c:if test="${nodeinfo.isAssign == '1'}"><option value="1">未分配</option><option value="">请选择</option></c:if>
	  	<c:if test="${nodeinfo.isAssign == '2'}"><option value="2">已分配</option><option value="">请选择</option></c:if>
	  	<option value="2">已分配</option>
	  	<option value="1">未分配</option>
	  	</select>
</td>
<td style="width:10%">
	  	<select name="machineType" id="machineType">
	  	<c:if test="${nodeinfo.machineType == ''}"><option value="">请选择</option></c:if>
	  	<c:if test="${nodeinfo.machineType != ''}"><option value="${nodeinfo.machineType}">${nodeinfo.machineType}</option><option value="">请选择</option></c:if>
	  	<c:forEach items="${mtypelist}" var="mt" >
			<option value="${mt}">${mt}</option>
		</c:forEach>
	  	</select>
</td>
<td  style="width:5%" colspan="1"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:5%" colspan="1"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
</tr>
</table>
</form>        

<form name="operate" action="" method="post">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:10%">设备编号</th>
<th  class="title" style="width:10%">设备铭牌号</th>
<th  class="title" style="width:10%">主板号</th>
<th  class="title" style="width:10%">分配已否</th>
<th  class="title" style="width:10%">设备类型</th>
<th  class="title" style="width:10%" colspan="2">操作</th>
</tr>
<thead>
<tbody>


<c:forEach items="${list_vending}"  var="list_vending">
<tr>
<td  style="width:10%">${list_vending.nodeId}</td>
<td  style="width:10%">${list_vending.nodeName}</td>
<td  style="width:10%">${list_vending.macAddr}</td>
<td  style="width:10%">
<c:if test="${list_vending.isAssign=='1'}">否</c:if>
<c:if test="${list_vending.isAssign=='2'}">是</c:if>
</td>
<td  style="width:10%">${list_vending.machineType}</td>
<td  class="td_center" width=5%><a href="<c:url value = '/to_node_edit_0?nodeId=${list_vending.nodeId}'/>" >编辑</a></td>
<td  class="td_center" width=5%><a href="<c:url value = '/do_node_view_3?nodeId=${list_vending.nodeId}'/>" >详情</a></td>

</tr>
</c:forEach>

</tbody>
</table>
<p>&nbsp;</p>
</form>
<div class="pagination">
	共有${length+1-1}页&nbsp; 当前第${PageNo+1}页&nbsp;
	
	<c:if test="${PageNo+1=='1'}">
	<a ><font color="gray">首页</font></a>
	<a ><font color="gray">上一页</font></a>
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="javascript:dosearch('do_node_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_node_search_3?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页</font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_node_search_3?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_node_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>	
</div>
</div>
</div>
</div>
</body>
</html>