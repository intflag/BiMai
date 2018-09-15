package com.intflag.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.intflag.domain.Category;
import com.intflag.service.CategoryService;
import com.intflag.service.impl.CategoryServiceImpl;


/**
 * 和分类相关的servlet
 */
public class CategoryServlet extends BaseServlet {
	
	private static final long serialVersionUID = 1L;
	/**
	 * 查询所有分类
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("UTF-8");
		//调用service获取所有分类
		CategoryService cs = new CategoryServiceImpl();
		List<Category> cList = cs.findAll();
		//将分类转换成json格式返回
		Gson gson = new Gson();
		String json = gson.toJson(cList);
		response.getWriter().print(json);
		return null;
	}
	/**
	 * 根据分类ID查询分类
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public String findCategoryById(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("UTF-8");
		//获取分类ID
		String cid = request.getParameter("cid");
		//调用service根据分类ID获取分类
		CategoryService cs = new CategoryServiceImpl();
		Category c = cs.findCategoryById(cid);
		if (c!=null) {
			response.getWriter().print(c.getCname());
		}
		return null;
	}
}
