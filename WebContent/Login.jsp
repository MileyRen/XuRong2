<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
		background-color: #1D3647;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="images/login/skin.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function checkform()
{
	if(document.getElementById("uname").value==""){
		alert("请填写用户名！");
		return false;
	}
	if(document.getElementById("pwd").value==""){
		alert("请填写密码！");
		return false;
	}
}
</script>
<title>煦荣2.0系统后台登陆</title>
</head>
<body>
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top">
    <table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
      <tr>
        <td width="1%" height="21">&nbsp;</td>
        <td height="42">&nbsp;</td>
        <td width="17%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="49%" align="right">
        <table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
             <td height="80" align="center" valign="middle"><img src="images/login/login_09.png" />
             </td>
            </tr>
            
        </table></td>
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38"><span class="login_txt_bt">登陆后台管理</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                  <tr>
                    <td height="164" colspan="2" align="center">

                    <form id="form1" action="<c:url value ='/loginCheck'/>" method="post" style="width:330px;" onsubmit="return checkform()">
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                          <tr>
                            <td width="20%" height="38" class="top_hui_text"><span class="login_txt">用户名：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text"><input type="text" class="editbox4" name="userName"  id="uname"  value="admin" size="20">
                             <font color="red">${error}</font>
                             </td>
                          </tr>
                          <tr>
                            <td width="20%" height="35" class="top_hui_text"><span class="login_txt">密&nbsp;&nbsp;&nbsp;&nbsp;码 </span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input type="password" class="editbox4" size="18" name="passWord" id="pwd" value="123" >
                              <img src="images/login/luck.gif" width="19" height="18"> </td>
                          </tr>
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="20%" height="35" ><input name="btnLogin" type="submit" class="loginbutton"  value="登 陆"> </td>
                            <td width="67%" class="top_hui_text"><input name="btnCancel" type="reset" class="loginbutton" value="重置" ></td>
                          </tr> 
                        </table>
                        <br>
                    </form></td>
                  </tr>
                  <tr>
                    <td width="433" height="164" align="right" valign="bottom"><img src="images/login/login-wel.gif" width="242" height="138"></td>
                    <td width="57" align="right" valign="bottom">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
      <tr>
        <td align="center"><span class="login-buttom-txt">Copyright &copy; 2013-2017 上海煦荣信息技术有限公司</span></td>
      </tr>
    </table></td>
  </tr>
</table>



</body>
</html>