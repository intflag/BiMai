package com.intflag.service.impl;

import java.util.List;

import com.intflag.dao.OrderDao;
import com.intflag.dao.impl.OrderDaoImpl;
import com.intflag.domain.Order;
import com.intflag.domain.OrderItem;
import com.intflag.domain.PageBean;
import com.intflag.domain.User;
import com.intflag.service.OrderService;
import com.intflag.utils.DataSourceUtils;

public class OrderServiceImpl implements OrderService {

	OrderDao od = new OrderDaoImpl();

	@Override
	public void addOrder(Order order) throws Exception {
		try {
			DataSourceUtils.startTransaction();

			OrderDao od = new OrderDaoImpl();
			od.addOrder(order);

			for (OrderItem item : order.getItems()) {
				od.addOrderItem(item);
			}
			DataSourceUtils.commitAndClose();
		} catch (Exception e) {
			e.printStackTrace();
			DataSourceUtils.rollbackAndClose();
			throw e;
		}
	}

	@Override
	public PageBean<Order> findAllByPage(int currPage, int pageSize, User user)
			throws Exception {
		OrderDao od = new OrderDaoImpl();

		//得到订单列表
		List<Order> list = od.findAllByPage(currPage, pageSize, user.getUid());

		//查询当前用户订单总条数
		int totalCount = od.getOrderCount(user.getUid());

		return new PageBean<Order>(list, currPage, pageSize, totalCount);
	}

	@Override
	public Order findOrderById(String oid) throws Exception {
		return od.findOrderById(oid);
	}

	@Override
	public void updateOrder(Order order) throws Exception {
		od.updateOrder(order);
	}

	@Override
	public PageBean<Order> findAllByPage(int currPage, int pageSize)
			throws Exception {
		List<Order> list = od.findAllByPage(currPage, pageSize);
		int totalCount = od.getOrderCount();
		PageBean<Order> pb = new PageBean<Order>(list, currPage, pageSize, totalCount);
		return pb;
	}

	@Override
	public List<Order> findOrderByState(int state) throws Exception {
		return od.findOrderByState(state);
	}

	@Override
	public List<Order> findOrderAll() throws Exception {
		return od.findOrderAll();
	}



}
