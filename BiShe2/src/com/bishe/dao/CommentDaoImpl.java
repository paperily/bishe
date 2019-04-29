package com.bishe.dao;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.bishe.entity.Comment;
import com.bishe.entity.Student;
import com.bishe.dao.BaseDao;

@Repository
public class CommentDaoImpl extends BaseDao<Comment> {
	@Resource
	private SessionFactory sessionFactory;

	public int saveComment(Comment c) throws Exception {
		SessionFactory sessionFactory = super.getSessionFactory();
		sessionFactory.getCurrentSession().save(c);
		return c.getId();
	}

	/**
	 * 分页查询
	 */
	
	public List<Comment>  findPageByProperty(int pageNum, int pageSize, String hql, Object[] params) throws Exception {
		List<Comment> list = this.find4PageByProperty(pageNum, pageSize, hql, params);
		return list;
	}
}
