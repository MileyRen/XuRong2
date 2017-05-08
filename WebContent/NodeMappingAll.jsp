<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
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
			if(!confirm("确定分配售货机？")){
				return false;
			}
			else return true;
		}
	}
	alert("请选择售货机！");
	return false;
}
/**
 * function changeclickvalue(){
		monopoly=1;
 }
 */
</script>
<title>分配售货机</title>
</head>
<body>

<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
售货机分配</font>(由nodeInfo表导入)</p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value = '/do_map_searchnodeInNodeInfo_4'/>" method="post" >
<table>
<tr style="background: #fff;">
<td  style="width:7%"></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="nodeId" value="${onodeinfo.nodeId}" id="nodeId"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="nodeName" value="${onodeinfo.nodeName}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="nodeStatus" value="${onodeinfo.nodeStatus}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="macAddr" value="${onodeinfo.macAddr}"/></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="machineType" value="${onodeinfo.machineType}"/></td>
<td  style="width:5%" colspan="1"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:5%" colspan="1"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
</tr>
</table>
</form>

<form name="operate" action="<c:url value="/do_map_nodes_4"/>" method="post" style="width: 100%" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" width=7%><input type="checkbox" name="chk_all" class="chk_all"/>全选</th>
<th  class="title" style="width:10%">设备编号</th>
<th  class="title" style="width:10%">设备铭牌号</th>
<th  class="title" style="width:10%">设备状态</th>
<th  class="title" style="width:10%">主板号</th>
<th  class="title" style="width:10%">设备型号</th>
<th  class="title" style="width:5%"></th>
<th  class="title" style="width:5%"></th>
</tr>
</thead>
<tbody>
<c:forEach items="${nodelist}"  var="list_vending">
<tr>
<td  style="width:7%"><input type="checkbox" name="check" value="${list_vending.nodeId}"/></td>
<td  style="width:10%">${list_vending.nodeId}</td>
<td  style="width:10%">${list_vending.nodeName}</td>
<td  style="width:10%">${list_vending.nodeStatus}</td>
<td  style="width:10%">${list_vending.macAddr}</td>
<td  style="width:10%">${list_vending.machineType}</td>
<td  style="width:5%"></td>
<td  style="width:5%"></td>
</tr>
</c:forEach>
</tbody>
</table>
<table>
<tr><td style="width:10%">选择用户:</td>
	<td style="width:90%">
	  	<select name="userId" id="userId" style="width:150px;">
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.userId}">${u.userName}</option>
		</c:forEach>
	  	</select>
  	</td></tr>
  </table>
<br/>
&nbsp;&nbsp;&nbsp;<input type="submit" value="分配" class="button" name="verify"/>
</form>

</div>
</div>
</div>
</body>
</html>