package com.intflag.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.intflag.dao.OrderDao;
import com.intflag.domain.Order;
import com.intflag.domain.OrderItem;
import com.intflag.domain.Product;
import com.intflag.utils.DataSourceUtils;

public class OrderDaoImpl implements OrderDao {

	@Override
	public void addOrder(Order order) throws Exception {
		QueryRunner qr = new QueryRunner();
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		qr.update(DataSourceUtils.getConnection(), sql, order.getOid(),
				order.getOrdertime(), order.getTotal(), order.getState(),
				order.getAddress(), order.getName(), order.getTelephone(),
				order.getUser().getUid());
	}

	@Override
	public void addOrderItem(OrderItem orderItem) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into orderitem values(?,?,?,?,?)";
		qr.update(DataSourceUtils.getConnection(), sql, orderItem.getItemid(),
				orderItem.getCount(), orderItem.getSubtotal(), orderItem
						.getProduct().getPid(), orderItem.getOrder().getOid());
	}

	@Override
	public List<Order> findAllByPage(int currPage, int pageSize, String uid)
			throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM orders WHERE uid = ? LIMIT ?,?";
		List<Order> list = qr.query(sql, new BeanListHandler<Order>(Order.class),uid,(currPage-1)*pageSize,pageSize);
		// 遍历订单集合，封装每个订单项列表
		sql = "SELECT * FROM orderitem o,product p WHERE o.pid = p.pid AND o.oid=?";
		for (Order order : list) {
			// 当前订单包含的所有内容
			List<Map<String, Object>> mList = qr.query(sql,
					new MapListHandler(), order.getOid());
			for (Map<String, Object> map : mList) {
				// 封装Product
				Product product = new Product();
				BeanUtils.populate(product, map);

				// 封装OrderItem
				OrderItem orderItem = new OrderItem();
				BeanUtils.populate(orderItem, map);
				orderItem.setProduct(product);

				// 将OrderItem对象添加到对应的Order对象的list中
				order.getItems().add(orderItem);

			}
		}
		return list;
	}

	@Override
	public int getOrderCount(String uid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT count(*) FROM orders WHERE uid = ?";
		return ((Long)qr.query(sql, new ScalarHandler(),uid)).intValue();
	}

	@Override
	public Order findOrderById(String oid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM orders WHERE oid = ?";
		Order order = qr.query(sql, new BeanHandler<Order>(Order.class),oid);
		
		//封装订单项
		sql = "SELECT * FROM orderitem o,product p WHERE o.pid=p.pid AND o.oid = ?";
		List<Map<String, Object>> query = qr.query(sql, new MapListHandler(),oid);
		for (Map<String, Object> map : query) {
			//封装商品
			Product product = new Product();
			BeanUtils.populate(product, map);
			//封装订单项
			OrderItem orderItem = new OrderItem();
			BeanUtils.populate(orderItem, map);
			orderItem.setProduct(product);
			
			order.getItems().add(orderItem);
		}
		return order;
	}

	@Override
	public void updateOrder(Order order) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update orders set state=?,address=?,name=?,telephone=? where oid=?";
		qr.update(sql, order.getState(), order.getAddress(), order.getName(),
				order.getTelephone(), order.getOid());
	}

	@Override
	public List<Order> findAllByPage(int currPage, int pageSize)
			throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM orders LIMIT ?,?";
		return qr.query(sql, new BeanListHandler<Order>(Order.class),(currPage-1)*pageSize,pageSize);
	}

	@Override
	public int getOrderCount() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT count(*) FROM orders";
		return ((Long)qr.query(sql, new ScalarHandler())).intValue();
	}

	@Override
	public List<Order> findOrderByState(int state) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM orders WHERE state = ?";
		return qr.query(sql, new BeanListHandler<Order>(Order.class),state);
	}

	@Override
	public int getOrderCountByState(int state) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT count(*) FROM orders WHERE state = ?";
		return ((Long)qr.query(sql, new ScalarHandler(),state)).intValue();
	}

	@Override
	public List<Order> findOrderAll() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM orders";
		return qr.query(sql, new BeanListHandler<Order>(Order.class));
	}

	

}
