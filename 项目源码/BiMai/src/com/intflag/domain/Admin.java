package com.intflag.domain;

import java.io.Serializable;
/**
 * 管理员实体类
 * @author LGX
 *
 */
public class Admin implements Serializable {
	private static final long serialVersionUID = 1L;
	/*
	 * `admin_id` int(11) NOT NULL AUTO_INCREMENT,
	   `admin_name` varchar(32) DEFAULT NULL,
	   `admin_pwd` varchar(32) DEFAULT NULL,
	 */
	private Integer admin_id;
	private String admin_name;
	private String admin_pwd;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_name=" + admin_name
				+ ", admin_pwd=" + admin_pwd + "]";
	}
	
	
}
