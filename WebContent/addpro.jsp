<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="res/jquery-3.2.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addpro</title>
</head>
<body>
	<div align="center">
	<div align="center" style="width: 800px;">
		<div align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>填写标题描述</b>
		</div>
		<div >提交关键字流程:填写标题描述→设置价格→确认和提交→成功</div>
		<div style="background-color: pink">您一次最多可以提交20个关键字,若您希望继续添加请分次提交(您已经提交1个关键字)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" style="text-decoration: none">点击查看竞价排名关键关键字审核标准</a></div>
		<div><input type="button" value="下一步" onclick="jump()">
			<form action="findprice" id="goall" method="post">
				<input type="hidden" name="pro" id="pro" >
			</form>
		</div>
		<div style="background-color: pink">
			<table border="1" bordercolor="white"  cellspacing="0">
				<tr>
					<td width="300px" align="center">关键字</td>
					<td width="500px"><input type="text" id="key1"><script type="text/javascript">
						$.ajax({
							type : "POST",
							contentType : 'application/json',
							url : 'findtypee',
							dataType : 'json',
							success : function(data) {
								for(var i=0;i<data.size;i++){
								$("#typee").append("<option value="+ data[i].t_id +">" + data[i].text + "</option>"); 
								$("#typeee").append("<option value="+ data[i].t_id +">" + data[i].text + "</option>"); 
								$("#typeeee").append("<option value="+ data[i].t_id +">" + data[i].text + "</option>"); 
								}
								}
							});
					</script><select id="typee"></select>最多写32个字</td>
				</tr>
				<tr>
					<td align="center">网页标题</td>
					<td><input type="text" id="title1">最多写20个字</td>
				</tr>
				<tr>
					<td align="center">url地址</td>
					<td><input type="text" id="url1"></td>
				</tr>
				<tr>
					<td align="center">网页描述</td>
					<td><textarea rows="10" cols="50" id="text1"></textarea>最多100个字</td>
				</tr>
			</table>
		</div>
		<div><input type="button" value="复制">点击按钮,可将上个文本框的内容复制到下个添加框内</div>
			<div style="background-color: pink">
			<table border="1" bordercolor="white"  cellspacing="0">
				<tr>
					<td width="300px" align="center">关键字</td>
					<td width="500px"><input type="text" id="key2"><select id="typeee"></select>最多写32个字</td>
				</tr>
				<tr>
					<td align="center">网页标题</td>
					<td><input type="text" id="title2">最多写20个字</td>
				</tr>
				<tr>
					<td align="center">url地址</td>
					<td><input type="text" id="url2"></td>
				</tr>
				<tr>
					<td align="center">网页描述</td>
					<td><textarea rows="10" cols="50" id="text2"></textarea>最多100个字</td>
				</tr>
			</table>
		</div>
		<div><input type="button" value="复制">点击按钮,可将上个文本框的内容复制到下个添加框内</div>
			<div style="background-color: pink">
			<table border="1" bordercolor="white"  cellspacing="0">
				<tr>
					<td width="300px" align="center">关键字</td>
					<td width="500px"><input type="text" id="key3"><select id="typeeee"></select>最多写32个字</td>
				</tr>
				<tr>
					<td align="center">网页标题</td>
					<td><input type="text" id="title3">最多写20个字</td>
				</tr>
				<tr>
					<td align="center">url地址</td>
					<td><input type="text" id="url3"></td>
				</tr>
				<tr>
					<td align="center">网页描述</td>
					<td><textarea rows="10" cols="50" id="text3"></textarea>最多100个字</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		function jump() {
			var sss;
			if($("#key1").val()!=null&&$("#key1").val()!=""){
				 sss=JSON.stringify({
						"key" : $("#key1").val(),
						"typee.t_id" : $("#typee").val(),
						"p_url" : $("#url1").val(),
						"p_title":$("#title1").val(),
						"p_text":$("#text1").val()
					});
				if($("#key2").val()!=null&&$("#key2").val()!=""){
					sss=sss+";"+JSON.stringify({
						"key" : $("#key2").val(),
						"typee.t_id" : $("#typeee").val(),
						"p_url" : $("#url2").val(),
						"p_title":$("#title2").val(),
						"p_text":$("#text2").val()
					});
					if($("#key3").val()!=null&&$("#key3").val()!=""){
						sss=sss+";"+JSON.stringify({
							"key" : $("#key3").val(),
							"typee.t_id" : $("#typeeee").val(),
							"p_url" : $("#url3").val(),
							"p_title":$("#title3").val(),
							"p_text":$("#text3").val()
						});
					}
				}
			}
			$("#pro").val(sss);
			$("#goall").submit();
// 			var sss=JSON.stringify({
// 					"key" : key,
// 					"p_url" : "3213"
// 				})+","+;
			//window.location.href="findprice?pro={'key' :"+ key+",'p_url' : '3213'}";
// 			$.ajax({
// 				type : "POST",
// 				contentType : 'application/json',
// 				url : 'findprice',
// 				data:sss,
// 				dataType : 'json',
// 				success : function(data){
// 				},
// 			});
// 			window.location.href="findprice?pro="+sss;
		}
	</script>
</body>
</html>