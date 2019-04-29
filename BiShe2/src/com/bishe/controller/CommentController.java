package com.bishe.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bishe.entity.Comment;
import com.bishe.entity.Student;
import com.bishe.entity.pojo.CommentPojo;
import com.bishe.service.CommentServiceImpl;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Resource
	private CommentServiceImpl commentServiceImpl;

	/**
	 * 首页跳转
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/home")
	public String home() throws Exception {
		return "forum-article";
	}

	/**
	 * 用户评论
	 * 
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> comment(HttpServletRequest request, @RequestBody CommentPojo comm) {
		Map<String, String> result = new HashMap<String, String>();
		try {
			Student s = (Student) request.getSession().getAttribute("student");
			Comment comment = new Comment();
			comment.setStuId(s.getstuId());
			comment.setStuName(s.getstuName());
			comment.setArticleid(comm.getArticleid());
			comment.setDate(new Date());
			comment.setArticleName(comm.getArticleName());
			comment.setDescription(comm.getDescription());
			int id = 0;
			id = commentServiceImpl.saveComment(comment);
			if (id == 0) {
				result.put("status", "error");
			} else {
				result.put("status", "success");
			}
		} catch (Exception e) {
			result.put("status", "error");
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 评论分页查询接口
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/comment")
	@ResponseBody
	public Map<String, Object> stucom(String search,Integer page,Integer recPerPage) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		List<Comment> list = commentServiceImpl.findPageByProperty(search, 0, page, recPerPage);
		long recTotal = commentServiceImpl.findCount4PageBySql(search, 0);
		result.put("result", "success");
		result.put("data", list);
		Map<String, Object> pager = new HashMap<String, Object>();
		pager.put( "page", page);
		pager.put("recTotal", recTotal);
		pager.put("recPerPage", recPerPage);
		result.put("pager",pager);
		return result;
	}	

}
