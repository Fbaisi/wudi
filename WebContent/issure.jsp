<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="res/jquery-3.2.1.js"></script>
<title>确定吗！！！！</title>
</head>
<body>
	<div align="center" style="width: 900px;">
		<font id="all" class="zeze">${all }</font>	
		<form action="isok" method="post" id="sure">
			<input type="hidden" id="str" name="str">
			<input type="hidden" id="user" name="user" value="${user }">
		</form>
		<div align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>填写标题描述</b>
		</div>
		<div >提交关键字流程:填写标题描述→设置价格→确认和提交→成功</div>
		<div style="background-color: pink">您一次最多可以提交20个关键字,若您希望继续添加请分次提交(您已经提交1个关键字)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" style="text-decoration: none">点击查看竞价排名关键关键字审核标准</a></div>
		<div style="background-color: pink">
			<table id="tab" border="1" bordercolor="white"  cellspacing="0" style="text-align: center;">
				<tr>
					<td width="300px">序号</td>
					<td width="300px">关键字</td>
					<td width="300px">竞价价格</td>
				</tr>
			</table>
		</div>
		</div>
		<div align="center">
		<div style="width: 50%; float: left;" align="center" ><input type="button" value="上一步"></div>
		<div style="width: 50%; float: right;" align="center"><input onclick="sure()" type="button" value="确定"></div>
	</div>
		<script type="text/javascript">
		$(".zeze").hide();
		var cc=$("#all").html().split(";");
		for(var i=0;i<cc.length-1;i++){
			var ccc=$.parseJSON(cc[i]);
			var pri="1";
			switch (i) {
			case 0:
				pri=$.parseJSON(cc[cc.length-1]).price1;
				break;
			case 1:
				pri=$.parseJSON(cc[cc.length-1]).price2;
				break;
			case 2:
				pri=$.parseJSON(cc[cc.length-1]).price3;
				break;
			default:
				break;
			}
			$("#tab").append("<tr><td>"+ (i+1) +"</td><td>" + ccc.key + "</td><td><input type='text' id='price"+i+"' value='"+pri+"'></td></tr>"); 
		}
		function sure() {
			var ccc=$("#all").html()
			var	all=ccc.substring(0,ccc.lastIndexOf(";"));
			var cc=$("#all").html().split(";");
			switch (cc.length-1) {
			case 1:
				all=all+";"+JSON.stringify({"price0":$("#price0").val()});
				break;
			case 2:
				all=all+";"+JSON.stringify({"price0":$("#price0").val(),"price1":$("#price1").val()});
				break;
			case 3:
				all=all+";"+JSON.stringify({"price0":$("#price0").val(),"price1":$("#price2").val(),"price2":$("#price3").val()});
				break;
			default:
				break;
			}
			$("#str").val(all);
			$("#sure").submit();
		}
		</script>
</body>
</html>