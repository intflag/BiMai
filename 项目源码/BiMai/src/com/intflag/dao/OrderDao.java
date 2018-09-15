package com.intflag.dao;

import java.util.List;

import com.intflag.domain.Order;
import com.intflag.domain.OrderItem;

public interface OrderDao {
	/**
	 * 添加订单
	 * @param order
	 * @return
	 * @throws Exception
	 */
	void addOrder(Order order) throws Exception;
	/**
	 * 添加订单项
	 * @param orderItem
	 * @throws Exception
	 */
	void addOrderItem(OrderItem orderItem) throws Exception;
	/**
	 * 分页查询用户订单
	 * @param currPage
	 * @param pageSize
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	List<Order> findAllByPage(int currPage, int pageSize, String uid) throws Exception;
	/**
	 * 获取用户订单总条数
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	int getOrderCount(String uid) throws Exception;
	/**
	 * 根据ID查找商品
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
	List<Order> findAllByPage(int currPage, int pageSize) throws Exception;
	/**
	 * 查询所有订单条数
	 * @return
	 * @throws Exception
	 */
	int getOrderCount() throws Exception;
	/**
	 * 根据状态查询订单
	 * @param currPage
	 * @param pageSize
	 * @param state
	 * @return
	 * @throws Exception
	 */
	List<Order> findOrderByState(int state) throws Exception;
	/**
	 * 根据订单状态查询订单条数
	 * @param state
	 * @return
	 * @throws Exception
	 */
	int getOrderCountByState(int state) throws Exception;
	/**
	 * 查询所有订单
	 * @return
	 * @throws Exception
	 */
	List<Order> findOrderAll() throws Exception;
}
