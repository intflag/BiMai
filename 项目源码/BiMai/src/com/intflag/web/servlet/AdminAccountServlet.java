package com.intflag.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.intflag.domain.Admin;
import com.intflag.service.AdminService;
import com.intflag.service.impl.AdminServiceImpl;


/**
 * 后台管理员模块
 * @author LGX
 *
 */
public class AdminAccountServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 管理员登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取表单数据
		Admin admin = new Admin();
		BeanUtils.populate(admin, request.getParameterMap());
		//调用service完成登录
		AdminService as = new AdminServiceImpl();
		Admin administrator = as.login(admin);
		if (administrator != null) {
			//将管理员放入域中，重定向到后台首页
			request.getSession().setAttribute("administrator", administrator);
			response.sendRedirect(request.getContextPath()+"/admin/index.jsp");
		} else {
			response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
		}
		return null;
	}
	/**
	 * 管理员退出
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.getSession().removeAttribute("administrator");
		response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
		return null;
	}
}
