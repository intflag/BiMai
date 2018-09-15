package com.intflag.web.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intflag.domain.Admin;
import com.intflag.domain.User;
import com.intflag.service.AdminService;
import com.intflag.service.UserService;
import com.intflag.service.impl.AdminServiceImpl;
import com.intflag.service.impl.UserServiceImpl;


/**
 * 后台用户管理相关的servlet
 */
public class AdminUserServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	/**
	 * 查询所有用户
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String findAllUsers(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//调用service查找所有用户
		UserService us = new UserServiceImpl();
		List<User> uList = us.findAllUsers();
		
		//将list放入域中，转发到展示所有用户页
		request.setAttribute("uList", uList);
		return "/admin/user/list.jsp";
	}
	/**
	 * 删除用户
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String removeUser(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取用户id
		String uid = request.getParameter("uid");
		//调用service完成删除
		UserService us = new UserServiceImpl();
		us.deleteUserById(uid);
		
		response.getWriter().print("OK");
		return null;
	}
	/**
	 * 修改管理员密码
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String editAdminPwd(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		//获取修改后的密码
		String password = request.getParameter("password");
		//从session取出管理员
		Admin admin = (Admin) request.getSession().getAttribute("administrator");
		
		if (admin != null) {
			admin.setAdmin_pwd(password);
		} else {
			request.setAttribute("msg", "修改失败");
			return "/jsp/msg.jsp";
		}
		
		//调用service更新数据库
		AdminService as = new AdminServiceImpl();
		as.updateAdmin(admin);
		
		//把管理员从session中移除
		request.getSession().removeAttribute("administrator");
		
		response.getWriter().print("OK");
		return null;
	}
}
