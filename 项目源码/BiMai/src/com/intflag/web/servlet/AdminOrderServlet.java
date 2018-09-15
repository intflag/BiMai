package com.intflag.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.intflag.domain.Order;
import com.intflag.domain.OrderItem;
import com.intflag.domain.PageBean;
import com.intflag.service.OrderService;
import com.intflag.service.impl.OrderServiceImpl;



public class AdminOrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 查找所有商品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findOrderAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 调用service查找所有商品
		OrderService os = new OrderServiceImpl();
		List<Order> orderList = os.findOrderAll();

		// 将pageBean放入域中，请求转发
		request.setAttribute("orderList", orderList);
		return "/admin/order/list.jsp";
	}
	/**
	 * 根据状态获取查找订单
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String findOrderByState(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 获取状态
		int state = Integer.parseInt(request.getParameter("state"));

		// 调用service，按照状态查询订单
		OrderService os = new OrderServiceImpl();
		List<Order> orderList = os.findOrderByState(state);

		// 将pageBean放入域中，请求转发
		request.setAttribute("orderList", orderList);
		return "/admin/order/list.jsp";
	}
	public String getDetailByOid(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		//接收oid
		String oid = request.getParameter("oid");
		//按照订单号查找订单,得到订单项
		OrderService os = new OrderServiceImpl();
		List<OrderItem> items = os.findOrderById(oid).getItems();
		
		//将list转成json格式返回
		Gson gson = new Gson();
		String json = gson.toJson(items);
		
		response.getWriter().print(json);
		return null;
	}
}
