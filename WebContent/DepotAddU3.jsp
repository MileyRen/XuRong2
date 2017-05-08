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
<!-- <script src="js/jquery-1.4.2.min.js"></script> -->
<link rel="stylesheet" href="css/jquery-ui.css" />

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style.css" />
<style>
  .custom-combobox {
    position: relative;
    display: inline-block;
  }
  .custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
    /* support: IE7 */
    *height: 1.7em;
    *top: 0.1em;
  }
  .custom-combobox-input {
    margin: 0;
    padding: 0.3em;
  }
  </style>
<script language="javascript" type="text/javascript">
function FormatNumber(srcStr, nAfterDot){
var srcStr,nAfterDot;
var resultStr,nTen;
var i, j;
srcStr = ""+srcStr+"";
strLen = srcStr.length;
dotPos = srcStr.indexOf(".",0);
if (dotPos == -1){
   resultStr = srcStr+".";
   for (i=0;i<nAfterDot;i++){
    resultStr = resultStr+"0";
   }
}else{
   if ((strLen - dotPos - 1) >= nAfterDot){
    nAfter = dotPos + nAfterDot + 1;
    nTen =1;
    for(j=0;j<nAfterDot;j++){
     nTen = nTen*10;
    }
    resultStr = Math.round(parseFloat(srcStr)*nTen)/nTen;
   }else{
    resultStr = srcStr;
    for (i=0;i<(nAfterDot - strLen + dotPos + 1);i++){
     resultStr = resultStr+"0";
    }
   }
}
return resultStr;
}

function doAjax(){
	var ename = $("#employeeName option:selected").attr("value");
    jQuery.ajax({
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        url: 'do_money_find_3',
        data: JSON.stringify({
        	employeeName: ename
        }),
        dataType: 'json',
        success: function(data){
        	$("#moneyin").attr("value",data.moneyIn);
        	$("#moneycount").attr("value",data.moneyCount);
        },
    });
}

