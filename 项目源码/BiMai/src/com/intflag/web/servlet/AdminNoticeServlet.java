package com.intflag.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.intflag.domain.Admin;
import com.intflag.domain.Notice;
import com.intflag.service.NoticeService;
import com.intflag.service.impl.NoticeServiceImpl;


/**
 * 后台公告模块
 */
public class AdminNoticeServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	/**
	 * 展示所有公告
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findNoticeAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//调用service查找所有公告
		NoticeService ns = new NoticeServiceImpl();
		List<Notice> noticeList = ns.findNoticeAll();
		//放入域中，转发
		request.setAttribute("noticeList", noticeList);
		return "/admin/notice/list.jsp";
	}
	/**
	 * 按照ID删除公告
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String removeNotice(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取公告ID
		String nid = request.getParameter("nid");
		//调用service删除公告
		NoticeService ns = new NoticeServiceImpl();
		ns.deleteNoticeById(nid);
		
		response.getWriter().print("OK");
		return null;
	}
	/**
	 * 发布公告
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String addNotices(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取表单数据
		Notice notice = new Notice();
		BeanUtils.populate(notice, request.getParameterMap());
		
		//从session中取出该管理员
		Admin admin = (Admin) request.getSession().getAttribute("administrator");
		notice.setAdmin(admin);
		notice.setNdate(new Date());
		
		//调用service发布公告
		NoticeService ns = new NoticeServiceImpl();
		ns.addNotice(notice);
		response.sendRedirect(request.getContextPath()+"/adminNotice?method=findNoticeAll");
		return null;
	}
	/**
	 * 编辑公告
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String editNotices(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取表单数据
		Notice notice = new Notice();
		BeanUtils.populate(notice, request.getParameterMap());
		Admin admin = (Admin) request.getSession().getAttribute("administrator");
		notice.setAdmin(admin);
		notice.setNdate(new Date());
		
		//调用service更新公告
		NoticeService ns = new NoticeServiceImpl();
		ns.updateNotice(notice);
		response.sendRedirect(request.getContextPath()+"/adminNotice?method=findNoticeAll");
		return null;
	}
	/**
	 * 转发编辑界面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String addEditUI(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取公告ID
		String nid = request.getParameter("nid");
		//调用service查找公告
		NoticeService ns = new NoticeServiceImpl();
		Notice notice = ns.findNoticeById(nid);
		
		request.setAttribute("notice", notice);
		return "/admin/notice/edit.jsp";
	}
}
