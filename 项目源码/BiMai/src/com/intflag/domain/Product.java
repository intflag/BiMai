package com.intflag.domain;

import java.io.Serializable;
import java.util.Date;
/**
 * 商品实体类
 * @author LGX
 *
 */
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String pid;
	private String pname;
	private Double market_price;// 市场价
	private Double shop_price;// 商城价
	private String pimage;// 商品图片
	private Date pdate;// 上架日期
	private Integer is_hot = 1;// 是否属于热门商品 1：热门 0：不热门
	private String pdesc;// 商品描述
	private Integer pflag = 0;// 是否下架 1：下架 0：没有下架
	private Category category;// 属于哪个分类

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Double getMarket_price() {
		return market_price;
	}

	public void setMarket_price(Double market_price) {
		this.market_price = market_price;
	}

	public Double getShop_price() {
		return shop_price;
	}

	public void setShop_price(Double shop_price) {
		this.shop_price = shop_price;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public Integer getIs_hot() {
		return is_hot;
	}

	public void setIs_hot(Integer is_hot) {
		this.is_hot = is_hot;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public Integer getPflag() {
		return pflag;
	}

	public void setPflag(Integer pflag) {
		this.pflag = pflag;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", market_price="
				+ market_price + ", shop_price=" + shop_price + ", pimage="
				+ pimage + ", pdate=" + pdate + ", is_hot=" + is_hot
				+ ", pdesc=" + pdesc + ", pflag=" + pflag + ", category="
				+ category + "]";
	}

}
