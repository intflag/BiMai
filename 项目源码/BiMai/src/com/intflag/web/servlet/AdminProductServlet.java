package com.intflag.web.servlet;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intflag.domain.Category;
import com.intflag.domain.PageBean;
import com.intflag.domain.Product;
import com.intflag.service.CategoryService;
import com.intflag.service.ProductService;
import com.intflag.service.impl.CategoryServiceImpl;
import com.intflag.service.impl.ProductServiceImpl;

public class AdminProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 分页查询所有商品
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String findByPage(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取当前页，设置一个pageSize
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		int pageSize = 10;
		
		//调用service，返回pageBean
		ProductService ps = new ProductServiceImpl();
		PageBean<Product> pageBean = ps.findByPage(currPage,pageSize);
		//放入域中，请求转发
		request.setAttribute("pageBean", pageBean);
		return "/admin/product/list.jsp";
	}
	/**
	 * 跳转到添加商品页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String addUI(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//查询所有分类，返回list
		CategoryService cs = new CategoryServiceImpl();
		List<Category> list = cs.findAll();
		//添加到域中
		request.setAttribute("cList", list);
		
		return "/admin/product/add.jsp";
	}
	/**
	 * 删除商品
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String removeProduct(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取商品ID，当前页
		String pid = request.getParameter("pid");
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		//调用删除方法删除商品，跳转到指定页
		ProductService ps = new ProductServiceImpl();
		ps.deleteById(pid);
		
		response.sendRedirect(request.getContextPath()+"/adminProduct?method=findByPage&currPage="+currPage);
		response.getWriter().print("OK");
		return null;
	}
	/**
	 * 查询数据，跳转编辑商品页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String addEditUI(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取商品ID
		String pid = request.getParameter("pid");
		//找到该商品
		ProductService ps = new ProductServiceImpl();
		Product product = ps.findProductById(pid);
		
		//查询所有分类，返回list
		CategoryService cs = new CategoryServiceImpl();
		List<Category> list = cs.findAll();
		
		//将数据放入域中，跳转到编辑页
		request.setAttribute("product", product);
		request.setAttribute("cList", list);
		
		return "/admin/product/edit.jsp";
	}
	/**
	 * 判断商品是否已经存在
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String isProductExist(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		//获取商品名称
		String pname = request.getParameter("pname");
		
		//根据名称查找该商品
		ProductService ps = new ProductServiceImpl();
		Product product = ps.findUniqueProductByName(pname);
		
		if (product != null) {
			out.print("NO");
		} else {
			out.print("YES");
		}
		
		return null;
	}
	
}
