package com.intflag.dao;

import com.intflag.domain.Admin;

public interface AdminDao {
	/**
	 * 根据用户名密码查找管理员
	 * @param admin_name
	 * @param admin_pwd
	 * @return
	 * @throws Exception
	 */
	Admin findAdminByUnameAndPwd(String admin_name, String admin_pwd) throws Exception;
	/**
	 * 更新管理员
	 * @param admin
	 * @throws Exception
	 */
	void update(Admin admin) throws Exception;

}
