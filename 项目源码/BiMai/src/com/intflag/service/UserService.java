package com.intflag.service;

import java.util.List;

import com.intflag.domain.User;

public interface UserService {
	/**
	 * 用户注册
	 * @param user
	 * @return
	 * @throws Exception
	 */
	boolean register(User user) throws Exception;
	/**
	 * 根据用户名查找用户
	 * @param username
	 * @return
	 * @throws Exception
	 */
	User findUser(String username) throws Exception;
	/**
	 * 用户登录
	 * @param user
	 * @return
	 * @throws Exception
	 */
	User login(String username,String password) throws Exception;
	/**
	 * 查找所有用户
	 * @return
	 * @throws Exception
	 */
	List<User> findAllUsers() throws Exception;
	/**
	 * 根据ID删除用户
	 * @param uid
	 * @throws Exception
	 */
	void deleteUserById(String uid) throws Exception;
}
