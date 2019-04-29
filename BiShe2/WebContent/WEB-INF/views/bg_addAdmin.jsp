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
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/dist/js/zui.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/css/style.css" />
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
								<li><a href="bg_index.html">首页</a></li>
                <li>></li>
                <li><a href="#">添加管理员</a></li>
								
						</ul>
			</div>
			<div class="main">
			
		<form id="form"> 
		<table class="table table-hover"id="table">
        <thead>
           <tr>
             <th></th>
             <th></th>
           </tr>
        </thead>
        
        <tbody>
          <tr>
            <td>管理员账号</td>
            <td>
             <div class="input-group">
                  <input type="text" id="adname" name="adname" class="form-control" placeholder="用户名">
               
              </div>
             </td>
          </tr>
          

        <tr>
          <td>密码</td>
          <td><input class="form-control form-focus" name="adpwd" id="adpwd" autofocus type="text" placeholder="输入密码"></td>
        </tr>
        <tr>
          <td>确认密码</td>
          <td><input class="form-control form-focus" id="adpwd1" autofocus type="text" placeholder="再次输入密码"></td>
        </tr>

      </tbody>

      <tfoot>
        <tr  style="text-align:right">
          <td></td>
           <td>
              <input class="btn btn-primary btn6 mr10" value="提交" type="button" id="submit">
              <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
           </td>
        </tr>
      </tfoot>
    </table>
    
    </form>
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p></div>
<script>navList(12);</script>

		<script src="${ctx}/js/zui.min.js"></script>
		<script type="text/javascript">
	    //读取table中的数据，并装成数组对象
	    //定义一个数组
			$(function() {
				var ctx = '${ctx}'; 
				$("#submit").click(function() {
					if (check() == true) {
						var formData = $("#form").serializeObject();
						$.ajax({
							url : ctx + "/admin/addAdmin",
							type : "post",
							data : JSON.stringify(formData),
							contentType : "application/json",
							success : function(data) {
							 alert(JSON.stringify(data));
								if(data.status == "success"){
									//window.location.href = ctx + "/student/bg_searchAdmin";
								}else{
									//window.location.href = ctx + "/admin/bg_addAdmin";
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
				var adname = $("#adname").val();
				var adpwd = $("#adpwd").val();
				var adpwd1 = $("#adpwd1").val();
				if (adname == null || adname == '' || adpwd == null
						|| adpwd == '' || adpwd1 == null || adpwd1 == '') {
					alert("用户名或者密码不能为空！");
					return false;
				} else {
					if (adpwd == adpwd1) {
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