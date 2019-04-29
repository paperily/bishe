<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="${ctx}/css/login.css"/>
		<title></title>
		<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
	</head>
<body bgcolor="#AEEEEE">
	<div id="one">	
		<!--中间内敛框架的变化部分 -->
		<div id="four_ifr">
		<div id="two_ifr">
			<div id="logo"><img src="${ctx}/img/logo.jpg"></div><!--logo的位置-->
			<div id="input">
				<div>&nbsp;</div>
				
				<form action="${ctx}/student/registe" id= "form" enctype="application/json" method="post" onsubmit="return check()">
					<div><input type="text" class="stuname" name="stuName"  placeholder="账号：" id="input_sizes"/></div><!--账号密码的位置-->
					<span ></span></br>
					<!-- <div><input type="text" name="stuname"  placeholder="用户名：" id="input_sizes"/></div> --><!--账号密码的位置-->
					<!-- <span ></span></br> -->
					<div><input type="password" class="stupwd" name="stuPwd" placeholder="密码：" id="input_sizes"/><div><!--账号密码的位置-->
					<span ></span></br>
					<div><input type="password" class="stupwd1"  placeholder="确认密码：" id="input_sizes"/><div><!--账号密码的位置-->
					<span ></span></br>
					<div>
						<input type="button" value="注册" id="submit"  class="input_position"/>
					</div>
				</form>
				
		 		<div id="fond_style">已有账号:&nbsp;<a href="${ctx}/student/index" target="box">登录</a></div>
		</div>
		</div>
		
		<script type="text/javascript">

			$(function() {
				var ctx = '${ctx}'; 
				$("#submit").click(function() {
					if (check() == true) {
						var formData = $("#form").serializeObject();
						$.ajax({
							url : ctx + "/student/registe",
							type : "post",
							data : JSON.stringify(formData),
							contentType : "application/json",
							success : function(data) {
								// alert(JSON.stringify(data));
								if(data.status == "success"){
									window.location.href = ctx + "/student/index";
								}else{
									
									window.location.href = ctx + "/student/register";
								}
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) {
								
							},
						})
					}

				});

			})

			$.fn.serializeObject = function() {
				var o = {};
				var a = this.serializeArray();
				$.each(a, function() {
					if (o[this.name]) {
						if (!o[this.name].push) {
							o[this.name] = [ o[this.name] ];
						}
						o[this.name].push(this.value || '');
					} else {
						o[this.name] = this.value || '';
					}
				});
				return o;
			}

			function check() {
				var stuname = $(".stuname").val();
				var stupwd = $(".stupwd").val();
				var stupwd1 = $(".stupwd1").val();
				if (stuname == null || stuname == '' || stupwd == null
						|| stupwd == '' || stupwd1 == null || stupwd1 == '') {
					alert("用户名或者密码不能为空！");
					return false;
				} else {
					if (stupwd == stupwd1) {
						alert("验证成功！");
						return true;
					} else {
						alert("两次输入不一致！");
						return false;
					}
				}
			}
		</script>
	</body>
</html>
