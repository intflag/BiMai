package com.intflag.dao;

import java.util.List;

import com.intflag.domain.PageBean;
import com.intflag.domain.Product;

public interface ProductDao {
	/**
	 * 查询最新商品
	 * @return
	 * @throws Exception
	 */
	List<Product> findNew() throws Exception;
	/**
	 * 查询热门商品
	 * @return
	 * @throws Exception
	 */
	List<Product> findHot() throws Exception;
	/**
	 * 根据ID查询商品
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	Product findById(String pid) throws Exception;
	/**
	 * 按照分页查询商品
	 * @param currPage
	 * @param pageSize
	 * @param cid
	 * @return
	 * @throws Exception
	 */
	List<Product> findByPage(int currPage, int pageSize, String cid) throws Exception;
	/**
	 * 返回某一分类商品总条数
	 * @return
	 * @throws Exception
	 */
	int getTotalCount(String cid) throws Exception;
	/**
	 * 分页查询*所有*商品
	 * @param currPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	List<Product> findByPage(int currPage, int pageSize) throws Exception;
	/**
	 * 返回某一分类商品总条数
	 * @return
	 * @throws Exception
	 */
	int getTotalCount() throws Exception;
	/**
	 * 添加商品
	 * @param p
	 * @throws Exception
	 */
	void addProduct(Product p) throws Exception;
	/**
	 * 根据商品ID删除商品
	 * @param pid
	 * @throws Exception
	 */
	void deleteById(String pid) throws Exception;
	/**
	 * 修改商品
	 * @param p
	 * @throws Exception
	 */
	void updateProduct(Product p) throws Exception;
	/**
	 * 对商品进行模糊查询
	 * @param word
	 * @return
	 * @throws Exception
	 */
	List<Product> findProductByName(String word) throws Exception;
	/**
	 * 根据商品名称查找唯一商品
	 * @param pname
	 * @return
	 * @throws Exception
	 */
	Product findUniqueByName(String pname) throws Exception;

}
