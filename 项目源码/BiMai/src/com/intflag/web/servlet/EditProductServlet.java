package com.intflag.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.intflag.domain.Category;
import com.intflag.domain.Product;
import com.intflag.service.ProductService;
import com.intflag.service.impl.ProductServiceImpl;
import com.intflag.utils.UUIDUtils;
import com.intflag.utils.UploadUtils;

public class EditProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 1、封装参数

			// 创建map集合，保存前台传递的数据
			Map<String, Object> map = new HashMap<String, Object>();

			// 创建磁盘文件项工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 创建核心上传对象
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 解析request
			List<FileItem> list = upload.parseRequest(request);
			// 遍历集合
			for (FileItem fi : list) {
				// 判断是否普通的上传组件
				if (fi.isFormField()) {
					// 普通组件
					map.put(fi.getFieldName(), fi.getString("UTF-8"));
				} else {
					// 上传组件
					// 获取文件名称
					String name = fi.getName();
					// 获取文件真实名称
					String realName = UploadUtils.getRealName(name);
					// 获取随机名称
					String uuidName = UploadUtils.getUUIDName(realName);
					System.out.println("编辑商品图片===="+realName);
					if (realName != null && realName.length() != 0) {
						// 获取文件存放路径
						String path = this.getServletContext().getRealPath(
								File.separator + "products");

						// 获取文件流
						InputStream is = fi.getInputStream();
						// 保存文件
						FileOutputStream os = new FileOutputStream(new File(path,
								uuidName));

						IOUtils.copy(is, os);
						is.close();
						os.close();

						// 删除临时文件
						fi.delete();

						// 在map中设置文件位置
						map.put(fi.getFieldName(), "products" + File.separator
								+ uuidName);
					}
				}
			}

			Product p = new Product();

			BeanUtils.populate(p, map);

			// 封装商品时间
			p.setPdate(new Date());
			// 封装category
			Category c = new Category();
			c.setCid((String) map.get("cid"));
			p.setCategory(c);
			//封装图片
			if (p.getPimage() == null|| p.getPimage().length()==0) {
				ProductService ps = new ProductServiceImpl();
				Product oldP = ps.findProductById(p.getPid());
				p.setPimage(oldP.getPimage());
			}

			// 2、调用service完成添加
			ProductService ps = new ProductServiceImpl();
			ps.updateProduct(p);

			// 3、重定向
			response.sendRedirect(request.getContextPath()
					+ "/adminProduct?method=findByPage&currPage=1");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "商品修改失败!");
			request.getRequestDispatcher("/jsp/msg.jsp").forward(request,
					response);
			return;
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
