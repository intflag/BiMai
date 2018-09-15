package com.intflag.service.impl;

import java.util.List;

import com.intflag.dao.CategoryDao;
import com.intflag.dao.ProductDao;
import com.intflag.dao.impl.CategoryDaoImpl;
import com.intflag.dao.impl.ProductDaoImpl;
import com.intflag.domain.Category;
import com.intflag.domain.PageBean;
import com.intflag.domain.Product;
import com.intflag.service.CategoryService;
import com.intflag.service.ProductService;

public class ProductServiceImpl implements ProductService {
	ProductDao pd = new ProductDaoImpl();
	
	@Override
	public List<Product> findNewProducts() throws Exception {
		return pd.findNew();
	}
	@Override
	public List<Product> findHotProducts() throws Exception {
		return pd.findHot();
	}
	@Override
	public Product findProductById(String pid) throws Exception {
		Product product = pd.findById(pid);
		return pd.findById(pid);
	}
	@Override
	public PageBean<Product> findByPage(int currPage, int pageSize, String cid)
			throws Exception {
		//当前页数据
		List<Product> list = pd.findByPage(currPage, pageSize, cid);
		
		//总条数
		int totalCount = pd.getTotalCount(cid);
		
		return new PageBean<Product>(list, currPage, pageSize, totalCount);
	}
	@Override
	public PageBean<Product> findByPage(int currPage, int pageSize)
			throws Exception {
		//当前页数据
		List<Product> list = pd.findByPage(currPage, pageSize);
		
		//总条数
		int totalCount = pd.getTotalCount();
		
		return new PageBean<Product>(list, currPage, pageSize, totalCount);
	}
	@Override
	public void addProduct(Product p) throws Exception {
		pd.addProduct(p);
	}
	@Override
	public void deleteById(String pid) throws Exception {
		pd.deleteById(pid);
	}
	@Override
	public void updateProduct(Product p) throws Exception {
		pd.updateProduct(p);
	}
	@Override
	public List<Product> findProductByName(String word) throws Exception {
		return pd.findProductByName(word);
	}
	@Override
	public Product findUniqueProductByName(String pname) throws Exception {
		return pd.findUniqueByName(pname);
	}

}
