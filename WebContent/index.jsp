<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="res/jquery-3.2.1.js"></script>
</head>
<body>
	<script type="text/javascript">
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
					data : JSON.stringify({
						"uname" : unamee
					}),
					dataType : 'json',
					success : function(data) {
						if (data.num == "0") {
							$(".isokna").show();
							$(".isokna").html("账户不存在")
						}
					},
					error : function() {
						alert("error")
					}
				});
			}
		}
		function isoknameandps() {
			var unamee = $("#uname").val();
			var upasswordd = $("#upassword").val();
			$.ajax({
				type : "POST",
				contentType : 'application/json',
				url : 'findbynameandps',
				data : JSON.stringify({
					"uname" : unamee,
					"upassword" : upasswordd
				}),
				dataType : 'json',
				success : function(data) {
					if (data.num == "0") {
						$(".isokmima").show();
						$(".isokmima").html("密码是假的");
					}
				}
			})
		}
		function onbutton() {
			var unamee = $("#uname").val();
			if (unamee == null || unamee == "") {
				$(".isokna").show();
				$(".isokna").html("账户不可为空")
			} else {
				var upasswordd = $("#upassword").val();
				if (upasswordd == null || upasswordd == "") {
					$(".isokmima").show();
					$(".isokmima").html("密码不可为空")
				} else {
					if ($(".isokna").html() == "ok"
							&& $(".isokmima").html() == "ok") {
						$("#mid").submit();
					}
				}
			}
		}
		function moveht() {
			$(".isokna").html("ok");
			$(".isokna").hide();
		}
		function movehtml() {
			$(".isokmima").html("ok");
			$(".isokmima").hide();
		}
		function jumpreg() {
			window.location.href="regis.jsp";
		}
	</script>
	<div align="center">
		<img alt="百度" src="res/img/baidu.png">
	</div>
	<div align="center">
		<div>
			<font color="blue"><h2>用户登录</h2></font>
		</div>
		<div>
			<form action="userlog" method="post" id="mid">
				<b>用户名</b>:<input type="text" id="uname" name="uname"
					onclick="moveht()" onblur="isokname()" required="required"><font
					class="isokna"></font><br> <br> <b>密码</b>:<input
					type="password" id="upassword" name="upassword"
					onclick="movehtml()" onblur="isoknameandps()"><font
					class="isokmima"></font><br> <br> <input type="button"
					value="返回首页"><input type="button" value="找回密码"><input
					type="button" value="登录" onclick="onbutton()"><input
					type="button" onclick="jumpreg()" value="新用户注册"><a herf="#">收藏本站</a>
			</form>
		</div>
	</div>
</body>
</html>