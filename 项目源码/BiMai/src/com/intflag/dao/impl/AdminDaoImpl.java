package com.intflag.dao.impl;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.intflag.dao.AdminDao;
import com.intflag.domain.Admin;
import com.intflag.utils.DataSourceUtils;

public class AdminDaoImpl implements AdminDao {

	@Override
	public Admin findAdminByUnameAndPwd(String admin_name, String admin_pwd)
			throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM admin WHERE admin_name=? AND admin_pwd=?";
		return qr.query(sql, new BeanHandler<Admin>(Admin.class),admin_name,admin_pwd);
	}

	@Override
	public void update(Admin admin) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "UPDATE admin SET admin_pwd = ? WHERE admin_id = ?";
		qr.update(sql,admin.getAdmin_pwd(),admin.getAdmin_id());
	}

}
