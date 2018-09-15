package com.intflag.domain;

import java.io.Serializable;

/**
 * 购物车项实体类
 * 
 * @author LGX
 * 
 */
public class CartItem implements Serializable {
	private static final long serialVersionUID = 1L;

	private Product product;// 商品对象
	private Integer count;// 购买数量
	private Double subtotal = 0.0;// 小计

	public CartItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartItem(Product product, Integer count) {
		super();
		this.product = product;
		this.count = count;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getSubtotal() {
		return product.getShop_price() * count;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CartItem [product=" + product + ", count=" + count
				+ ", subtotal=" + subtotal + "]";
	}

}
