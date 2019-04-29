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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bishe.entity.Article;
import com.bishe.entity.Comment;
import com.bishe.entity.StuMathTypeGrade;
import com.bishe.entity.Student;

import com.bishe.entity.pojo.StudentPojo;
import com.bishe.service.AdminServiceImpl;

import com.bishe.service.CommentServiceImpl;
import com.bishe.service.StuServiceImpl;
import com.bishe.util.FileUtil;

@Controller
@RequestMapping("/student")
public class StuController {
	@Resource
	private StuServiceImpl stuServiceImpl;
	private  CommentServiceImpl commentServiceImpl;


	/**
	 * 首页跳转
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/home")
	public String home() throws Exception {
		return "index";
	}

	/**
	 * 个人页跳转
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/message")
	public String message() throws Exception {
		return "person_message";
	}
	/**
	 * 评论页跳转
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/reponse")
	public String reponse() throws Exception {
		return "person_return";
	}

	/**
	 * 个人信息修改跳转
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/change")
	public String change() throws Exception {
		return "person_change";
	}

	/**
	 * 跳转到登录页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public String index() throws Exception {
		return "userlogin";
	}

	/**
	 * 用户登录
	 * 
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, String userName, String password)
			throws Exception {
		Student stu = stuServiceImpl.findByStuName(userName);
		String res = "";
		if (stu == null) {
			res = "userlogin";
		} else {
			String pass = stu.getstuPwd();
			if (pass.equalsIgnoreCase(password)) {
				request.getSession().setAttribute("student", stu);
				res = "index";
			} else {
				res = "userlogin";
			}
		}
		return res;
	}


	/**
	 * 跳转注册界面
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/register")
	public String toRegiste() throws Exception {
		return "register";
	}

	/**
	 * 用户注销
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/exit")
	public String exit(HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("student");
		return "index";
	}

	/**
	 * 用户注册
	 * 
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/registe", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> regist(@RequestBody StudentPojo stu) {
		Map<String, String> result = new HashMap<String, String>();
		try {
			Student student = new Student();
			student.setstuName(stu.getStuName());
			student.setstuPwd(stu.getStuPwd());
			int id = 0;
			id = stuServiceImpl.registerUser(student);
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
	 * 后台获取表单信息
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/createMessage", method = RequestMethod.POST)
	@ResponseBody  
	public Map<String, String> createMessage(HttpServletRequest request,@RequestBody StudentPojo stu) {
		Map<String, String> setin = new HashMap<String, String>();
		try {
			Student s = (Student) request.getSession().getAttribute("student");
			Student student = new Student();
			student.setstuId(s.getstuId());
			student.setstuName(stu.getStuName());
			student.setstuPwd(stu.getStuPwd());
			// TODO Student 属性赋值
			student.setExamyear(stu.getExamyear());
			student.setSchool(stu.getSchool());
			student.setProfession(stu.getProfession());
			student.setDirection(stu.getDirection());
			student.setDescription(stu.getDescription());
			student.setHead(stu.getHead());
			stuServiceImpl.updateById(student);
			request.getSession().setAttribute("student", student);
			setin.put("message", "信息修改成功！");
			setin.put("status", "success");
		} catch (Exception e) {
			setin.put("status", "error");
			setin.put("message", "系统出错！");
			e.printStackTrace();
		}
		return setin;
	}

	/**
	 * 跳转个人中心
	 * 
	 * @return
	 * @throws Exception0
	 */
	@RequestMapping(value = "/person")
	public String person() throws Exception {

		return "person";
	}

	

		

	/**
	 * 用户分页查询接口
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/user/page")
	@ResponseBody
	public Map<String, Object> stupage(String search,Integer page,Integer recPerPage) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Student> list = stuServiceImpl.findPageByProperty(search, 0, page, recPerPage);
		long recTotal = stuServiceImpl.findCount4PageBySql(search, 0);
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
	 * 上传头像接口
	 * @param request
	 * @param admin
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody  
	public Map<String, String> upload(HttpServletRequest request, MultipartFile file) {
		Map<String, String> result = new HashMap<String, String>();
		try {
			String fileName = saveFile(file.getOriginalFilename(), file.getInputStream(), FileUtil.fileUploadPath);// 保存文件获取上传文件真实名称
			result.put("status", "success");
			result.put("url", fileName);
		} catch (Exception e) {
			result.put("status", "error");
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	/**
	 * 保存文件
	 * @param fileName
	 * @param ins
	 * @param uploadPath
	 * @return
	 */
	private String saveFile(String fileName, InputStream ins, String uploadPath) {
		BufferedOutputStream bw = null;
		File outFile = null;
		try {
			// 判断是否有文件
			if (!StringUtils.isEmpty(fileName)) {
				// 输出到本地路径
				outFile = new File(uploadPath + File.separator + fileName);
				// FileUtils.copyFile(files, outFile);
				FileUtils.copyInputStreamToFile(ins, outFile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (bw != null) {
					bw.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return outFile.getName();
	}
	
}

