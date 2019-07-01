<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-----------------------------------
-@data-time	2019?6?8?---??11:32:12
-@author	created by xiaohutuxian
-@IDE		eclipse
-@tomcat	9.0
-@jdk		1.8.0_161	
------------------------------------%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>机票预订后台管理系统</title>
</head>
<style>
.p2 {
	font-size: 25px;
	font-family: 仿宋;
}

body {
	background: url(images/bg.jpg) no-repeat center 0px;
	background-position: center 0;
	background-size: cover;
}
</style>
<script>
	function isValid() {
		if (nameform.id.value == "") {
			window.alert("您必须完成帐号的输入!");
			nameform.id.focus();
			return false;
		}

		if (nameform.password.value == "") {
			window.alert("您必须完成密码的输入!");
			nameform.password.focus();
			return false;
		}
	}
</script>
<body>
	<p class="p2"><b>欢迎使用后台管理系统</b><br/></p>
	<center>
		<div style="margin-top:150px;">
			<form action="../login" method=post name="nameform"
				onSubmit="return isValid(this);">
				<p class="p2">
					<b>用户名：</b><input type="text" name="id" value="" size="20"
						maxlength="18">
				</p>
				<p class="p2">
					<b>密&nbsp;&nbsp;码：</b><input type="password" name="password" value=""
						size="20" maxlength="18"><br />
					<br />
				</p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name=b1 type="submit" value="确定">&nbsp;&nbsp;&nbsp; 
				<input name=b2 type="reset" value="重置">
			</form>
		</div>
	</center>
</body>
</html>