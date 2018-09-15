package com.intflag.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intflag.domain.Cart;
import com.intflag.domain.CartItem;
import com.intflag.domain.Product;
import com.intflag.service.ProductService;
import com.intflag.service.impl.ProductServiceImpl;


/**
 * 和购物车相关的servlet
 *
 */
public class CartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 获取购物车
	 * @param request
	 * @return
	 */
	public Cart getCart(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		return cart;
	}
	/**
	 * 加入购物车
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取商品id，count
		String pid = request.getParameter("pid");
		int count = Integer.parseInt(request.getParameter("count"));
		
		//调用service找到该商品
		ProductService ps = new ProductServiceImpl();
		Product product = ps.findProductById(pid);
		//封装成cartItem
		CartItem cartItem = new CartItem(product, count);
		//加入购物车
		Cart cart = getCart(request);
		cart.add2Cart(cartItem);
		//重定向
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	/**
	 * 从购物车删除购物车项
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String removeFromCart(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取商品id
		String pid = request.getParameter("pid");
		
		//从购物车删除
		Cart cart = getCart(request);
		cart.removeFormCart(pid);
		//重定向
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	public String clearCart(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//清空购物车
		Cart cart = getCart(request);
		cart.clearCart();
		//重定向
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	
}
