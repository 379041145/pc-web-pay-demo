<%@page import="java.util.Random"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@page import="cn.beecloud.BeeCloud"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.beecloud.*"%>
<%
	/* *
	 功能：商户结算跳转至指定支付方式页面
	 版本：3.3
	 日期：2015-03-20
	 说明：
	 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
	 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

	 //***********页面功能说明***********
	 该页面可以在本机电脑测试。
	 //********************************
	 * */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>redirect</title>
</head>
<body>
	<%
		//以下代码用session获得交易信息，可由商户根据自己的项目决定实现方式
		String return_url = (String) session.getAttribute("return_url");
		String seller_email = (String) session.getAttribute("seller_email");
		String out_trade_no = (String) session.getAttribute("out_trade_no");
		String subject = (String) session.getAttribute("subject");
		String total_fee = (String) session.getAttribute("total_fee");
		String body = (String) session.getAttribute("body");
		String show_url = (String) session.getAttribute("show_url");
		String anti_phishing_key = (String) session
				.getAttribute("anti_phishing_key");
		String exter_invoke_ip = (String) session
				.getAttribute("exter_invoke_ip");

		String type = request.getParameter("paytype");
		
		//模拟商户的交易编号，实际代码中请删除
		Random random = new Random();
		out_trade_no = "20150319" + random.nextInt(10000);

		BeeCloud.registerApp("c5d1cba1-5e3f-4ba0-941d-9b0a371fe719", "39a7a518-9ac8-4a9e-87bc-7885f33cf18c");

		if (type.equals("alipay")) {
			BeeCloud.initAlipay("2088711322600312", "nvn7fcz0t3mvj6v43itwic32b7eqbh07", "utf-8");
			String url = BCPay.getAlipayUrl(return_url, seller_email,
					out_trade_no, subject, total_fee, body, show_url,
					anti_phishing_key, exter_invoke_ip);
			System.out.println(url);
			out.println(url);
		}

		System.out.println(type);
	%>
</body>
</html>