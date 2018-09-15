package com.intflag.service;

import java.util.List;

import com.intflag.domain.Category;

public interface CategoryService {
	/**
	 * 查询所有分类
	 * @return
	 * @throws Exception
	 */
	List<Category> findAll() throws Exception;
	/**
	 * 根据分类ID查询分类
	 * @param cid
	 * @return
	 * @throws Exception
	 */
	Category findCategoryById(String cid) throws Exception;
	/**
	 * 更新分类
	 * @param category
	 * @throws Exception
	 */
	void updateCategory(Category category) throws Exception;
	/**
	 * 根据id删除分类
	 * @param cid
	 * @throws Exception
	 */
	void deleteById(String cid) throws Exception;
	/**
	 * 新增分类
	 * @param cid
	 * @throws Exception
	 */
	void addCategory(Category category) throws Exception;
	/**
	 * 根据名称查找分类
	 * @param cname
	 * @return
	 * @throws Exception
	 */
	Category findCategoryByName(String cname) throws Exception;

}
