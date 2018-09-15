package com.intflag.dao.impl;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.intflag.dao.CategoryDao;
import com.intflag.domain.Category;
import com.intflag.utils.DataSourceUtils;

public class CategoryDaoImpl implements CategoryDao {

	@Override
	public List<Category> findAll() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM category;";
		return qr.query(sql, new BeanListHandler<Category>(Category.class));
	}

	@Override
	public Category findById(String cid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM category WHERE cid = ?";
		return qr.query(sql, new BeanHandler<Category>(Category.class),cid);
	}

	@Override
	public void updateCategory(Category category) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "UPDATE category SET cname = ? WHERE cid = ?";
		qr.update(sql,category.getCname(),category.getCid());
	}

	@Override
	public void deleteById(String cid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "DELETE FROM category WHERE cid = ?";
		qr.update(sql,cid);
	}

	@Override
	public void addCategory(Category category) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "INSERT INTO category(cid,cname) VALUES(?,?)";
		qr.update(sql, category.getCid(),category.getCname());
	}

	@Override
	public Category findByName(String cname) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM category WHERE cname = ?";
		return qr.query(sql, new BeanHandler<Category>(Category.class),cname);
	}

}
