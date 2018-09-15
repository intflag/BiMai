package com.intflag.web.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intflag.dao.impl.NoticeDaoImpl;
import com.intflag.domain.Notice;
import com.intflag.service.NoticeService;
import com.intflag.service.impl.NoticeServiceImpl;



public class NoticeServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	public String findNoticeById(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取公告ID
		String nid = request.getParameter("nid");
		//调用service查询公告
		NoticeService ns = new NoticeServiceImpl();
		Notice notice = ns.findNoticeById(nid);
		//放入域中，转发到公告详情页
		request.setAttribute("notice", notice);
		return "/jsp/notice_info.jsp";
	}
}
