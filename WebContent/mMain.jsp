<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<table height="100%" border=2>
<tr><td align="center"><font color="blue">欢迎使用售货机存货更新系统</font></td></tr>
<tr><td align="center"><A  href="<c:url value='/to_prochannel_mun_0'/>" >额定值须实时更新</A></td></tr>
<tr><td align="center"><A  href="<c:url value='/to_prochannel_muc_0'/>" >真实值须实时更新</A></td></tr>
<tr><td align="center"><A  href="<c:url value='/to_prochannel_mui_0'/>" >增量值可异步更新</A></td></tr>
<tr><td align="right"><a href="<c:url value='/mlogoutCheck'/>"><font color="red">退出系统</font></a></td></tr>
</table>
</div>
</body>
</html>