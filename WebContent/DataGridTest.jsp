<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	function show(obj,id,valu){
		if(id == "0"){
			obj.innerHTML = "<input type='text' name='names' value='"+ valu +"'>";
		}else if(id == "1"){
			obj.innerHTML = "<input type='text' name='codes' value='"+ valu +"'>";
		}
	}
</script>
</head>
<body>

<form name="f1" method="post" action="XXX">
<table border="1" width="500">
	<tr>
		<td width="20%">这是主键</td>
		<td width="40%">名字</td>
		<td width="40%">编号</td>
	</tr>
	<tr>
		<td><input type="hidden" name="ids" value="1">1</td>
		<td onDblClick="show(this,'0','打酱油');"><input type="hidden" name="names" value="打酱油">打酱油</td>
		<td onDblClick="show(this,'1','9527');"><input type="hidden" name="codes" value="9527">9527</td>
	</tr>
	<tr>
		<td><input type="hidden" name="ids" value="2">2</td>
		<td onDblClick="show(this,'0','俯卧撑');"><input type="hidden" name="names" value="俯卧撑">俯卧撑</td>
		<td onDblClick="show(this,'1','9528');"><input type="hidden" name="codes" value="9528">9528</td>
	</tr>
</table>
<input type="submit">
</form>


</body>
</html>