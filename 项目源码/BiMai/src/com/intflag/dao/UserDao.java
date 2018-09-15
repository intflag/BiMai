package com.intflag.dao;

import java.util.List;

import com.intflag.domain.User;

public interface UserDao {
	/**
	 * 添加用户
	 * @param user
	 * @return
	 * @throws Exception
	 */
	boolean addUser(User user) throws Exception;
	/**
	 * 根据用户名查找用户
	 * @param username
	 * @return
	 */
	User findUser(String username) throws Exception;
	/**
	 * 根据用户名和密码查找用户
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 */
	User findUser(String username, String password) throws Exception;
	/**
	 * 查找所有用户
	 * @return
	 * @throws Exception
	 */
	List<User> findAll() throws Exception;
	/**
	 * 根据ID删除用户
	 * @param uid
	 * @throws Exception
	 */
	void deleteById(String uid) throws Exception;

}
