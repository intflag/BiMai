package com.intflag.service.impl;

import java.util.List;

import com.intflag.dao.NoticeDao;
import com.intflag.dao.impl.NoticeDaoImpl;
import com.intflag.domain.Notice;
import com.intflag.service.NoticeService;

public class NoticeServiceImpl implements NoticeService {

	NoticeDao nd = new NoticeDaoImpl();
	
	@Override
	public List<Notice> findNewNotices() throws Exception {
		return nd.findNew();
	}

	@Override
	public List<Notice> findNoticeAll() throws Exception {
		return nd.findNoticeAll();
	}

	@Override
	public void deleteNoticeById(String nid) throws Exception {
		nd.deleteById(nid);
	}

	@Override
	public Notice findNoticeById(String nid) throws Exception {
		return nd.findNoticeById(nid);
	}

	@Override
	public void addNotice(Notice notice) throws Exception {
		nd.addNotice(notice);
	}

	@Override
	public void updateNotice(Notice notice) throws Exception {
		nd.updateNotice(notice);
	}

}
