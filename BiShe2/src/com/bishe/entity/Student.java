package com.bishe.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "student")
public class Student {
	@Id
	@GeneratedValue(generator = "increment_generator")
	@GenericGenerator(name = "increment_generator", strategy = "increment")

	private int stuId;

	private String stuName;

	private String stuPwd;

	private String stuTel;

	private int stuGrade;

	private int examyear;
	private String head;

	private String school;

	private int math;
	
	private int english;
	
	private int policy;
	
	private int professional;
	
	

	public int getPolicy() {
		return policy;
	}

	public void setPolicy(int policy) {
		this.policy = policy;
	}

	public int getProfessional() {
		return professional;
	}

	public void setProfessional(int professional) {
		this.professional = professional;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getEnglish() {
		return english;
	}

	public void setEnglish(int english) {
		this.english = english;
	}


	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	private String profession;
	private String direction;
	private String description;

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getstuId() {
		return stuId;
	}

	public void setstuId(int stuId) {
		this.stuId = stuId;
	}

	public int getExamyear() {
		return examyear;
	}

	public void setExamyear(int examyear) {
		this.examyear = examyear;
	}

	public String getstuName() {
		return stuName;
	}

	public void setstuName(String stuName) {
		this.stuName = stuName;
	}

	public String getstuPwd() {
		return stuPwd;
	}

	public void setstuPwd(String stuPwd) {
		this.stuPwd = stuPwd;
	}

	public String getstuTel() {
		return stuTel;
	}

	public void setstuTel(String stuTel) {
		this.stuTel = stuTel;
	}

	public int getstuGrade() {
		return stuGrade;
	}

	public void setstuGrade(int stuGrade) {
		this.stuGrade = stuGrade;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

}
