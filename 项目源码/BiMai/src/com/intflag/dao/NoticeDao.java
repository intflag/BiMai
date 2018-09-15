package com.intflag.dao;

import java.util.List;

import com.intflag.domain.Notice;

public interface NoticeDao {
	/**
	 * 查询最新公告
	 * @return
	 * @throws Exception
	 */
	List<Notice> findNew() throws Exception;
	/**
	 * 查询所有公告
	 * @return
	 * @throws Exception
	 */
	List<Notice> findNoticeAll() throws Exception;
	/**
	 * 按照ID删除公告
	 * @param nid
	 * @throws Exception
	 */
	void deleteById(String nid) throws Exception;
	/**
	 * 根据公告ID查找公告
	 * @param nid
	 * @return
	 * @throws Exception
	 */
	Notice findNoticeById(String nid) throws Exception;
	/**
	 * 发布公告
	 * @param notice
	 * @throws Exception
	 */
	void addNotice(Notice notice) throws Exception;
	/**
	 * 更新公告
	 * @param notice
	 * @throws Exception
	 */
	void updateNotice(Notice notice) throws Exception;

}
