package com.intflag.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.intflag.dao.UserDao;
import com.intflag.domain.User;
import com.intflag.utils.DataSourceUtils;

public class UserDaoImpl implements UserDao {

	public boolean addUser(User user) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "INSERT INTO `user`(uid,username,password,email,telephone,state,code) VALUES(?,?,?,?,?,?,?)";
		int flag = qr.update(sql,user.getUid(),user.getUsername(),user.getPassword(),user.getEmail(),user.getTelephone(),user.getState(),user.getCode());
		if (flag > 0) {
			return true;
		}
		return false;
	}

	@Override
	public User findUser(String username) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM `user` WHERE username = ?";
		return qr.query(sql, new BeanHandler<User>(User.class),username);
	}

	@Override
	public User findUser(String username, String password) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM `user` WHERE BINARY username = ? AND BINARY password = ?;";
		return qr.query(sql, new BeanHandler<User>(User.class),username,password);
	}

	@Override
	public List<User> findAll() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM `user`";
		return qr.query(sql, new BeanListHandler<User>(User.class));
	}

	@Override
	public void deleteById(String uid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "DELETE FROM `user` WHERE uid = ?";
		qr.update(sql,uid);
	}

}
