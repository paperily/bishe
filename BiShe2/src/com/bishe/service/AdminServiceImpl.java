package com.bishe.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.bishe.dao.AdminDaoImpl;
import com.bishe.dao.StuDaoImpl;
import com.bishe.entity.Admin;
import com.bishe.entity.Student;


@Service
@Transactional(readOnly=false)
public class AdminServiceImpl {

	@Resource
	private AdminDaoImpl adminDaoImpl;
	public int registerUser(Admin a) throws Exception{
		this.adminDaoImpl.saveAdmin(a);
		return a.getAdId();
	}
	
	public Admin findById(int adminId) throws Exception{
		System.out.println("service");
		return adminDaoImpl.findById(adminId);
	}
	
	public Admin findByAdName(String  adminName) throws Exception{
		return adminDaoImpl.findByAdName(adminName);
	}
	
	public void updateById(Admin a) throws Exception {
		adminDaoImpl.update(a);
	}
	
	/**
	 * 分页查询
	 */
	public List<Admin> findPageByProperty(String adminName,Integer adminId,Integer pageNum,Integer pageSize) throws Exception {
		String hql = "from Admin a where 1 = 1";
		List<Object> list = new ArrayList<Object>();
		if(!StringUtils.isEmpty(adminName)){ // null "" 
			// 用户姓名不为空，加入查询条件
			hql += "and a.adminName like ?";
			list.add(adminName);
		}
		if(adminId != null && adminId != 0){
			// 用户ID不为空，加入查询条件+
			hql += "and a.adminId = ?";
			list.add(adminId+"");
		}
		List<Admin> alist =adminDaoImpl.find4PageByProperty(pageNum, pageSize, hql, list.toArray());
		return alist;
	
	}
	/**
	 * 分页查询->统计数量
	 * @throws Exception 
	 */
	public long findCount4PageBySql(String adname, Integer adid) throws Exception {
		String sql = "select count(1) from admin a where 1 = 1 ";
		List<Object> list = new ArrayList<Object>();
		if(!StringUtils.isEmpty(adname)){ // null "" 
			// 用户姓名不为空，加入查询条件
			sql += "and a.adname like ?";
			list.add("%"+ adname + "%");
		}
		if(adid != null && adid != 0){
			// 用户ID不为空，加入查询条件
			sql += "and s.stuId = ?";
			list.add(adid+"");
		}

		return adminDaoImpl.findCount4PageBySql(sql, list.toArray());
	}	
}
