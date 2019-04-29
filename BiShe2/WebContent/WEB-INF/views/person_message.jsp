<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.bishe.entity.Student"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<% 
   Student stu = (Student)session.getAttribute("student"); 
    String stuName = "";
      if(stu != null ){
	   stuName = stu.getstuName();
    }
    int examyear =stu.getExamyear();
    String school=stu.getSchool();
    String profession=stu.getProfession();
    String direction=stu.getDirection();
    String description=stu.getDescription();
    
    //  out.println("session 中的用户名："+stuName);
%>
		<link rel="stylesheet" type="text/css" href="${ctx}/css/index.css"/>
		<script type="text/javascript" src="${ctx}/js/jquery-2.2.0.min.js"></script>

	<body>
		<div class="body">

			<div class="text">个人信息</div>
			<hr class="hr"/>
			<div class="person_name">
				<div class="name_left">用户名</div>
				<!-- 
					学习EL表达式用法
					jsp 9大内置对象
					Jquery 使用方法
				 -->
				<div class="name_right"><span id="stuName">${sessionScope.student.stuName}</span>
				
				</div>

                  </div>
			<div class="person_name">
				<div class="name_left">考试年份</div>
				<div class="name_right"><span id="examyear"></span></div>
			
			</div>

			<div class="person_name">
				<div class="name_left">目标学校</div>
				<div class="name_right"><span id="school"></span></div>
		
			</div>
			<div class="person_name">
				<div class="name_left">报考专业</div>
				<div class="name_right"><span id="profession"></span></div>
			</div>
			<div class="person_name">
				<div class="name_left">报考方向</div>
				<div class="name_right"><span id="direction"></span></div>
				<script type="text/javascript">
				$(function(){
					var stuName = '';
					stuName = "<%=stuName%>";
					//alert("用户名："+stuName);
					//$("#stuName").text(stuName);					
					var profession = "<%=profession%>";
					$("#profession").text(profession);					
					var examyear = "<%=examyear%>";
					$("#examyear").text(examyear);		
					var school = "<%=school%>";
					$("#school").text(school);					
					var description = "<%=description%>";
					$("#description").text(description);					
					var direction = "<%=direction%>";
					$("#direction").text(direction);						
				});

				</script>					
			</div>						
			<div class="person_name">
				<div class="name_left">个人描述</div>
				<div class="name_right"><span id="description"></span></div>			
			</div>	

			

	</body>
	<script>
		window.onload=function(){
			/* var bton=document.getElementById("buton");//获取button按钮
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
				} */

			
		}
		
	</script>
</html>
