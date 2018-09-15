package com.intflag.service.impl;

import java.util.List;

import com.intflag.dao.CategoryDao;
import com.intflag.dao.impl.CategoryDaoImpl;
import com.intflag.domain.Category;
import com.intflag.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	
	CategoryDao cd = new CategoryDaoImpl();
	
	@Override
	public List<Category> findAll() throws Exception {
		return cd.findAll();
	}

	@Override
	public Category findCategoryById(String cid) throws Exception {
		return cd.findById(cid);
	}

	@Override
	public void updateCategory(Category category) throws Exception {
		cd.updateCategory(category);
	}

	@Override
	public void deleteById(String cid) throws Exception {
		cd.deleteById(cid);
	}

	@Override
	public void addCategory(Category category) throws Exception {
		cd.addCategory(category);
	}

	@Override
	public Category findCategoryByName(String cname) throws Exception {
		return cd.findByName(cname);
	}

}
