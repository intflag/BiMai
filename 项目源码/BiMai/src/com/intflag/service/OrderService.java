package com.intflag.service;

import java.util.List;

import com.intflag.domain.Order;
import com.intflag.domain.PageBean;
import com.intflag.domain.User;

public interface OrderService {
	/**
	 * 添加订单
	 * @param order
	 * @throws Exception
	 */
	void addOrder(Order order) throws Exception;
	/**
	 * 分页查询订单
	 * @param currPage
	 * @param pageSize
	 * @param user
	 * @return
	 * @throws Exception
	 */
	PageBean<Order> findAllByPage(int currPage, int pageSize, User user) throws Exception;
	/**
	 * 根据ID查找订单
	 * @param oid
	 * @return
	 * @throws Exception
	 */
	Order findOrderById(String oid) throws Exception;
	/**
	 * 更新订单
	 * @param order
	 * @throws Exception
	 */
	void updateOrder(Order order) throws Exception;
	/**
	 * 分页查询所有订单
	 * @param currPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	PageBean<Order> findAllByPage(int currPage, int pageSize) throws Exception;
	/**
	 * 按照状态查询订单
	 * @param state
	 * @return
	 * @throws Exception
	 */
	List<Order> findOrderByState(int state) throws Exception;
	/**
	 * 查询所有订单
	 * @return
	 * @throws Exception
	 */
	List<Order> findOrderAll() throws Exception;

}
