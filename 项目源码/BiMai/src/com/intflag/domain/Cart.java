package com.intflag.domain;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 购物车实体类
 * 
 * @author LGX
 * 
 */
public class Cart implements Serializable {
	private static final long serialVersionUID = 1L;

	// 存放购物车项集合，key商品ID CartItem：购物车项，使用map集合便于删除商品
	private Map<String, CartItem> map = new LinkedHashMap<String, CartItem>();

	private Double total = 0.0;//总金额
	/**
	 * 获取所有购物车项
	 * @return
	 */
	public Collection<CartItem> getItems() {
		return map.values();
	}
	/**
	 * 添加到购物车
	 * @param item
	 */
	public void add2Cart(CartItem item) {
		String pid = item.getProduct().getPid();
		if (map.containsKey(pid)) {
			CartItem oldItem = map.get(pid);
			oldItem.setCount(oldItem.getCount()+item.getCount());
		} else {
			map.put(pid, item);
		}
		total += item.getSubtotal();
	}
	/**
	 * 从购物车删除
	 * @param id
	 */
	public void removeFormCart(String pid) {
		CartItem item = map.remove(pid);
		total -= item.getSubtotal(); 
	}
	/**
	 * 清空购物车
	 */
	public void clearCart() {
		map.clear();
		total = 0.0;
	}
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Map<String, CartItem> getMap() {
		return map;
	}

	public void setMap(Map<String, CartItem> map) {
		this.map = map;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
