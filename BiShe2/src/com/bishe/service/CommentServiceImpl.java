package com.bishe.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.bishe.dao.CommentDaoImpl;
import com.bishe.dao.StuDaoImpl;
import com.bishe.entity.Comment;
import com.bishe.entity.Student;


@Service
@Transactional(readOnly=false)
public class CommentServiceImpl {

	@Resource
	private CommentDaoImpl commentDaoImpl;
	
	public int saveComment(Comment u) throws Exception{
		this.commentDaoImpl.saveComment(u);
		return u.getId();
	}
	/**
	 * 分页查询
	 */
	public List<Comment>  findPageByProperty(String articleName,Integer stuId,Integer pageNum,Integer pageSize) throws Exception {
		String hql = "from Comment c where 1 = 1 ";
		List<Object> list = new ArrayList<Object>();
		if(!StringUtils.isEmpty(articleName)){ // null "" 
			// 用户姓名不为空，加入查询条件
			hql += "and c.articleName like ?";
			list.add("%"+ articleName + "%");
		}
		if(stuId != null && stuId != 0){
			// 用户ID不为空，加入查询条件
			hql += "and c.stuId = ?";
			list.add(stuId+"");
		}
		List<Comment> slist = commentDaoImpl.find4PageByProperty(pageNum, pageSize, hql, list.toArray());// null
		return slist;
	}

		public long findCount4PageBySql(String articleName, Integer stuId) throws Exception {
			String sql = "select count(1) from comment c where 1 = 1 ";
			List<Object> list = new ArrayList<Object>();
			if(!StringUtils.isEmpty(articleName)){ // null "" 
				// 用户姓名不为空，加入查询条件
				sql += "and c.articleName like ?";
				list.add("%"+ articleName + "%");
			}
			if(stuId != null && stuId != 0){
				// 用户ID不为空，加入查询条件
				sql += "and c.stuId = ?";
				list.add(stuId+"");
			}
			return commentDaoImpl.findCount4PageBySql( sql,list.toArray());
		}
		
	}
	

