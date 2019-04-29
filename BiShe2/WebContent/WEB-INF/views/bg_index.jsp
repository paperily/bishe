<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课兜后台管理系统</title>
<link rel="stylesheet" href="${ctx}/dist/css/zui.min.css">
<script src="${ctx}/dist/lib/jquery/jquery.js"></script>
<script src="${ctx}/dist/js/zui.min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx}/css/style.css" />
<script type="text/javascript" src="${ctx}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/js/menu.js"></script>
</head>

<body>
<div class="top"></div>
<div id="header">
	<div class="logo">课兜后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="">Tony</a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			<li><a href="">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
    <ul id="nav_dot">
      <li>
          <h4 class="M1"><i class="icon icon-user">&nbsp;&nbsp;</i>用户管理</h4>
          <div class="list-item none">
            <a href='${ctx}/admin/bg_addAdmin'>添加管理员</a>
            <a href='${ctx}/admin/bg_editUser'>修改用户信息</a>
            <a href='${ctx}/admin/bg_searchUser'>查看用户列表</a>
            <a href='${ctx}/admin/bg_searchAdmin'>查看管理员列表</a>
          </div>
        </li>


        <li>
          <h4 class="M4"><i class="icon icon-align-left">&nbsp;&nbsp;</i>学习章节管理</h4>
          <div class="list-item none">
            <a href='bg_addClassType.html'>添加学习章节</a>
            <a href='bg_editClassType.html'>修改学习章节</a>
            <a href='bg_searchClassType.html'>查看学习章节列表</a>
         
          </div>
        </li>
        <li>
          <h4 class="M5"><i class="icon icon-book">&nbsp;&nbsp;</i>评论管理</h4>
          <div class="list-item none">            
            <a href='bg_searchClass.html'>查看评论列表</a>
          </div>
        </li>
        <li>
          <h4  class="M6"><i class="icon icon-newspaper-o">&nbsp;&nbsp;</i>文章管理</h4>
          <div class="list-item none">
            <a href='bg_addBulletin.html'>添加文章</a>
            <a href='bg_searchBulletin.html'>操作</a>
          </div>
        </li>        
  </ul>
		</div>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="#">首页</a></li>
								
						</ul>
			</div>
			<div class="main">
				
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©</p></div>
<script>navList(12);</script>
</body>
</html>
