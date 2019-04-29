<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="com.bishe.entity.Student"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>详情页</title>   
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
		<!-- ZUI 标准版压缩后的 CSS 文件 -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="stylesheet" href="${ctx}/css/zui.min.css">
		<link rel="stylesheet" type="text/css" href="${ctx}/css/banner.css">
	    <link rel="stylesheet" href="${ctx}/css/amazeui.min.css">
	    <link rel="stylesheet" href="${ctx}/css/forum-public.css">
	    <link rel="stylesheet" type="${ctx}/text/css" href="css/content.css">
	    <link rel="stylesheet" type="${ctx}/text/css" href="css/banner.css">
	    <link rel="stylesheet" type="${ctx}/text/css" href="css/zui.min.css">
	    <link rel="stylesheet" href="${ctx}/css/forum-reset.css">
	    <link rel="stylesheet" href="${ctx}/css/forum-index.css">
	    <link rel="stylesheet" href="${ctx}/css/forum-review.css">
	    <link rel="stylesheet" href="${ctx}/css/com_style1.css">
	    <link rel="stylesheet" href="${ctx}/css/comment1.css">
	    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	    <script src="${ctx}/js/amazeui.min.js"></script>
	    <script src="${ctx}/js/zui.min.js"></script>
	    <script src="${ctx}/js/forum-public.js"></script>    
</head>
<body>
		<div class="container-fluid" style="background-color: #F9F8F7;">
			<div id="header">
                <!--logo-->
                <div id="logo">
                    <img src="${ctx}/images/logo.png"/>
                </div>
                <!--搜索框-->
                <div id="find">
                    <form action="${ctx }/course/searchFirstCourseList" id="searchForm" method="get">
                        <div class="input-group">
                            <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example" id="searchboxExample">
                                <input id="inputSearchExample3" type="search" name="search"  class="form-control search-input" value="备考经验"/>
                                <label for="inputSearchExample3" class="input-control-icon-left search-icon">
                                    <i class="icon icon-search" style="line-height: 2;"></i>
                                </label>
                            </div>
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="submit">搜索</button>
                            </span>
                        </div>
                    </form>                 
                </div>
                <!--定位-->
                <div id="locate">
                    <i class="icon icon-map-marker icon-2x" ></i>
                    <p id="address">[<a href="${ctx }/useraddress/toaddress" style="color:#3280fc; text-decoration: none;">切换地址</a>]</p>
                </div>
                <!--个人头像-->
                <div id="userPad">
                    <div id="myPhoto">
                       <img src="${ctx}/images/me.png" />
                    </div>
                    <div class="popover bottom" id="myPopover" style="top:7%;">
                        <div class="arrow"></div>
                            <h3 class="popover-title"><a href="${ctx }/user/person"><i class="icon icon-home"></i>&nbsp&nbsp个人中心</a></h3>
                            <div class="popover-content">
                                <ul>
                                    <li class="menu-li"><a href="${ctx }/user/person"><i class="icon icon-envelope"></i>&nbsp&nbsp我的消息</a></li>
                                    <li class="menu-li"><a href="${ctx }/user/person?address=1"><i class="icon icon-history"></i>&nbsp&nbsp我的足迹</a></li>
                                    <li class="menu-li"><a href="${ctx }/user/person?address=2"><i class="icon icon-check-board"></i>&nbsp&nbsp我的预约</a></li>
                                    <li class="menu-li"><a href="${ctx }/user/person?address=3"><i class="icon icon-star"></i>&nbsp&nbsp我的收藏</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--导航条-->
                <div id="navigation">
                    <ul class="nav nav-secondary">
                        <li><a href="index.html" class="nav-a">首页</a></li>
                        <li><a href="progress.html" class="nav-a">复习进度</a></li>
                        <li><a href="forum-articles.html" class="nav-a">论坛 </a></li>
                        <li><a href="forum-edit.html" class="nav-a">写文章 </a></li>
                    </ul>
                </div>
            </div>
            <script>
             /* $(document).ready(function(){
                 $("#myPhoto").hover(function(){
                    $("#myPopover").toggle();
                 });
              });
              $(document).ready(function(){
                 $("#myPopover").hover(function(){
                    $("#myPopover").show();
                 });
                 $("#myPopover").mouseleave(function(){
                    $("#myPopover").hide();
                 });
              }); */
            
        </script> 
		</div>
<!-- 文章详情 -->
<div class="am-g am-container">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-8">
        <div class="newstitles">
        
            <br/><br/><br/>
            <p>清晨第一天</p>
            <br/><br/>
            <span>作者：马小平</span> &nbsp; &nbsp;
            <span> 时间：2019/01/20 </span>&nbsp; &nbsp;<span>赞：300</span>
        </div>
        <div class="contents">
            <br/><br/>
            <font class="con">
一、考研复习计划第一阶段

从现在起，到明年4月，基础学习期。

1、学英语，2小时。背单词，学语法【不同于四六级】，精读训练。

2、数学，1-1.5小时。看本科期间的基础教材，同济高数、清华大学线性代数、浙大概率与数理统计。寒假前都看完，课后题做1/2-1/3习题。不要做太多题。

3、院校专业选择。能早选就早选。

4、全年规划。清空各项活动，清理时间。精神食粮储备!坚持不下来的时候，励志的书、电影、杂志。收集考研信息，写考研日记——录音日记、立志豪言。

