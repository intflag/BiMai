package com.intflag.domain;

import java.io.Serializable;
import java.util.List;
/**
 * 分页实体类
 * @author LGX
 *
 * @param <E>
 */
public class PageBean<E> implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private List<E> list;
	private Integer currPage;
	private Integer pageSize;
	private Integer totalPage;
	private Integer totalCount;

	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PageBean(List<E> list, Integer currPage, Integer pageSize,
			Integer totalCount) {
		super();
		this.list = list;
		this.currPage = currPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		return (int) Math.ceil(totalCount * 1.0 / pageSize);
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "PageBean [list=" + list + ", currPage=" + currPage
				+ ", pageSize=" + pageSize + ", totalPage=" + totalPage
				+ ", totalCount=" + totalCount + "]";
	}

}
