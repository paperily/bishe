package com.bishe.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bishe.entity.Admin;
import com.bishe.entity.Student;
import com.bishe.entity.pojo.AdminPojo;
import com.bishe.entity.pojo.StudentPojo;
import com.bishe.service.AdminServiceImpl;
import com.bishe.service.StuServiceImpl;
import com.bishe.util.FileUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource
	private  AdminServiceImpl adminServiceImpl;
	
	/**
	 * 跳转后台登录
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/bg_login")
	public String bg_login() throws Exception {
		return "bg_login";
	}
	/**
	 * 跳转后台首页
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/bg_index")
	public String bg_index() throws Exception {
		return "bg_index";
	}

	/**
	 * 跳转修改用户详情页
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/bg_editUser")
	public String bg_editUser() throws Exception {
		return "bg_editUser";
	}	
	/**
	 * 跳转查看用户列表页
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/bg_searchUser")
	public String bg_searchUser() throws Exception {
		return "bg_searchUser";
	}		
		
	/**
	 * 管理员登录
	 * 
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/bg_login", method = RequestMethod.POST)
	public String bg_login(HttpServletRequest request, HttpServletResponse response, String adname, String adpwd)
			throws Exception {
		Admin admin=adminServiceImpl.findByAdName(adname);
		String res = "";
		if (admin == null) {
			res = "bg_login";
		} else {
			String pass = admin.getAdpwd();
			if (pass.equalsIgnoreCase(adpwd)) {
				request.getSession().setAttribute("admin", admin);
				res = "bg_index";	
			} else {
				res = "bg_login";
			}
		}
		return res;
	}		
	/**
	 * 用户列表跳转
	 * 
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "/stulist")
	public String uselist() throws Exception {
		return "bg_searchUser";
	}
	/**
	 * 用户分页查询接口
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/page")
	@ResponseBody
	public Map<String, Object> stupage(String adname,Integer adid,Integer page,Integer recPerPage) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Admin> list = adminServiceImpl.findPageByProperty(adname, adid, page, recPerPage);
		long recTotal = adminServiceImpl.findCount4PageBySql(adname, adid);
		result.put("result", "success");
		result.put("data", list);
		Map<String, Object> pager = new HashMap<String, Object>();
		pager.put( "page", page);
		pager.put("recTotal", recTotal);
		pager.put("recPerPage", recPerPage);
		result.put("pager",pager);
		return result;
	}
	/**
	 * 跳转后台增加管理员
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/bg_addAdmin")
	public String bg_addAdmin() throws Exception {
		return "bg_addAdmin";
	}	
	
	/**
	 * 管理员注册
	 * 
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> addadmin(@RequestBody AdminPojo ad) {
		Map<String, String> result = new HashMap<String, String>();
		try {
			Admin a = new Admin();
			a.setAdname(ad.getAdname());
			a.setAdpwd(ad.getAdpwd());
			int id = 0;
			id = adminServiceImpl.registerUser(a);
			// int a = 1/0;// 验证注册失败，正常应删除此行代码
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
	 * 跳转查看管理员列表页
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/bg_searchAdmin")
	public String bg_searchAdmin() throws Exception {
		return "bg_searchAdmin";
	}	
	/**
	 * 后台获取表单信息
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/createAdmessage", method = RequestMethod.POST)
	@ResponseBody  
	public Map<String, String> createMessage(HttpServletRequest request,@RequestBody AdminPojo admin) {
		Map<String, String> setin = new HashMap<String, String>();
		try {
			Admin a =  (Admin) request.getSession().getAttribute("admin");
			Admin admin1 = new Admin();
			admin1.setAdId(a.getAdId());
			admin1.setAdname(a.getAdname());
			admin1.setAdpwd(a.getAdpwd());
			adminServiceImpl.updateById(admin1);
			request.getSession().setAttribute("admin", admin1);
			setin.put("status", "success");
			setin.put("message", "修改成功");
		} catch (Exception e) {
			setin.put("status", "error");
			setin.put("message", "修改失败，请重试！");
			e.printStackTrace();
		}
		return setin;
	}
	
	
	
	


	
}