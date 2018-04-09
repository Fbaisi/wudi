<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="res/jquery-3.2.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<div align="center" style="width: 1100px;">
		<font id="all">${alll }</font>	
		<form action="sureprice" method="post" id="sure">
			<input type="hidden" id="cc" name="str">
		</form>
		<div align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>填写标题描述</b>
		</div>
		<div >提交关键字流程:填写标题描述→设置价格→确认和提交→成功</div>
		<div style="background-color: pink">您一次最多可以提交20个关键字,若您希望继续添加请分次提交(您已经提交1个关键字)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" style="text-decoration: none">点击查看竞价排名关键关键字审核标准</a></div>
		<div style="background-color: pink">
			<table id="tab" border="1" bordercolor="white"  cellspacing="0" style="text-align: center;">
				<tr>
					<td colspan="4" width="400px">关键字信息</td>
					<td colspan="4" width="400px">关键字价格设置</td>
					<td colspan="3" width="300px">关键字当前情况</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>序号</td>
					<td>关键字</td>
					<td>起价</td>
					<td colspan="2" width="250px">竞价模式/竞价价格</td>
					<td colspan="2" width="150px">竞前三</td>
					<td>质量度</td>
					<td colspan="2">当前前三名价格</td>
				</tr>
			</table>
			
		</div>
	</div>
	<div align="center">
		<div style="width: 50%; float: left;" align="center" ><input type="button" value="上一步"></div>
		<div style="width: 50%; float: right;" align="center"><input onclick="addprice()" type="button" value="下一步"></div>
	</div>
<c:forEach  items="${list }" var="iteam" varStatus="ii">

	<input type="hidden" id="${iteam[0].key }" value="<c:choose><c:when test="${iteam[0].pricelist[0]!=null }">${iteam[0].pricelist[0] } </c:when><c:otherwise>-</c:otherwise></c:choose><c:choose><c:when test="${iteam[0].pricelist[1]!=null }">${iteam[0].pricelist[1] } </c:when><c:otherwise>-</c:otherwise></c:choose><c:choose><c:when test="${iteam[0].pricelist[2]!=null }">${iteam[0].pricelist[2] }</c:when><c:otherwise>-</c:otherwise></c:choose>">
</c:forEach>

			<script type="text/javascript">
			$("#all").hide();
			var cc=$("#all").html().split(";");
			for(var i=0;i<cc.length;i++){
				var ccc=$.parseJSON(cc[i]);
				var pricelist="";
				if($("#"+ccc.key).length>0){
					pricelist=$("#"+ccc.key).val();
				}else{
					pricelist="- - -"
				}
				$("#tab").append("<tr><td><input type='checkbox'></td><td>"+ (i+1) +"</td><td>" + ccc.key + "</td><td>1.2</td><td colspan='2' width='250px'><input type='text' id='price"+i+"' ></td><td colspan='2'width='150px'>竞 1 2 3 名</td><td>1.0</td><td>"+pricelist+"</td></tr>"); 
			}
			function addprice() {
				var cc=$("#all").html();
				var c=$("#all").html().split(";");
				switch (c.length) {
				case 1:
					cc=cc+";"+JSON.stringify({"price1":$("#price0").val()});
					break;
				case 2:
					cc=cc+";"+JSON.stringify({"price1":$("#price0").val(),"price2":$("#price1").val()});
					break;
				case 3:
					cc=cc+";"+JSON.stringify({"price1":$("#price0").val(),"price2":$("#price2").val(),"price3":$("#price3").val()});
					break;
				default:
					break;
				}
				$("#cc").val(cc);
				$("#sure").submit();
			}
		</script>
</body>
</html>