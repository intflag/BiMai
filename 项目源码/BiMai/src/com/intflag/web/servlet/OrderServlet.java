package com.intflag.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.intflag.domain.Cart;
import com.intflag.domain.CartItem;
import com.intflag.domain.Order;
import com.intflag.domain.OrderItem;
import com.intflag.domain.PageBean;
import com.intflag.domain.User;
import com.intflag.service.OrderService;
import com.intflag.service.impl.OrderServiceImpl;
import com.intflag.utils.PaymentUtil;
import com.intflag.utils.UUIDUtils;

/**
 * 与订单相关的servlet
 */
public class OrderServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	public String add(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 1、判断用户是否登录，如登录可以下单，，如未登录转发到登录页面
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "您还未登录，请先登录~~~");
			return "/jsp/msg.jsp";
		}
		// 2、封装数据
		Order order = new Order();

		// 1.1、订单id
		order.setOid(UUIDUtils.getId());

		// 1.2、下单时间
		order.setOrdertime(new Date());

		// 1.3、总金额
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		order.setTotal(cart.getTotal());

		// 1.4、订单的所有订单项
		/**
		 * 先获取Cart中的items 遍历items，组装成orderItem 将orderItem添加到order的list中
		 */
		for (CartItem cartItem : cart.getItems()) {
			OrderItem orderItem = new OrderItem();

			orderItem.setItemid(UUIDUtils.getId());// 设置id
			orderItem.setCount(cartItem.getCount());// 设置数量
			orderItem.setProduct(cartItem.getProduct());// 设置商品
			orderItem.setSubtotal(cartItem.getSubtotal());// 设置小计
			orderItem.setOrder(order);// 设置属于哪个订单

			order.getItems().add(orderItem);// 添加到list中
		}
		// 1.5、设置用户
		order.setUser(user);

		// 3、调用service 添加订单
		OrderService os = new OrderServiceImpl();
		os.addOrder(order);

		// 4、清空购物车
		cart.clearCart();
		request.getSession().removeAttribute("cart");

		// 5、将order放入域中，请求转发
		request.getSession().setAttribute("order", order);
		response.sendRedirect(request.getContextPath() + "/jsp/order_info.jsp");

		return null;
	}

	/**
	 * 分页查找我的订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAllByPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		// 判断用户是否登录
		User user = (User) session.getAttribute("user");
		if (user == null) {
			request.setAttribute("msg", "您还未登录，请先登录~~~");
			return "/jsp/msg.jsp";
		}
		// 获取当前页，设置条数
		int currPage = Integer.parseInt(request.getParameter("currPage"));
		int pageSize = 3;

		// 调用service分页查询订单 参数：currPage，pageSize，user
		OrderService os = new OrderServiceImpl();
		PageBean<Order> pageBean = os.findAllByPage(currPage, pageSize, user);

		// 将pageBean放入域中，请求转发
		request.setAttribute("OrderPageBean", pageBean);
		return "/jsp/order_list.jsp";
	}

	/**
	 * 根据订单编号查找商品
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String findOrderById(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 获取oid
		String oid = request.getParameter("oid");
		// 调用service根据oid查找订单
		OrderService os = new OrderServiceImpl();
		Order order = os.findOrderById(oid);
		// 得到订单，放入域中，请求转发
		request.setAttribute("order", order);
		return "/jsp/order_info.jsp";
	}

	/**
	 * 支付
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String pay(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 获取收货信息
		String oid = request.getParameter("oid");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String telephone = request.getParameter("telephone");

		// 调用service找到该订单，封装收货信息
		OrderService os = new OrderServiceImpl();
		Order order = os.findOrderById(oid);
		order.setName(name);
		order.setAddress(address);
		order.setTelephone(telephone);

		// 更新订单
		os.updateOrder(order);
		// 组织发送支付公司需要哪些数据
		String pd_FrpId = request.getParameter("pd_FrpId");
		String p0_Cmd = "Buy";
		String p1_MerId = ResourceBundle.getBundle("merchantInfo").getString("p1_MerId");
		String p2_Order = oid;
		String p3_Amt = "0.01";//设置金额
		String p4_Cur = "CNY";
		String p5_Pid = "";
		String p6_Pcat = "";
		String p7_Pdesc = "";
		// 支付成功回调地址 ---- 第三方支付公司会访问、用户访问
		// 第三方支付可以访问网址
		String p8_Url = ResourceBundle.getBundle("merchantInfo").getString("responseURL");
		String p9_SAF = "";
		String pa_MP = "";
		String pr_NeedResponse = "1";
		// 加密hmac 需要密钥
		String keyValue = ResourceBundle.getBundle("merchantInfo").getString("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);

		// 发送给第三方
		StringBuffer sb = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
		sb.append("p0_Cmd=").append(p0_Cmd).append("&");
		sb.append("p1_MerId=").append(p1_MerId).append("&");
		sb.append("p2_Order=").append(p2_Order).append("&");
		sb.append("p3_Amt=").append(p3_Amt).append("&");
		sb.append("p4_Cur=").append(p4_Cur).append("&");
		sb.append("p5_Pid=").append(p5_Pid).append("&");
		sb.append("p6_Pcat=").append(p6_Pcat).append("&");
		sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		sb.append("p8_Url=").append(p8_Url).append("&");
		sb.append("p9_SAF=").append(p9_SAF).append("&");
		sb.append("pa_MP=").append(pa_MP).append("&");
		sb.append("pd_FrpId=").append(pd_FrpId).append("&");
		sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		sb.append("hmac=").append(hmac);

		response.sendRedirect(sb.toString());
		return null;
	}
	/**
	 * 支付成功之后的回调
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public String callback(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String rb_BankId = request.getParameter("rb_BankId");
		String ro_BankOrderId = request.getParameter("ro_BankOrderId");
		String rp_PayDate = request.getParameter("rp_PayDate");
		String rq_CardNo = request.getParameter("rq_CardNo");
		String ru_Trxtime = request.getParameter("ru_Trxtime");
		// 身份校验 --- 判断是不是支付公司通知你
		String hmac = request.getParameter("hmac");
		String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
				"keyValue");

		// 自己对上面数据进行加密 --- 比较支付公司发过来hamc
		boolean isValid = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
				r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
				r8_MP, r9_BType, keyValue);
		if (isValid) {
			// 响应数据有效
			if (r9_BType.equals("1")) {
				// 浏览器重定向
				request.setAttribute("msg", "您的订单号为:" + r6_Order + ",金额为:"
						+ r3_Amt + "已经支付成功,等待发货~~");

			} else if (r9_BType.equals("2")) {
				// 服务器点对点 --- 支付公司通知你
				System.out.println("付款成功！222");
				// 修改订单状态 为已付款
				// 回复支付公司
				response.getWriter().print("success");
			}

			// 修改订单状态
			OrderService s = new OrderServiceImpl();
			Order order = s.findOrderById(r6_Order);
			order.setState(1);

			s.updateOrder(order);

		} else {
			// 数据无效
			System.out.println("数据被篡改！");
		}

		return "/jsp/msg.jsp";

	}
	public String updateState(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//1、获取订单id和要修改成的状态
		String oid = request.getParameter("oid");
		String state = request.getParameter("state");
		//2、调用service方法
		OrderService os = new OrderServiceImpl();
		Order order = os.findOrderById(oid);
		order.setState(Integer.parseInt(state));
		os.updateOrder(order);
		//3、查询状态为state的订单，将结果放入域中，请求转发
		request.setAttribute("msg", "订单已完成！");
		return "/jsp/msg.jsp";
	}
}
