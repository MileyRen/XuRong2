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
<title>查询营业额上缴情况</title>

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script type="text/javascript" src="js/cal.js"></script> 
</head>

<body>
<div id="main-content">
<p><font style="font-family:'宋体'; font-size:30px; font-weight: bold;">
营业额上缴信息</font></p>
<p>&nbsp;</p>

<div class="content-box">
<div class="content-box-content"> 
<form name="search" action="<c:url value="/do_money_search_3?PageNo=0"/>" method="post" >
<table style="font-size: 16px;">
<tr style="background: #fff;vertical-align: bottom; padding-bottom: 0px">
<td  style="width:6%"></td>
<td  style="width:9%">
	<select name="employeeName" id="employeeName">
	<c:if test="${d.employeeName == ''}"><option value="">请选择</option></c:if>
	<c:if test="${d.employeeName != ''}"><option value="${d.employeeName}">${d.employeeName}</option><option value="">请选择</option></c:if>
	  	<c:forEach items="${users}" var="u" >
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select>
</td>
<td  style="width:9%"><input class="text-input" style="width: 80%" type="text" name="moneyIn" value="${d.moneyIn}"/></td>
<td  style="width:9%"><input class="text-input" style="width: 80%" type="text" name="moneyOperator" value="${d.moneyOperator}"/></td>
<td  style="width:8%; padding-left: 0px">
<input class="text-input" style="width: 90%" type="text" name="mintime" value="${ltime}" maxlength="8"/>
</td>
<td style="width:8%; padding-left: 0px">
<input class="text-input" style="width: 90%" type="text" name="maxtime" value="${rtime}" maxlength="8"/>
</td>
<td  style="width:5%"><input type="submit" name="btnSearch" id="btnSearch"  class="button" value="搜索"/></td>
</tr>
</table>
</form>        

<form name="operate" action="<c:url value="/do_money_delete_2"/>" method="post" onsubmit="return checkform()">
<table>
<thead>
<tr class="tr_top">
<th  class="title" style="width:6%"><input type="checkbox" class="check-all" onChange="checkAll(this.checked)"/>全选</th>
<th  class="title" style="width:9%">员工姓名</th>
<th  class="title" style="width:9%">金钱数量</th>
<th  class="title" style="width:9%">操作人</th>
<th  class="title" style="width:16%" colspan="2" align="center">更新时间</th>
<th  class="title" style="width:5%">
	<input type="button" name="btncreate" id="btncreate" class="button" value="新建" onclick="location.href='<c:url value="/to_money_add_1"/>'">
</th>
</tr>
</thead>
<tbody>
<c:forEach items="${moneylist}"  var="money" >
<tr>
<td  style="width:6%"><input type="checkbox" name="check" value="${money.moneyId}"/></td>
<td  style="width:9%">${money.employeeName}</td>
<td  style="width:9%">${money.moneyIn}</td>
<td  style="width:9%">${money.moneyOperator}</td>
<td style="width:16%" colspan="2" align="center">${money.lastTime}</td>
<td  style="width:5%"><a href= '<c:url value="/to_money_edit_0"/>?id=${money.moneyId}'>编辑</a></td>
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
	<a href="javascript:dosearch('do_money_search_3?PageNo=0')">首页</a>
	<a href="javascript:dosearch('do_money_search_3?PageNo=${PageNo-1}')">上一页</a>
	</c:if>
	<c:if test="${length+1=='1'||PageNo+1==length}">
	<a ><font color="gray">下一页</font></a>
	<a ><font color="gray">尾页    </font></a>
	</c:if>
	<c:if test="${length+1!='1'&&PageNo+1!=length}">
	<a href="javascript:dosearch('do_money_search_3?PageNo=${PageNo+1}')">下一页</a>
	<a href="javascript:dosearch('do_money_search_3?PageNo=${length-1}')">尾页</a>
	</c:if>
</div>
</div>
</div>
</div>
</body>
</html>