$(document).ready(function(){
    //<tr/>居中
  //  alert("I am Ready!");
//    $("#tab tr").attr("align","center");
    //增加<tr/>
    $("#tab").hide();
    $("#op").hide();
    $("#add").hide();
    $("#dis").hide();
    $("#res").hide();
//    $("#submit").hide();
    
    var seq = 0;//序号
    //响应submit按键事件

	 $("#jsubmit").click(function(){
		 	var mt = $("#moneyThis").attr("value");
		 	if(mt==""){alert("请添加记录后再提交");return false;}
		 	//document.forms["createdepot"].action='/do_depot_addU_1';
		 	//document.forms["createdepot"].submit();
		 	$('#createdepot').submit();
		 	/*
		 	jQuery("form")//选择form
		    .first()//选择第一个 第二个用eq(1) 最后一个 last()
		    .attr("action","/do_depot_addU_1?method=post")//更改属性
		    .submit();//提交
		    */
		 });

    $("#employeeName").change(function(){
    	var ename = $("#employeeName option:selected").attr("value");
    	if(ename!=""){
    		doAjax();
    		$("#sel").hide();
        	$("#tab").show();
            $("#op").show();
            $("#add").show();//$("#txt").attr("value")
           	//alert(ename);
            $("#dis").show();
            $("#res").show();
            //$("#emp").attr(ename);
            $("#emp").attr("value",ename);
    	}
    });
	//按回车键添加
    $(function () {
  	  $('input:text:first').focus(); //把焦点放在第一个文本框
  	  var $inp = $('input'); //所有的input元素
  	  $inp.keypress(function (e) { //这里给function一个事件参数命名为e，叫event也行，随意的，e就是IE窗口发生的事件。
  	      var key = e.which; //e.which是按键的值
  	      if (key == 13) {
  	    	var dwn = $("#dwname option:selected").attr("value");//.text();//id
  	    	
  	    	var dw = $("#dwname option:selected").text().split("---")[1];//.text();//value//display
  	    	if(dwn==""){alert("请选择商品名");$("#dwname").focus();return false;}

  	    	var dwnum = $("#dwnum").val().trim();
  	    	if(dwnum==""||dwnum=="undefined"||isNaN(dwnum)||dwnum=="0"){alert("请填写商品数量");$("#dwnum").focus();return false;}
  	    	$("#dwnum").attr("value",dwnum);
  	    	
  	    	var dwp = $("#dwprice").val().trim();
  	    	if(dwp==""||dwp=="undefined"||isNaN(dwp)||dwp=="0"){alert("请填写商品价格");$("#dwprice").focus();return false;}
  	    	$("#dwprice").attr("value",dwp);
  	    	
  	    	var rm = $("#remark").val().trim();
  	    	if(rm==""||rm=="undefined"){rm="无";}
  	    	$("#remark").attr("value",rm);
  	    	
  	    	var mt = $("#moneyThis").attr("value");
  	    	mt = ((mt*1) + (dwnum * dwp));
  	    	$("#moneyThis").attr("value",mt);
  	    	$("#pre").attr("value",FormatNumber((mt / 0.7), 0));

  	    	$("#tab").append("<tr id="+seq+" align='center'>"
  	    			+"<td style='width:10%'>"+dw+"<input type='hidden' name='depotWareName' id='depotWareName' value='"+dw+"'/><input type='hidden' name='wareId' id='wareId' value='"+dwn+"'/><input type='hidden' name='depotWareNum' id='depotWareNum' value='"+dwnum+"'/><input type='hidden' name='depotWarePrice' id='depotWarePrice' value='"+dwp+"'/><input type='hidden' name='dremark' id='dremark' value='"+rm+"'/></td>"
  	                +"<td style='width:20%'>"+dwnum+"</td>"
  				    +"<td style='width:10%'>"+dwp+"</td>"
  				    +"<td style='width:20%'>"+rm+"</td>"
  				    +"<td><a href=\'#\' onclick=\'deltr("+seq+")\'>删除</a></td>"
  	                +"</tr>");
  	    	seq++;
  	      }
  	  });

  	  });
	
  //按添加键添加
    $("#but").click(function(){
    	var dwn = $("#dwname option:selected").attr("value");//.text();//id
    	
    	var dw = $("#dwname option:selected").text().split("---")[1];//.text();//value//display
    	if(dwn==""){alert("请选择商品名");$("#dwname").focus();return false;}
    	//var dwnum = $("#dwnum").attr("value");
    	var dwnum = $("#dwnum").val();
    	if(dwnum==""||dwnum=="undefined"||isNaN(dwnum)||dwnum=="0"){alert("请填写商品数量");$("#dwnum").focus();return false;}
    	//var dwp = $("#dwprice").attr("value");
    	var dwp = $("#dwprice").val();
    	if(dwp==""||dwp=="undefined"||isNaN(dwp)||dwp=="0"){alert("请填写商品价格");$("#dwprice").focus();return false;}
    	//var rm = $("#remark").attr("value");
    	var rm = $("#remark").val();
    	if(rm==""||rm=="undefined"){rm="无";}
    	
//    	alert("dwn:"+dwn);
//    	alert("dw:"+dw);
//    	alert("dwnum:"+dwnum);
//    	alert("dwp:"+dwp);
 //   	$("#submit").show();
    	
    	var mt = $("#moneyThis").attr("value");
    	mt = ((mt*1) + (dwnum * dwp));
    	$("#moneyThis").attr("value",mt);
    	$("#pre").attr("value",FormatNumber((mt / 0.7), 0));
    	//FormatNumber(3.562454665, 2);
    	//var _len = $("#tab tr").length;
    	$("#tab").append("<tr id="+seq+" align='center'>"
    			+"<td style='width:10%'><input type='text' name='depotWareName' id='depotWareName' value='"+dw+"'/><input type='hidden' name='wareId' id='wareId' value='"+dwn+"'/><input type='hidden' name='depotWareNum' id='depotWareNum' value='"+dwnum+"'/><input type='hidden' name='depotWarePrice' id='depotWarePrice' value='"+dwp+"'/><input type='hidden' name='dremark' id='dremark' value='"+rm+"'/></td>"
                +"<td style='width:20%'>"+dwnum+"</td>"
			    +"<td style='width:10%'>"+dwp+"</td>"
			    +"<td style='width:20%'>"+rm+"</td>"
			    +"<td><a href=\'#\' onclick=\'deltr("+seq+")\'>删除</a></td>"
                +"</tr>");
    	seq++;
    });
});

