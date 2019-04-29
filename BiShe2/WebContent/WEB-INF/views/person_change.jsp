<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.bishe.entity.Student"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>个人资料修改</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/index.css"/>
	<script type="text/javascript" src="${ctx}/js/jquery-2.2.0.min.js"></script>
	<%-- <script type="text/javascript" src="${ctx}/js/jquery.mobile-1.4.5.min.js"></script> --%>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/zui.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/css/banner.css">
	<script src="${ctx}/js/zui.min.js"></script>
	<script src="${ctx}/js/zui.uploader.min.js"></script>


	<!-- 
		1、表单录入信息，传递到后台
		2、session 中取到id (传递到后台)
		3、通过id修改数据（Controller -> service -> dao）
		3、跳转页面			
	 -->

</head>
		<script type="text/javascript">

			$(function() {
				var ctx = '${ctx}'; 
				$("#submit").click(function() {
					if (check() == true) {
						var formData = $("#form").serializeObject();
						$.ajax({
							url : ctx + "/student/createMessage",
							type : "post",
							data : JSON.stringify(formData),
							contentType : "application/json",
							success : function(data) {
								// alert(JSON.stringify(data));
								if(data.status == "success"){
									alert(data.message);
									parent.location.href = ctx + "/student/person";
								}else{
									alert(data.message);
									window.location.href = ctx + "/student/createMessage";
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
				// 非空，用户名： 字母、数字、下划线组合 ,数字不能开头，
				// 特殊字符 、字母、数字、下划线组合
				var stuname = $("#stuName").val();
				var stupwd = $("#stuPwd").val();
			
				if (stuname == null || stuname == '' || stupwd == null
						|| stupwd == '' ) {
					alert("用户名或者密码不能为空！");
					return false;
				} else {
					
						alert("验证成功！");
						return true;
					
					}
				}				


		</script>
<body>
	<div class="body"height="1000px">

		<div class="text">个人信息</div>
		<hr class="hr"/>

		<form class="form-horizontal" role="form"  id="form" action="/student/createMessage" method="post" style="height=800px">

			<div class="form-group">
				<label for="exampleInputAccount4" class="col-sm-2">账号</label>
				<div class="col-md-6 col-sm-10">
					<input type="text" class="form-control" id="stuName" name="stuName" value= "${sessionScope.student.stuName}">
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword4" class="col-sm-2">密码</label>
				<div class="col-md-6 col-sm-10">
					<input type="password" class="form-control" id="stuPwd" name="stuPwd" placeholder="密码"value= "${sessionScope.student.stuPwd}">
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputAddress1" class="col-sm-2">考研年份</label>
				<div class="col-sm-3">
					<select class="form-control" id="examyear" name="examyear">
						<option>  ${sessionScope.student.examyear}</option>
						<option>2020</option>
						<option>2021</option>
						<option>2022</option>        
					</select>
				</div>
			</div>  
			<div class="form-group">
				<label for="exampleInputAddress1" class="col-sm-2">数学类型</label>
				<div class="col-sm-3">
					<select class="form-control" id="math" name="math">
					<option> ${sessionScope.student.math}</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
					</select>
				</div>

			</div>
			<div class="form-group">
				<label for="exampleInputAddress1" class="col-sm-2">英语类型</label>
				<div class="col-sm-3">
					<select class="form-control" id="english" name="english">
					<option> ${sessionScope.student.english}</option>
						<option>1</option>
						<option>2</option>
					</select>
				</div>

			</div>	
			<div class="form-group">
				<label for="exampleInputAccount4" class="col-sm-2">政治</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="policy" name="policy" value= "${sessionScope.student.policy}"placeholder="政治">
				</div>
								<label for="exampleInputAccount4" class="col-sm-2">专业课</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="professional" name="professional" value= "${sessionScope.student.professional}"placeholder="专业课">
				</div>	
			</div>			

								
			<div class="form-group">
				<label for="exampleInputAddress1" class="col-sm-2">目标院校</label>
				<div class="col-sm-3">
					<select class="form-control" id="school" name="school">
					<option> ${sessionScope.student.school}</option>
						<option>河北师范大学</option>
						<option>河北大学</option>
						<option>河北科技大学</option>
					</select>
				</div>
				
				<div class="col-sm-3">
					<input type="text" class="form-control" id="profession" name="profession"placeholder="报考专业"value= "${sessionScope.student.profession}">
				</div>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="direction" name="direction" value= "${sessionScope.student.direction}"placeholder="报考方向">
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword5" class="col-sm-2">个人描述</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="description" id="description" value= "${sessionScope.student.description}">
				</div>
			</div>
					
			<div id="uploaderExample" class="uploader">
				<div class="file-list" data-drag-placeholder="请拖拽文件到此处"></div>
				<button type="button" class="btn btn-primary uploader-btn-browse"><i class="icon icon-cloud-upload"></i> 选择文件</button>
			</div>
			<div class="form-group"style="position: absolute;left:500px;top:500px;">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" id="submit" class="btn btn-default">提交</button>
				</div>
			</div>
			<input  type="hidden" id="head" name="head" value= "">

		</form>

	</body>
<script>
var ctx = '${ctx}'; 
var uploader = $('#uploaderExample').uploader({
    autoUpload: true,            // 当选择文件后立即自动进行上传操作
    url: ctx + "/student/upload",  // 文件上传提交地址
    onUploadFile: function(file) {
        console.log('上传成功', file.name);
        $("#head").val(file.name);
        head
     }
});


/* 回调函数参数定义如下：
file：上传进度发生变化的文件对象；
responseObject：服务器返回的信息对象，包含如下属性：
response：服务器返回的文本信息；
responseHeaders：服务器返回的头部信息；
status：HTTP 状态码，例如 200。 */
	/* uploader.onFileUploaded(file, responseObject){
		
	} */


</script>
	<!-- <script>

		window.onload=function(){
			var bton=document.getElementById("buton");//获取button按钮
			bton.onclick=function(){
				//获取页面高度和宽度
				var sHeight=document.documentElement.scrollHeight;
				var sWidth=document.documentElement.scrollWidth;
				
				//可是区域的高度和宽度
				var wHeight=document.documentElement.clientHeight;
				
				var oMask=document.createElement("div");
				oMask.id="mask";
				oMask.style.height=sHeight+"px";
				oMask.style.Width=sWidth+"px";
				document.body.appendChild(oMask);
				var oLogin=document.createElement("div");
				oLogin.id="messagechange";
				oLogin.innerHTML="<div id='message'><div id='close'></div></div>"	
				document.body.appendChild(oLogin);
				//获取login的高度和宽度
				var dHeight=oLogin.offsetHeight;
				var dWidth=oLogin.offsetWidth;
				oLogin.style.left=(sWidth-dWidth)/2+"px";
				oLogin.style.top=(wHeight-dHeight)/2+"px";	
				
				var oClose=document.getElementById("close");
				oMask.onclick=oClose.onclick=function(){
					document.body.removeChild(oMask);
					document.body.removeChild(oLogin);
				}
			}

			
		}
 -->		
	</script>
	</html>
