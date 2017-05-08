<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<title></title>
<script>
	function returnNum(){
			document.setElementById("num").value = $("#tab tr").length; 
			alert($("#tab tr").length);
	}

    $(document).ready(function(){
        //<tr/>居中
        $("#tab tr").attr("align","center");
        
        //增加<tr/>
        $("#but").click(function(){
            var _len = $("#tab tr").length;        
            $("#tab").append("<tr id="+_len+" align='center'>"
                                +"<td>"+_len+"</td>"
                                +"<td>Dynamic TR"+_len+"</td>"
                                +"<td><input type='text' name='desc"+_len+"' id='desc"+_len+"' /></td>"
                                //+"<td><input type='text' name='i' value='"+i+"'/></td>"
                                +"<td><a href=\'#\' onclick=\'deltr("+_len+")\'>删除</a></td>"
                            +"</tr>");
            $("#num").val(_len); 
        });    
    })
    
    //删除<tr/>
    var deltr =function(index)
    {
        var _len = $("#tab tr").length;
        $("tr[id='"+index+"']").remove();//删除当前行
        for(var i=index+1,j=_len;i<j;i++)
        {
            var nextTxtVal = $("#desc"+i).val();
            $("tr[id=\'"+i+"\']")
                .replaceWith("<tr id="+(i-1)+" align='center'>"
                				+"<td>"+(i-1)+"</td>"
                                +"<td>Dynamic TR"+(i-1)+"</td>"
                                +"<td><input type='text' name='desc"+(i-1)+"' value='"+nextTxtVal+"' id='desc"+(i-1)+"'/></td>"
                                +"<td><a href=\'#\' onclick=\'deltr("+(i-1)+")\'>删除</a></td>"
                            +"</tr>");
        }
        $("#num").val($("#num").val()-1);
    }
</script>
</head>
<body>
  <form name="search" action="<c:url value='/do_test_jquery_0'/>" method="post" onsubmit="return returnNum()">
    <table id="tab" border="1" width="60%" align="center" style="margin-top:20px">
        <tr>
            <td width="20%">序号</td>
            <td>标题</td>
            <td>描述</td>
            <td>操作</td>
       </tr>
    </table>
    <table><tr><td><input name="num" id="num" type="text" value=""/></td></tr></table>
    <div style="border:2px; 
                border-color:#00CC00; 
                margin-left:20%;
                margin-top:20px">
        <input type="button" id="but" value="增加"/>
    </div>
    <input type="submit" value="提交"/>
    
 <table>
<tr id="1"><td>abc</td><td></td><td></td><td></td><td><input type="button" onclick="change()"/></td></tr>
<tr id="2"><td><input type="text" value="123"></td></tr>
</table>
  </form>
</body>
</html>