考研周期：亢奋期：现在到明年3月，每天亢奋，拼命想考研。

平淡期：3-7月学就会，不学就是不会。

迷茫期：7-10月量变到质变的飞跃。状态不佳，怎么突破。

平静期：10月飞跃，来状态了。

●4月1日-6月1日，基础学习期2：

英语2小时：1小时单词，1小时阅读训练。

数学1.5小时：看标准复习全书。前提：看完教材!!!做题基础550题。

每天1小时专业课。

建议亲临目标院校复试现场，收集考研复试信息：1.记录考题，可能有用于初试。2.在现场多找找师哥师姐，套近乎。3.收集信息，如报录比、考试科目、收集考研真题和复习参考资料。


</font><br/><br/>
            <p dir="ltr"id="theme">            
            	<span>
            	<a href="#">
	            	<c:forEach items="${hotsopts}" var="p">
	           			主题
	           		 </c:forEach>
           		 </a>            	</span>           
            </p>
            <!-- <p dir="ltr" style="text-align: justify;"><font color="#585858" face="arial, microsoft yahei, 宋体">本文转自XXX</font></p> -->
        </div>
    </div>
    <div class="am-u-sm-0 am-u-md-0 am-u-lg-4">
        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
            <h2 class="am-titlebar-title ">
                相关推荐
            </h2>
            <nav class="am-titlebar-nav">
                <a href="#more">more &raquo;</a>
            </nav>
        </div>

        <div data-am-widget="list_news" class="am-list-news am-list-news-default right-bg">
            <ul class="am-list"  >
            <c:forEach items="${relist}" var="k" begin="0" end="2">
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">


                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="http://www.douban.com/online/11624755/">文章名文章名</a></h3>

                        <div class="am-list-item-text"></div>
                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />   
              </c:forEach>             
            </ul>
        </div>

    </div>
    </div>
</div>

<!-- 用户评论区 -->
<div class="commentAll">
    <!--评论区域 begin-->
    
    <form id="form">
    
		<input type="hidden" name="articleid" value="1"/><!-- 需要改成获取当前articleid -->
		<input type="hidden" name="articleName" value="2"/><!-- 需要改成获取当前 articleName-->
	    <div class="reviewArea clearfix">
	        <textarea class="content comment-input" name = "description" placeholder="撰写评论&hellip;" id="userbb" onkeyup="keyUP(this)"></textarea>
	        <button id="submit" type="button" class="plBtn" >评论</button>
	    </div>
    </form>
    <script type="text/javascript">
    
    $(function() {
		var ctx = '${ctx}'; 
		$("#submit").click(function() {
			if (check() == true) {
				var formData = $("#form").serializeObject();
				$.ajax({
					url : ctx + "/comment/comment",
					type : "post",
					data : JSON.stringify(formData),
					contentType : "application/json",
					success : function(data) {
						// alert(JSON.stringify(data));
						if(data.status == "success"){
							alert("评论成功！");
						}else{
							alert("评论失败，请重试！");
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
		var stuname = $("#userbb").val();
		if (stuname == null || stuname == '' ) {
			alert("请输入评论！");
			return false;
		} else {
				return true;
		}
	}
    
    
    
    
    </script>
    
    
    
    
    
    
    
    <!--评论区域 end-->
  <!--回复区域 begin-->
    <div class="comment-show">
      <c:forEach items="${superComment}" var="p">
        <div class="comment-show-con clearfix">
            <div class="comment-show-con-img pull-left">
                <img src="images/logo.png">
            </div>
            <div class="comment-show-con-list pull-left clearfix">
                <div class="pl-text clearfix">
                    <a href="#" class="comment-size-name">用户名</a>:
                    <span class="my-pl-con">&nbsp;回复回复回复</span>
                </div>   
                <div class="date-dz-right pull-right comment-pl-block"> 
                			<a href="javascript:;" class="removeBlock" id="${p.comment.comId }">删除</a> 
                			<a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> 
                			<a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> 
                		</div>              
                <div class="hf-list-con"></div>
                <!--回复块-->
                <div class="all-pl-con">
                	<div class="pl-text hfpl-text clearfix">
                		<a href="#" class="comment-size-name">用户名</a>
                		</div>
                	<div class="date-dz"> <span class="date-dz-left pull-left comment-time">回复回复回复</span> 
                		<div class="date-dz-right pull-right comment-pl-block"> 
                			<a href="javascript:;" class="removeBlock" id="${p.answer.anId }">删除</a> 
                			<a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> 
                			<a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> 
                		</div> 
                	</div>
                </div>
            </div>           
        </div>
      </c:forEach>  
    </div>
    <!--回复区域 end-->
</div>



<!-- 页面底部 -->
<footer>
    <div class="content-1">
        <ul class="am-avg-sm-5 am-avg-md-5 am-avg-lg-5 am-thumbnails">
            <li><a href="#">联系我们</a></li>
            <li><a href="#">加入我们</a></li>
            <li><a href="#">合作伙伴</a></li>
            <li><a href="#">广告及服务</a></li>
            <li><a href="#">友情链接</a></li>
        </ul>
        <p>Amaze UI出品<br>© 2016 AllMobilize, Inc. Licensed under MIT license. Developed with WebStorm.</p>
    </div>
</footer>
</body>