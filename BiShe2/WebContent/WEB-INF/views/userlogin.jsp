<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>index</title>
	<meta charset="utf-8" />
 	<link rel="stylesheet" type="text/css" href="${ctx}/css/login.css"/>	
</head>
<body bgcolor="#AEEEEE">
	<div id="one">	
		<!--中间内敛框架的变化部分 -->
		<div id="four_ifr">

			<div id="two_ifr">
				<div id="logo">
					<img src="${ctx}/img/logo.jpg">
				</div>
				<!--logo的位置-->
				<div id="input">
					<div>&nbsp;</div>
					<form action="${ctx}/student/login" method="post"><!-- action="" 提交表单跳转的URL -->
						<div>
							<input type="text" name="userName" placeholder="请输入账号" id="input_size" />
						</div>
						<!--账号密码的位置-->
						<span></span></br> <span></span></br>
						<div>
						<input type="password" name="password" placeholder="请输入密码" id="input_size" />
						<div>
						<!--账号密码的位置-->
						<span></span></br> <span></span></br>
						<div>
							<input type="submit" value="登录" class="input_position" />
						</div>
					</form>
					<div id="fond_style">
						没账号:&nbsp;<a href="${ctx}/student/register" target="box">注册</a>
					</div>
				</div>
			</div>

		</div>	
	</div>
</body>
</html>