package com.intflag.web.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.intflag.domain.Category;
import com.intflag.domain.PageBean;
import com.intflag.domain.Product;
import com.intflag.service.CategoryService;
import com.intflag.service.ProductService;
import com.intflag.service.impl.CategoryServiceImpl;
import com.intflag.service.impl.ProductServiceImpl;
import com.intflag.utils.UUIDUtils;



public class AdminCategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 查询所有分类
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("UTF-8");
		//调用service获取所有分类
		CategoryService cs = new CategoryServiceImpl();
		List<Category> cList = cs.findAll();
		//放入域中，转发到展示分类也
		request.setAttribute("cList", cList);
		return "/admin/category/list.jsp";
	}
	/**
	 * 编辑分类
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String editCategory(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//获取cid，cname
		String cid = request.getParameter("cid");
		String cname = request.getParameter("cname");
		
		//查询该分类是否已经存在
		CategoryService cs = new CategoryServiceImpl();
		Category oldCategory = cs.findCategoryByName(cname);
		if (oldCategory != null) {
			response.getWriter().print("NO");
			return null;
		}
		
		//调用service获取该分类
		Category category = cs.findCategoryById(cid);
		
		if (category != null) {
			category.setCname(cname);
		}
		
		//调用service更新该分类
		cs.updateCategory(category);
		
		response.getWriter().print("OK");
		
		return null;
	}
	/**
	 * 根据id删除分类
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String removeCategory(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//获取cid，cname
		String cid = request.getParameter("cid");
		
		//调用service获取该分类
		CategoryService cs = new CategoryServiceImpl();
		cs.deleteById(cid);
		
		response.getWriter().print("OK");
		
		return null;
	}
	/**
	 * 添加分类
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String addCategory(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//获取cname
		String cname = request.getParameter("cname");
		
		//查询该分类是否已经存在
		CategoryService cs = new CategoryServiceImpl();
		Category oldCategory = cs.findCategoryByName(cname);
		if (oldCategory != null) {
			response.getWriter().print("NO");
			return null;
		}
		//生成分类，调用service添加该分类
		Category category = new Category();
		category.setCid(UUIDUtils.getId());
		category.setCname(cname);
		
		cs.addCategory(category);
		
		response.getWriter().print("OK");
		
		return null;
	}
}
