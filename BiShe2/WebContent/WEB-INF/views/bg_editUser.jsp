<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.bishe.entity.Admin"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>	
<script src="${ctx}/js/zui.min.js"></script><!-- ZUI Javascript组件 -->

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课兜后台管理系统</title>
<link rel="stylesheet" href="${ctx}/dist/css/zui.min.css">
<script src="${ctx}/dist/lib/jquery/jquery.js"></script>
<script src="${ctx}/dist/js/zui.min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx}/css/style.css" />

<script type="text/javascript" src="${ctx}/js/menu.js"></script>

</head>
		<script type="text/javascript">

			$(function() {
				var ctx = '${ctx}'; 
				$("#submit").click(function() {
					if (check() == true) {
						var formData = $("#form").serializeObject();
						$.ajax({
							url : ctx + "/admin/createAdmessage",
							type : "post",
							data : JSON.stringify(formData),
							contentType : "application/json",
							success : function(data) {
								// alert(JSON.stringify(data));
								if(data.status == "success"){
									alert(data.message);
								}else{
									alert(data.message);
									window.location.href = ctx + "/admin/createAdmessage";
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
				var adname = $("#adname").val();
				var adpwd = $("#adpwd").val();
			
				if (adname == null || adname == '' || adpwd == null
						|| adpwd == '' ) {
					alert("用户名或者密码不能为空！");
					return false;
				} else {
					
						alert("验证成功！");
						return true;
					
					}
				}				


		</script>
<body>
<div class="top"></div>
<div id="header">
	<div class="logo">课兜后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="">${sessionScope.admin.adname}</a></li>
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
								<li><a href="#">修改用户详情</a></li>
						</ul>
			</div>
			<div class="main">
        
              <div class="input-group">
            <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
              <input id="inputSearchExample3" type="search" class="form-control search-input" placeholder="搜索">
                <label for="inputSearchExample3" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
            </div>
            <span class="input-group-btn">
              <button class="btn btn-primary" type="button">搜索</button>
            </span>
          </div>			  
 <form id="form" action="/admin/createAdmessage" method="post">
          <table class="table table-hover">
        <thead>
           <tr>
             <th></th>
             <th></th>
           </tr>
        </thead>
       
        <tbody>
          <tr>
            <td>用户名</td>
            <td>
              <input type="text" class="form-control" name="adname" id="adname" placeholder="${sessionScope.admin.adname}">
             </td>
          </tr>

          <tr>
            <td>密码</td>
            <td>
              <input type="password" class="form-control" id="adpwd" name="adpwd" placeholder="${sessionScope.admin.adpwd}">
             </td>
          </tr>

      </tbody>
      <tfoot>
        <tr  style="text-align:right">
          <td></td>
           <td>
              <input class="btn btn-primary btn6 mr10" value="修改" id="submit" type="button">
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
<div id="footer"><p>Copyright©</p></div>
<script>navList(12);</script>
</body>
</html>

