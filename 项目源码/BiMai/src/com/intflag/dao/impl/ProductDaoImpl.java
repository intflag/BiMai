package com.intflag.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.intflag.dao.ProductDao;
import com.intflag.domain.Category;
import com.intflag.domain.Product;
import com.intflag.utils.DataSourceUtils;

public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Product> findNew() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM product WHERE is_hot = 0 ORDER BY pdate DESC LIMIT 9";
		return qr.query(sql, new BeanListHandler<Product>(Product.class));
	}

	@Override
	public List<Product> findHot() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM product WHERE is_hot = 1 ORDER BY pdate DESC LIMIT 6";
		return qr.query(sql, new BeanListHandler<Product>(Product.class));
	}

	@Override
	public Product findById(String pid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM product p,category c WHERE p.cid=c.cid AND p.pid = ?";
		List<Map<String, Object>> query = qr.query(sql, new MapListHandler(),
				pid);
		Product product = null;
		for (Map<String, Object> map : query) {
			product = new Product();
			BeanUtils.populate(product, map);
			Category category = new Category();
			BeanUtils.populate(category, map);
			product.setCategory(category);
		}
		return product;
	}

	@Override
	public List<Product> findByPage(int currPage, int pageSize, String cid)
			throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM product WHERE cid = ? LIMIT ?,?";
		return qr.query(sql, new BeanListHandler<Product>(Product.class), cid,
				(currPage - 1) * pageSize, pageSize);
	}

	@Override
	public int getTotalCount(String cid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT COUNT(*) FROM product WHERE cid = ?";
		return ((Long) qr.query(sql, new ScalarHandler(), cid)).intValue();
	}

	@Override
	public List<Product> findByPage(int currPage, int pageSize)
			throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM product LIMIT ?,?";
		return qr.query(sql, new BeanListHandler<Product>(Product.class),
				(currPage - 1) * pageSize, pageSize);
	}

	@Override
	public int getTotalCount() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT COUNT(*) FROM product";
		return ((Long) qr.query(sql, new ScalarHandler())).intValue();
	}

	@Override
	public void addProduct(Product p) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "INSERT INTO product(pid,pname,market_price,shop_price,pimage,pdate,is_hot,pdesc,pflag,cid) VALUES (?,?,?,?,?,?,?,?,?,?)";
		qr.update(sql, p.getPid(), p.getPname(), p.getMarket_price(),
				p.getShop_price(), p.getPimage(), p.getPdate(), p.getIs_hot(),
				p.getPdesc(), p.getPflag(), p.getCategory().getCid());
	}

	@Override
	public void deleteById(String pid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "DELETE FROM product WHERE pid = ?";
		qr.update(sql, pid);
	}

	@Override
	public void updateProduct(Product p) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "UPDATE product SET pname=?,market_price=?,shop_price=?,pimage=?,pdate=?,is_hot=?,pdesc=?,pflag=?,cid=? WHERE pid=?";
		qr.update(sql, p.getPname(), p.getMarket_price(), p.getShop_price(),
				p.getPimage(), p.getPdate(), p.getIs_hot(), p.getPdesc(),
				p.getPflag(), p.getCategory().getCid(), p.getPid());
	}

	@Override
	public List<Product> findProductByName(String word) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM product WHERE pname LIKE ? LIMIT 0,10";
		return qr.query(sql, new BeanListHandler<Product>(Product.class),"%"+word+"%");
	}

	@Override
	public Product findUniqueByName(String pname) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "SELECT * FROM product p,category c WHERE p.cid=c.cid AND p.pname = ?";
		List<Map<String, Object>> query = qr.query(sql, new MapListHandler(),
				pname);
		Product product = null;
		for (Map<String, Object> map : query) {
			product = new Product();
			BeanUtils.populate(product, map);
			Category category = new Category();
			BeanUtils.populate(category, map);
			product.setCategory(category);
		}
		return product;
	}

}