//删除<tr/>
var deltr =function(index)
{
	var $td = $("tr[id='"+index+"']").children('td');
	var n1 = $td.get(1).innerHTML;
	var n2 = $td.get(2).innerHTML;
	
	var mt = $("#moneyThis").attr("value");
	mt = (mt - (n1 * n2));
	$("#moneyThis").attr("value",mt);
	$("#pre").attr("value",FormatNumber((mt / 0.7), 0));
	$("tr[id='"+index+"']").remove();//删除当前行
	/*
    var _len = $("#tab tr").length;
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
	*/
};
</script>

  <script>
  (function( $ ) {
    $.widget( "custom.combobox", {
      _create: function() {
        this.wrapper = $( "<span>" )
          .addClass( "custom-combobox" )
          .insertAfter( this.element );
 
        this.element.hide();
        this._createAutocomplete();
        this._createShowAllButton();
      },
 
      _createAutocomplete: function() {
        var selected = this.element.children( ":selected" ),
          value = selected.val() ? selected.text() : "";
 
        this.input = $( "<input>" )
          .appendTo( this.wrapper )
          .val( value )
          .attr( "title", "" )
          .autocomplete({
            delay: 0,
            minLength: 0,
            source: $.proxy( this, "_source" )
          })
          .tooltip({
            tooltipClass: "ui-state-highlight"
          });
 
        this._on( this.input, {
          autocompleteselect: function( event, ui ) {
            ui.item.option.selected = true;
            this._trigger( "select", event, {
              item: ui.item.option
            });
          },
 
          autocompletechange: "_removeIfInvalid"
        });
      },
 
      _createShowAllButton: function() {
        var input = this.input,
          wasOpen = false;
 
        $( "<a>" )
          .attr( "tabIndex", -1 )
          .attr( "title", "Show All Items" )
          .tooltip()
          .appendTo( this.wrapper )
          .button({
            icons: {
              primary: "ui-icon-triangle-1-s"
            },
            text: false
          })
          .mousedown(function() {
            wasOpen = input.autocomplete( "widget" ).is( ":visible" );
          })
          .click(function() {
            input.focus();
 
            // Close if already visible
            if ( wasOpen ) {
              return;
            }
 
            // Pass empty string as value to search for, displaying all results
            input.autocomplete( "search", "" );
          });
      },
 
      _source: function( request, response ) {
        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
        response( this.element.children( "option" ).map(function() {
          var text = $( this ).text();
          if ( this.value && ( !request.term || matcher.test(text) ) )
            return {
              label: text,
              value: text,
              option: this
            };
        }) );
      },
 
      _removeIfInvalid: function( event, ui ) {
 
        // Selected an item, nothing to do
        if ( ui.item ) {
          return;
        }
 
        // Search for a match (case-insensitive)
        var value = this.input.val(),
          valueLowerCase = value.toLowerCase(),
          valid = false;
        this.element.children( "option" ).each(function() {
          if ( $( this ).text().toLowerCase() === valueLowerCase ) {
            this.selected = valid = true;
            return false;
          }
        });
 
        // Found a match, nothing to do
        if ( valid ) {
          return;
        }
 
        // Remove invalid value
        this.input
          .val( "" )
          .attr( "title", value + " didn't match any item" )
          .tooltip( "open" );
        this.element.val( "" );
        this._delay(function() {
          this.input.tooltip( "close" ).attr( "title", "" );
        }, 2500 );
        this.input.data( "ui-autocomplete" ).term = "";
      },
 
      _destroy: function() {
        this.wrapper.remove();
        this.element.show();
      }
    });
  })( jQuery );
 
  $(function() {
    $( "#dwname" ).combobox();
    $( "#toggle" ).click(function() {
      $( "#dwname" ).toggle();
    });
  });
  </script>
<script type="text/javascript">
function subclick(){
	var mt = document.getElementById("moneyThis").value;
	//var mt = $("#moneyThis").attr("value");
 	if(mt==""){alert("请添加记录后再提交");return false;}
 	//document.forms["createdepot"].action='/do_depot_addU_1';
 	alert("submit");
 	document.forms["createdepot"].submit();
}
</script>
<title>新建出库记录</title>
</head>
<body>
<div id="main-content">
<font  style="font-family:'微软雅黑'; font-size:30px">新建出库记录</font>
<p>&nbsp;</p>
<div class="content-box">
<form id="createdepot" name="createdepot" action="<c:url value='/do_depot_addU_1'/>" method="post" ><!-- onsubmit="return checkform()" -->
<table id="sel">
  <tr>
    <td style="width:15%">请选择营业员组名:</td>
    <td>
    <select name="employeeName" id="employeeName">
    <option value="">请选择</option>
	  	<c:forEach items="${users}" var="u">
			<option value="${u.employeeName}">${u.employeeName}</option>
		</c:forEach>
	</select></td>
  </tr>
