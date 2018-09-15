package com.intflag.domain;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class Order {
	private String oid;
	private Date ordertime;// 下单时间
	private Double total;// 总计
	private Integer state = 0;// 订单支付状态 0：未支付 1：已支付
	private String address;// 地址
	private String name;// 姓名
	private String telephone;// 电话
	private User user;// 属于哪个用户
	private List<OrderItem> items = new LinkedList<OrderItem>();// 包含哪些订单项

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OrderItem> getItems() {
		return items;
	}

	public void setItems(List<OrderItem> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "Order [oid=" + oid + ", ordertime=" + ordertime + ", total="
				+ total + ", state=" + state + ", address=" + address
				+ ", name=" + name + ", telephone=" + telephone + ", user="
				+ user + ", items=" + items + "]";
	}
	
}
