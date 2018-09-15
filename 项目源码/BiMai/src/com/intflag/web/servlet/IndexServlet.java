package com.intflag.web.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intflag.domain.Notice;
import com.intflag.domain.Product;
import com.intflag.service.NoticeService;
import com.intflag.service.ProductService;
import com.intflag.service.impl.NoticeServiceImpl;
import com.intflag.service.impl.ProductServiceImpl;
/**
 * 首页相关的servlet
 */
public class IndexServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	public String index(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//去数据库中查询最新商品、热门商品、最新公告，放入request域中，请求转发
		ProductService ps = new ProductServiceImpl();
		NoticeService ns = new NoticeServiceImpl();
		
		List<Product> newProducts = ps.findNewProducts();
		List<Product> hotProducts = ps.findHotProducts();
		List<Notice> newNotices = ns.findNewNotices();
		
		request.setAttribute("newProducts", newProducts);
		request.setAttribute("hotProducts", hotProducts);
		request.setAttribute("newNotices", newNotices);
		
		return "/jsp/index.jsp";
	}
}
