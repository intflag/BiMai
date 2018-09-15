package com.intflag.web.servlet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.intflag.domain.PageBean;
import com.intflag.domain.Product;
import com.intflag.service.ProductService;
import com.intflag.service.impl.ProductServiceImpl;


/**
 * 和商品相关的servlet
 */
public class ProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 根据ID查询商品详情
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String findProductById(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获得商品id
		String pid = request.getParameter("id");
		//调用service根据id查找商品
		ProductService ps = new ProductServiceImpl();
		Product p = ps.findProductById(pid);
		//将商品放入域中，跳转到商品详情页
		if (p != null) {
			request.setAttribute("product", p);
			return "/jsp/product_info.jsp";
		} else {
			request.setAttribute("msg", "不好意思亲，您查看的商品没有找到，再看看别的吧！");
			return "/jsp/msg.jsp";
		}
	}
	public String findByPage(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//获取类别，当前页，设置一个pageSize
		String cid = request.getParameter("cid");
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		int pageSize = 12;
		
		//调用service，返回pageBean
		ProductService ps = new ProductServiceImpl();
		PageBean<Product> pageBean = ps.findByPage(currPage,pageSize,cid);
		//放入域中，请求转发
		request.setAttribute("pageBean", pageBean);
		return "/jsp/product_list.jsp";
	}
	/**
	 * 异步模糊查询商品
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String searchAll(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		//1、获取输入框的内容
		String word = request.getParameter("inputVal");
		//2、调用service，对商品进行模糊查询，返回结果集
		ProductService pd = new ProductServiceImpl();
		List<Product> list = pd.findProductByName(word);
		//3、封装成json格式数据，写入流中
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.getWriter().print(json);
		return null;
	}
}
