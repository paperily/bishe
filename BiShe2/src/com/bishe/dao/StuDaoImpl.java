package com.bishe.dao;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.bishe.entity.Student;
import com.bishe.dao.BaseDao;

@Repository
public class StuDaoImpl extends BaseDao<Student> {
	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 添加用户角色项
	 * 
	 * @param urr
	 * @return
	 * @throws Exception
	 */
	public int saveStu(Student stu) throws Exception {
		SessionFactory sessionFactory = super.getSessionFactory();
		sessionFactory.getCurrentSession().save(stu);
		return stu.getstuId();
	}

	public Student findById(int stuId) throws Exception {
		return this.get(stuId);
	}

	/**
	 * 通過姓名查找
	 * 
	 * @param stuName
	 *            姓名
	 * @return
	 * @throws Exception
	 */
	public Student findByStuName(String stuName) throws Exception {
		String hql = "from Student s where s.stuName = ?";
		Object[] param = { stuName };
		return this.findOne(hql, param);
	}

	/**
	 * 通过ID修改
	 */
	public void updateById(Student stu) throws Exception {
		this.update(stu);// 测试能不能根据ID更新
		// this.updateByProperty(hql, params);// update student s set s.stunname = ?,s.XX=?,... where s.stuid = ?,["张三",...,1] hql
		// this.excuteBySql(sql, params)// update student s set s.stunname = ?,s.XX=?,... where s.stuid = ?,["张三",...,1] sql sql99规则
	}
	
	/**
	 * 分页查询
	 */
	
	public List<Student>  findPageByProperty(int pageNum, int pageSize, String hql, Object[] params) throws Exception {
		List<Student> list = this.find4PageByProperty(pageNum, pageSize, hql, params);
		return list;
	}
	
	

}
