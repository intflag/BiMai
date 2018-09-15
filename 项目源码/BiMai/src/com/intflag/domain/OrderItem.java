package com.intflag.domain;

public class OrderItem {
	private String itemid;
	private Integer count;// 数量
	private Double subtotal;// 小计
	private Product product;// 包含哪个商品
	private Order order;// 属于哪个订单

	public OrderItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getItemid() {
		return itemid;
	}

	public void setItemid(String itemid) {
		this.itemid = itemid;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "OrderItem [itemid=" + itemid + ", count=" + count
				+ ", subtotal=" + subtotal + ", product=" + product
				+ ", order=" + order + "]";
	}
	
}
