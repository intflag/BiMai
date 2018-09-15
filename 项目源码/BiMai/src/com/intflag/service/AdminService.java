package com.intflag.service;

import com.intflag.domain.Admin;

public interface AdminService {
	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 * @throws Exception
	 */
	Admin login(Admin admin) throws Exception;
	/**
	 * 更新管理员
	 * @param admin
	 * @throws Exception
	 */
	void updateAdmin(Admin admin) throws Exception;

}