</table>
<table id="dis">
<tr>
<td>单号：</td><td><input name="shippingId" id="shippingId" value="${shippingId}"/></td>
<td>制表：</td><td><input name="tableor" id="tableor" value=""/></td>
<td>仓库：</td><td><input name="wareHouse" id="wareHouse" value=""/></td>
</tr><tr>
<td>营业员：</td><td><input name="humanName" id="humanName" value=""/></td>
<td>运营：</td><td><input name="operator" id="operator" value=""/></td>
<td>物流司机：</td><td><input name="driverName" id="driverName" value=""/></td>
</tr>
<tr><td style='width:10%'>营业员组名:</td>
<td style='width:25%'><input name="emp" id="emp" type="text" value="" readonly="readonly"/></td>
<td style='width:12%'>今日上缴营业额</td><td style='width:12%'><input name="moneyin" id="moneyin" type="text" value="" readonly="readonly"/></td>
<td style='width:12%'>当月累计剩余额</td><td style='width:12%'><input name="moneycount" id="moneycount" type="text" value="" readonly="readonly"/></td>
<td style='width:5%'></td></tr>
</table>
<table id="add">
<tr>
	<td style='width:6%'>商品</td>
	<!-- 
	<td style='width:20%'>
		<select name='dwname' id='dwname'>
			<option value=''>请选择</option>
			<c:forEach items='${wares}' var='u' >
			<option value='${u.wareId}'>${u.wareName}</option>
			</c:forEach>
		</select>
	</td>
	 -->
	<td style='width:20%'>
	<select name='dwname' id='dwname'>
  			<option value=''>请选择</option>
		<c:forEach items='${wares}' var='u' >
			<option value='${u.wareId}'>${u.wareSimpleCode}---${u.wareName}</option>
		</c:forEach>
	</select>
</td>
	<td style='width:6%'>数量</td><td style='width:8%'><input class="text-input" type="text" name="dwnum" id="dwnum"/></td>
	<td style='width:9%'>单价(分)</td><td style='width:8%'><input class="text-input" type="text" name="dwprice" id="dwprice"/></td>
	<td style='width:6%'>备注</td><td style='width:20%'><input class="text-input" type="text" name="remark" id="remark" value="无"/></td>
	<td style='width:6%'><input type="button" id="but" class="button" value="增加"/></td>
</tr>
</table>

<table id="tab">
<thead>
<tr class="tr_top">
<th  class="title" style="width:20%">商品名称</th>
<th  class="title" style="width:10%">数量</th>
<th  class="title" style="width:10%">单价<font color="red">(分)</font></th>
<th  class="title" style="width:20%">备注</th>
<th  class="title" style="width:10%">操作</th>
<!-- <font color="red">分</font> 
<th  class="title" style="width:20%">商品编号</th>
<th  class="title" style="width:10%">规格</th>
<th  class="title" style="width:8%">单位</th>
-->
</tr>
</thead>
<tbody>
<tr></tr>
</tbody>
</table>
<table id="res" align="right">
<tr align="right"><td style="width:70%"></td><td>总金额<font color="red">(分)</font>：</td><td><input name="moneyThis" id="moneyThis" readonly="readonly" value=""/></td></tr>
<tr align="right"><td style="width:70%"></td><td>预估售价<font color="red">(分)</font>：</td><td><input name="pre" id="pre" value=""/></td></tr>
</table>
<table id="op">
  <tr>
  <td></td>
    <td>
	    <input type="button" name="jsubmit" id="jsubmit" value="提交" class="button" /><!--  onclick="return subclick()" -->
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    
	    <!-- <input type="reset" value="重置"  class="button" <input type="submit" name="submit" id="submit" value="submit" class="button" />/> -->
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="button" value="返回"  class="button" onclick="location.href='<c:url value="/to_depot_addU_1"/>'"/>
    </td>
    <td></td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>