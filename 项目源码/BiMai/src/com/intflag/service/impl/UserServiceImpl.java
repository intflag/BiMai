package com.intflag.service.impl;

import java.util.List;

import com.intflag.dao.UserDao;
import com.intflag.dao.impl.UserDaoImpl;
import com.intflag.domain.User;
import com.intflag.service.UserService;

public class UserServiceImpl implements UserService {
	UserDao ud = new UserDaoImpl();

	public boolean register(User user) throws Exception {
		return ud.addUser(user);
	}

	@Override
	public User findUser(String username) throws Exception {
		return ud.findUser(username);
	}

	@Override
	public User login(String username,String password) throws Exception {
		// TODO Auto-generated method stub
		return ud.findUser(username,password);
	}

	@Override
	public List<User> findAllUsers() throws Exception {
		return ud.findAll();
	}

	@Override
	public void deleteUserById(String uid) throws Exception {
		ud.deleteById(uid);
	}
}
