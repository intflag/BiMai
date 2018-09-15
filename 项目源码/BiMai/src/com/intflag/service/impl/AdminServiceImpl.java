package com.intflag.service.impl;

import com.intflag.dao.AdminDao;
import com.intflag.dao.impl.AdminDaoImpl;
import com.intflag.domain.Admin;
import com.intflag.service.AdminService;

public class AdminServiceImpl implements AdminService {

	AdminDao ad = new AdminDaoImpl();
	@Override
	public Admin login(Admin admin) throws Exception {
		return ad.findAdminByUnameAndPwd(admin.getAdmin_name(),admin.getAdmin_pwd());
	}
	@Override
	public void updateAdmin(Admin admin) throws Exception {
		ad.update(admin);
	}

}
