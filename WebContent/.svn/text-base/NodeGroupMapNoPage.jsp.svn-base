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
<title>查询售货机</title>
</head>
<body>

<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
售货机组分配</font>(由paramVersion表导入)</p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value = '/do_map_searchgroupInParamVersion_4'/>" method="post" >
<table>
<tr style="background: #fff;">
<td  style="width:7%"></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="groupId" value="${onginfo.groupId}" id="nodeId"/><font color="red">精确</font></td>
<td  style="width:10%"><input class="text-input" style="width: 80%" type="text" name="groupName" value="${onginfo.groupName}"/><font color="blue">模糊</font></td>
<td  style="width:5%"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:5%"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
</tr>
</table>
</form>

<form name="operate" action="<c:url value="/do_map_groups_4"/>" method="post" style="width: 100%" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" width=7%><input type="checkbox" name="chk_all" class="chk_all"/>全选</th>
<th  class="title" style="width:10%">设备组编号</th>
<th  class="title" style="width:10%">设备组名称</th>
<th  class="title" style="width:5%"></th>
<th  class="title" style="width:5%"></th>
</tr>
</thead>
<tbody>
<c:forEach items="${nglist}"  var="list_vending">
<tr>
<td  style="width:7%"><input type="checkbox" name="check" value="${list_vending.groupId}"/></td>
<td  style="width:10%">${list_vending.groupId}</td>
<td  style="width:10%">${list_vending.groupName}</td>
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