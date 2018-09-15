package com.intflag.web.servlet;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.intflag.domain.User;
import com.intflag.service.UserService;
import com.intflag.service.impl.UserServiceImpl;
import com.intflag.utils.LocalDateUtils;
import com.intflag.utils.Send163Email;
import com.intflag.utils.UUIDUtils;
/**
 * 和用户相关的servlet
 */
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 用户注册
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String register(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取表单数据并封装
		User user = new User();
		BeanUtils.populate(user, request.getParameterMap());
		user.setUid(UUIDUtils.getId());
		System.out.println(user);
		//比对激活码，如果错误终止，正确继续
		String email_activeCode = (String) request.getSession().getAttribute("email_activeCode");
		System.out.println(email_activeCode+"   "+user.getCode());
		if (!(email_activeCode != null && email_activeCode.equalsIgnoreCase(user.getCode()))) {
			request.setAttribute("register_msg", "激活码有误，请重新注册");
			return "/jsp/account.jsp";
		}
		//调用service完成注册
		UserService us = new UserServiceImpl();
		boolean flag = us.register(user);
		//如果注册成功跳转到首页，并将用户放入session域中
		if (flag) {
			request.getSession().setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		} else {
			request.setAttribute("register_msg", "注册失败，请重新注册");
			return "/jsp/account.jsp";
		}
		return null;
	}
	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取表单数据并封装
		User user = new User();
		BeanUtils.populate(user, request.getParameterMap());
		//调用service进行登录
		UserService us = new UserServiceImpl();
		User u = us.login(user.getUsername(),user.getPassword());
		//成功跳转到首页，失败提示注册
		if (u != null) {
			request.getSession().setAttribute("user", u);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		} else {
			request.setAttribute("login_msg", "用户名或密码错误，如果没有账号请您注册");
			return "/jsp/account.jsp";
		}
		return null;
	}
	/**
	 * 用户退出
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//销毁session，重定向到首页
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return null;
	}
	/**
	 * 异步验证用户名是否存在
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String isUserExist(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		//获取用户名
		String username = request.getParameter("username");
		//调用service查询该用户名是否存在
		UserService us = new UserServiceImpl();
		User user = us.findUser(username);
		//输出查询结果 
		if (user != null) {
			out.print("yes");
		} else {
			out.print("no");
		}
		return null;
	}
	/**
	 * 发送激活邮件
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String sendEmailActiveCode(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		//获取收件人地址
		String addressee = request.getParameter("addressee");
		//生成注册日期和激活码
		String date = LocalDateUtils.getLocalDate();
		String activeCode = UUIDUtils.getEmailActiveCode();
		//发送激活邮件
		boolean flag = Send163Email.sendMail(addressee, "亲爱的用户：<br/>您好！您于 "+date+" 通过账号"+addressee+"注册了必买商城，请您输入激活码 [ "+activeCode+" ]完成注册，此激活码有效时间为30分钟！");
		System.out.println(flag);
		if (flag) {
			request.getSession().setAttribute("email_activeCode", activeCode);
			out.print("yes");
		} else {
			out.print("no");
		}
		return null;
	}
	/**
	 * 修改用户名
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String updateUsername(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return null;
	}
}
