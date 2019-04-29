<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="${ctx}/js/zui.min.js"></script>
<!-- ZUI Javascript组件 -->
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课兜后台管理系统</title>
<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="${ctx}/dist/css/zui.min.css">

<!-- ZUI Javascript 依赖 jQuery -->
<script src="${ctx}/dist/lib/jquery/jquery.js"></script>
<!-- ZUI 标准版压缩后的 JavaScript 文件 -->
<script src="${ctx}/dist/js/zui.min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx}/css/style.css" />
<script type="text/javascript" src="${ctx}/js/menu.js"></script>
<link href="${ctx}/dist/lib/datagrid/zui.datagrid.min.css"
	rel="stylesheet">
<script src="${ctx}/dist/lib/datagrid/zui.datagrid.min.js"></script>
<script type="text/javascript">
	var ctx = '${ctx}';
	$(document).ready(function() {
		//这是定义的静态数组 传回数据是按照如下格式传回即可
		var myDataGrid = $('#datagridExample').datagrid({
			dataSource : {
				cols : [ {
					name : 'stuId',
					label : '账号',
					width : 109
				}, {
					name : 'stuName',
					label : '昵称',
					width : 132
				}, {
					name : 'stuPwd',
					label : '密码',
					width : 134
				}, ],
				remote : function(params) {
					return {
						// 原创请求地址
						url : ctx + '/student/user/page',
						// 请求类型
						type : 'GET',
						// 数据类型
						dataType : 'json'
					}

				}
			},
			//特殊列的参数
			configs : {
				C0 : {
					className : 'text-left',
					style : {

						color : '#00b8b4',
					}
				}
			},
			rowDefaultHeight : 50,
			//分页
			states : {
				pager : {
					page : 1,
					recPerPage : 20
				}
			},

			//排序开关
			sortable : true,
			// checkbox
			checkable : true,
			checkByClickRow : true,
			
			searchFunc :{
				params:{
					search: $("#inputSearchExample2").val()
				}
			}

		});
	});
	
	$("#searchBtn").click = function(){
		var searchStr = $("#inputSearchExample2").val();
		myDataGrid.search(searchStr);
	}
	
</script>


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
					<li style="margin-left: 25px;">您当前的位置：</li>
					<li><a href="#">首页</a></li>
					<li>></li>
					<li><a href="#">查看用户</a></li>
				</ul>
			</div>
			<div class="main">
				<div>
					<div id="datagridExample" class="datagrid datagrid-borderless">
						<div
							class="input-control search-box search-box-circle has-icon-left has-icon-right"
							id="searchboxExample2" style="margin-bottom: 10px">
							<div
								class="input-control search-box search-box-circle has-icon-left has-icon-right"
								style="max-width: 300px">
								<input id="inputSearchExample2" type="search"
									class="form-control search-input" placeholder="搜索">
									 <label
									for="inputSearchExample2"
									class="input-control-icon-left search-icon">
									<i class="icon icon-search"></i></label> 
									<a href="#" id= "searchBtn"	class="input-control-icon-right search-clear-btn">
									<i class="icon icon-remove"></i></a>
							</div>

							<div class="div1"
								style="position: absolute; right: 0px; top: 0px">
								<div class="btn-group">
									<button type="button" class="btn">通过审核</button>
									<button type="button" class="btn">锁定</button>


								</div>
							</div>
						</div>

						<div class="datagrid-container"></div>
						<div class="pager"></div>
						<div class="btn-group"></div>
					</div>
				</div>

			</div>
		</div>
		<div class="bottom"></div>
		<div id="footer">
			<p>Copyright© 2015 版权所有</p>
		</div>
		<script>
			/* navList(12); */
		</script>
	</div>
</body>
</html>
