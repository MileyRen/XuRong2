<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
    <%@ page import="java.text.*"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />
<link href="css/title.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<style type="text/css">
.line_text
{
width:150px;
white-space:nowrap;
word-break:keep-all;
overflow:hidden;
text-overflow:ellipsis;
}
  
.autotable{       
table-layout:fixed;       
width:98%       
border:0px;       
margin:0px;       
background-color:yellow;/*#BDE1F2;  */     
}      

.autotable tr td{
text-overflow:ellipsis; /* for IE */        
-moz-text-overflow: ellipsis; /* for Firefox,mozilla */        
overflow:hidden;
word-break:keep-all;
white-space: nowrap;       
border:0px;       
text-align:left       
}   
</style>
<script language="javascript" type="text/javascript">
function dosubmit(choose)
{ 
	document.forms["operate"].action= choose;
	document.forms["operate"].submit(); 
}

function dosearch(choose) {
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

window.onload=function(){
	var index1=$("#htableName").val();
	var index2=$("#hop").val();
	$("#tableName").val(index1);
	$("#op").val(index2);
};
</script>

<title>选择点位信息</title>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
</head>
<body>

<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
临时更新记录表管理</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value="/do_optemp_search_3?PageNo=0"/>" method="post" >
<table>
<tr style="background: #fff;">
<td   width=8%>查询条件</td>
<td  style="width:10%">
<select name="tableName" id="tableName">
<c:if test="${ot.tableName == ''}"><option value="">请选择</option></c:if>
<c:if test="${ot.tableName != ''}"><option value="${ot.tableName}">${ot.tableName}</option><option value="">请选择</option></c:if>
       <option value="RPT_TXN_DTL">交易记录</option>
       <option value="P_GOODS_INFO">商品信息</option>
       <option value="P_WARE_INFO">货道信息</option>
       <option value="NODE_INFO">售货机</option>
       <option value="GROUP_INFO">售货机组</option>
       <option value="PARAM_VERSION">参数版本</option>
</select><input type="hidden" name="htableName" id="htableName" value="${ot.tableName}"/></td>
<td  style="width:10%"><!-- <input class="text-input" style="width: 80%" type="text" maxlength="4" name="op" value="${ot.op}"/> -->
<select name="op" id="op">
<c:if test="${ot.op == ''}"><option value="">请选择</option></c:if>
<c:if test="${ot.op != ''}"><option value="${ot.op}">${ot.op}</option><option value="">请选择</option></c:if>
       <option value="I">插入</option>
       <option value="U">更新</option>
       <option value="D">删除</option>
</select><input type="hidden" name="hop" id="hop" value="${ot.op}"/></td>
<td  style="width:12%"><input class="text-input" style="width: 80%" type="text" maxlength="8" name="lastTime" value="${ot.lastTime}"/></td>
<td  style="width:40%"><input class="text-input" style="width: 80%" type="text" maxlength="256" name="recordId" value="${ot.recordId}"/></td>
<td  style="width:8%"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
<td  style="width:8%"><input type="button" name="reset" id="reset"  class="button" value="重置"/></td>
</tr>
</table>
</form>
<form name="operate" action="<c:url value="/do_optemp_delete_2"/>" method="post"  onsubmit="return checkform()">
<table  class="autotable" id="autotable">
<thead>
<tr class="tr_top">
<th  class="title" width=8%><input type="checkbox" class="check-all"/>全选</th>
<th  class="title" style="width:10%">操作表名</th>
<th  class="title" style="width:10%">操作</th>
<th  class="title" style="width:12%">更新时间</th>
<th  class="title" style="width:48%" colspan="2">记录全字段值</th>
<th  class="title" style="width:8%" align="center">操作</th>
</tr>
<thead>
<tbody>

<c:forEach items="${oplist}"  var="oplist">
<tr>
<td  style="width:8%"><input type="checkbox" name="check" value="${oplist.id}"/></td>
<td  style="width:10%">
			<c:if test="${oplist.tableName == 'RPT_TXN_DTL'}">交易记录</c:if>
			<c:if test="${oplist.tableName == 'P_GOODS_INFO'}">商品信息</c:if>
			<c:if test="${oplist.tableName == 'P_WARE_INFO'}">货道信息</c:if>
			<c:if test="${oplist.tableName == 'NODE_INFO'}">售货机</c:if>
			<c:if test="${oplist.tableName == 'GROUP_INFO'}">售货机组</c:if>
			<c:if test="${oplist.tableName == 'PARAM_VERSION'}">参数版本</c:if>
</td>
<td  style="width:10%">
			<c:if test="${oplist.op.toString() == 'I'}">插入</c:if>
			<c:if test="${oplist.op.toString() == 'U'}">更新</c:if>
			<c:if test="${oplist.op.toString() == 'D'}">删除</c:if>
</td>
<td  style="width:12%">
	${oplist.lastTime}
 </td>
<td  style="width:48%" colspan="2"> ${oplist.recordId}
	<!-- 
	<c:choose>
       <c:when test="${fn:length(oplist.recordId) >70}">
              ${fn:substring(oplist.recordId, 0, 70)}<font color="red">...</font>
       </c:when>
       <c:otherwise>
              ${oplist.recordId}
       </c:otherwise>
</c:choose>
 -->
</td>
<td  class="td_center" style="width:8%"><a href= "<c:url value='/do_optemp_update_0?id=${oplist.id}'/>"  >更新</a></td>
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
	<a ><font color="gray" >首页</font></a>
	<a ><font color="gray" >上一页</font></a>	
	</c:if>
	<c:if test="${PageNo+1!='1'}">
	<a href="javascript:dosearch('do_optemp_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_optemp_search_3?PageNo=${PageNo-1}')" >上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页    </font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_optemp_search_3?PageNo=${PageNo+1}')" >下一页</a>
	<a href="javascript:dosearch('do_optemp_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>
</div>

</div>
</div>
</div>
</body>
</html>