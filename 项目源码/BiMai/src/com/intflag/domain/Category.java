package com.intflag.domain;

import java.io.Serializable;
/**
 * 商品分类实体类
 * @author LGX
 *
 */
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String cid;
	private String cname;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	@Override
	public String toString() {
		return "Category [cid=" + cid + ", cname=" + cname + "]";
	}

}
