<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- ZUI Javascript组件 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
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
					name : 'articleName',
					label : '帖子名',
					width : 109
				},{
					name : 'description',
					label : '我的评论',
					width : 134
				}, ],
				remote : function(params) {
					return {
						// 原创请求地址
						url : ctx + '/comment/user/comment',
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
		});
	});
	
</script>
		
	</head>
	<body>
			<div class="text">我的回复</div>
			<hr class="hr"/>	
					<div id="datagridExample" class="datagrid datagrid-borderless">
						<div
							class="input-control search-box search-box-circle has-icon-left has-icon-right"
							id="searchboxExample2" style="margin-bottom: 10px">

						</div>

						<div class="datagrid-container">
						
						</div>
						<div class="pager"></div>
						<div class="btn-group"></div>
					</div>
		 <ul class="pager"style="margin-left: 30%;" data-ride="pager" data-page="2" data-rec-total="29">
		 
		 </ul>	
		<script>
		</script>
	</body>
</html>
