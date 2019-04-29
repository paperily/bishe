package com.bishe.dao;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.bishe.entity.Admin;
import com.bishe.dao.BaseDao;

@Repository
public class AdminDaoImpl extends BaseDao<Admin> {
	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 添加管理员角色项
	 * 
	 * @param urr
	 * @return
	 * @throws Exception
	 */
	public int saveAdmin(Admin a) throws Exception {
		SessionFactory sessionFactory = super.getSessionFactory();
		sessionFactory.getCurrentSession().save(a);
		return a.getAdId();
	}

	public Admin findById(int adminId) throws Exception {
		return this.get(adminId);
	}

	/**
	 * 通過姓名查找
	 * 
	 * @param stuName
	 *            姓名
	 * @return
	 * @throws Exception
	 */
	public Admin findByAdName(String adname) throws Exception {
		String hql = "from Admin a where a.adname = ?";
		Object[] param = { adname };
		return this.findOne(hql, param);
	}

	/**
	 * 通过ID修改
	 */
	public void updateById(Admin ad) throws Exception {
		this.update(ad);

		// this.updateByProperty(hql, params);// update student s set s.stunname = ?,s.XX=?,... where s.stuid = ?,["张三",...,1] hql
		// this.excuteBySql(sql, params)// update student s set s.stunname = ?,s.XX=?,... where s.stuid = ?,["张三",...,1] sql sql99规则
	}
	
	/**
	 * 分页查询
	 */
	
	public List<Admin>findPageByProperty(int pageNum, int pageSize, String hql, Object[] params) throws Exception {
		List<Admin> list = this.findPageByProperty(pageNum, pageSize, hql, params);
		return list;
	}
	
	

}
