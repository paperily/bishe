package com.bishe.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.bishe.dao.StuDaoImpl;
import com.bishe.entity.Student;


@Service
@Transactional(readOnly=false)
public class StuServiceImpl {

	@Resource
	private StuDaoImpl stuDaoImpl;
	
	public int registerUser(Student u) throws Exception{
		this.stuDaoImpl.save(u);
		return u.getstuId();
	}
	
	public Student findById(int stuId) throws Exception{
		System.out.println("service");
		return stuDaoImpl.findById(stuId);
	}
	
	public Student findByStuName(String  stuName) throws Exception{
		return stuDaoImpl.findByStuName(stuName);
	}
	
	public void updateById(Student stu) throws Exception {
		stuDaoImpl.update(stu);
	}
	
	/**
	 * 分页查询
	 */
	public List<Student>  findPageByProperty(String stuName,Integer stuId,Integer pageNum,Integer pageSize) throws Exception {
		String hql = "from Student s where 1 = 1 ";
		List<Object> list = new ArrayList<Object>();
		if(!StringUtils.isEmpty(stuName)){ // null "" 
			// 用户姓名不为空，加入查询条件
			hql += "and s.stuName like ?";
			list.add("%"+ stuName + "%");
		}
		if(stuId != null && stuId != 0){
			// 用户ID不为空，加入查询条件
			hql += "and s.stuId = ?";
			list.add(stuId+"");
		}
		List<Student> slist = stuDaoImpl.find4PageByProperty(pageNum, pageSize, hql, list.toArray());// null
		return slist;
	}

	/**
	 * 分页查询->统计数量
	 * @throws Exception 
	 */
	public long findCount4PageBySql(String stuName, Integer stuId) throws Exception {
		String sql = "select count(1) from student s where 1 = 1 ";
		List<Object> list = new ArrayList<Object>();
		if(!StringUtils.isEmpty(stuName)){ // null "" 
			// 用户姓名不为空，加入查询条件
			sql += "and s.stuName like ?";
			list.add("%"+ stuName + "%");
		}
		if(stuId != null && stuId != 0){
			// 用户ID不为空，加入查询条件
			sql += "and s.stuId = ?";
			list.add(stuId+"");
		}
		return stuDaoImpl.findCount4PageBySql( sql,list.toArray());
	}
	
}
