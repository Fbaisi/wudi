<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
</head>
<body>
<script type="text/javascript" src="res/jquery-3.2.1.js"></script>
<script type="text/javascript">
function moveht() {
	$(".isokna").html("ok");
	$(".isokna").hide();
}
function isokname() {
	var unamee = $("#uname").val();
	if (unamee == null || unamee == "") {
		$(".isokna").show();
		$(".isokna").html("账户不可为空")
	} else {
		$.ajax({
			type : "POST",
			contentType : 'application/json',
			url : 'findbyname',
			data : uname = unamee,
			dataType : 'json',
			success : function(data) {
				if (data.num == "1") {
					$(".isokna").show();
					$(".isokna").html("用户名已注册")
				}
			},
			error : function() {
				alert("error")
			}
		});
	}
}
function isok() {
	if($("#upassword").val()!=$("#upasswordd").val()){
		$(".isokmima").show();
		$(".isokmima").html("两次密码不一致");
	}else{
		$("#isokmima").html("ok");
		}
}
function hid() {
	$(".isokmima").html("");
	$(".isokmima").hide();
}
function panduan() {
	var unamee = $("#uname").val();
	if (unamee == null || unamee == "") {
		$(".isokna").show();
		$(".isokna").html("用户名不可为空")
	} else {
		if ($(".isokna").html() == "ok") {
		$("#mid").submit();
		}else{
			$(".isokmima").show();
			$(".isokmima").html("两次密码不一致");
		}
	}
}
</script>
	<div align="center">
		<img alt="百度" src="res/img/baidu.png">
	</div>
	<div align="center">
		<div>
			<font color="blue"><h2>用户注册</h2></font>
		</div>
		<div>
			<form action="adduser" method="post" id="mid">
				<b>用户名</b>:<input type="text" id="uname" name="uname"
					onclick="moveht()" onblur="isokname()" required="required"><font
					class="isokna"></font><br> <br> 
					<b>公司名称:</b><input type="text" name="factoryname"><br> <br> 
					<b>公司税号:</b><input type="text" name="factorynum"><br> <br> 
					<b>密码</b>:<input type="password" id="upassword" name="upassword"><br> <br> 
					<b>确认密码</b>:<input type="password" id="upasswordd" name="upasswordd"
					onblur="isok()" onclick="hid()"><font
					class="isokmima"></font><br> <br>
					<input onclick="panduan()" type="button" name="btn" value="注 &nbsp册"               style="background:url(res/img/blue.png);             border-style:none;                width:124px;                height:35px;                background-repeat:no-repeat;"               >
			</form>
		</div>
	</div>
</body>

</html>