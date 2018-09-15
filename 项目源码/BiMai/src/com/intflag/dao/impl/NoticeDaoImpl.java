package com.intflag.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.intflag.dao.NoticeDao;
import com.intflag.domain.Admin;
import com.intflag.domain.Notice;
import com.intflag.utils.DataSourceUtils;

public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<Notice> findNew() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		List<Notice> list = new ArrayList<Notice>();
		String sql = "SELECT * FROM notice n,admin a WHERE n.admin_id=a.admin_id ORDER BY ndate DESC LIMIT 10";
		
		List<Map<String, Object>> query = qr.query(sql, new MapListHandler());
		for (Map<String, Object> map : query) {
			//封装admin
			Admin admin = new Admin();
			BeanUtils.populate(admin, map);
			//封装notice
			Notice notice = new Notice();
			BeanUtils.populate(notice, map);
			
			notice.setAdmin(admin);
			list.add(notice);
		}
		return list;
	}

	@Override
	public List<Notice> findNoticeAll() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		List<Notice> list = new ArrayList<Notice>();
		String sql = "SELECT * FROM notice n,admin a WHERE n.admin_id=a.admin_id ORDER BY ndate DESC";
		
		List<Map<String, Object>> query = qr.query(sql, new MapListHandler());
		for (Map<String, Object> map : query) {
			//封装admin
			Admin admin = new Admin();
			BeanUtils.populate(admin, map);
			//封装notice
			Notice notice = new Notice();
			BeanUtils.populate(notice, map);
			
			notice.setAdmin(admin);
			list.add(notice);
		}
		return list;
	}

	@Override
	public void deleteById(String nid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "DELETE FROM notice WHERE nid = ?";
		qr.update(sql,nid);
	}

	@Override
	public Notice findNoticeById(String nid) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		Notice notice = null;
		String sql = "SELECT * FROM notice n,admin a WHERE n.admin_id=a.admin_id AND n.nid=?";
		
		List<Map<String, Object>> query = qr.query(sql, new MapListHandler(),nid);
		for (Map<String, Object> map : query) {
			//封装admin
			Admin admin = new Admin();
			BeanUtils.populate(admin, map);
			//封装notice
			notice = new Notice();
			BeanUtils.populate(notice, map);
			
			notice.setAdmin(admin);
		}
		return notice;
	}

	@Override
	public void addNotice(Notice notice) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "INSERT INTO notice(ntitle,ndesc,admin_id,ndate) VALUES(?,?,?,?)";
		qr.update(sql,notice.getNtitle(),notice.getNdesc(),notice.getAdmin().getAdmin_id(),notice.getNdate());
	}

	@Override
	public void updateNotice(Notice notice) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "UPDATE notice SET ntitle=?,ndesc=?,admin_id=?,ndate=? WHERE nid=?";
		qr.update(sql,notice.getNtitle(),notice.getNdesc(),notice.getAdmin().getAdmin_id(),notice.getNdate(),notice.getNid());
	}

}
