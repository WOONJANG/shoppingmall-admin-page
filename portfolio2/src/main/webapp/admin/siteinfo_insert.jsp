<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./charset.jsp" %>
<%@ include file="./dbconnect.jsp" %>

<%
// 	String formlist[] = {"homepage_title","homepage_email","point_use","join_point","join_level","company_name","company_number","head_name","head_tel","business_number","tele_business_number","company_zipcode","company_addr","info_manager_name","info_manager_email","without_bankbook","bank_account_number","creditcard_use","telpay_use","bookcoupon_use","min_point","max_point","cashreceipts_use","shipping_name","shipping_cost","hopeshipping_use"};
	ArrayList<String> admin_mall_setting = new ArrayList<String>();	
	
	LocalDateTime TIME = LocalDateTime.now();
	DateTimeFormatter DTF = DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm:ss");
	String NOW = TIME.format(DTF);
	
	String homepage_title = request.getParameter("homepage_title");
	String homepage_email = request.getParameter("homepage_email");
	String point_use = request.getParameter("point_use");
	String join_point = request.getParameter("join_point");
	String join_level = request.getParameter("join_level");
	String company_name = request.getParameter("company_name");
	String company_number = request.getParameter("company_number");
	String head_name = request.getParameter("head_name");
	String head_tel = request.getParameter("head_tel");
	String business_number = request.getParameter("business_number");
	String tele_business_number = request.getParameter("tele_business_number");
	String company_zipcode = request.getParameter("company_zipcode");
	String company_addr= request.getParameter("company_addr");
	String info_manager_name = request.getParameter("info_manager_name");
	String info_manager_email = request.getParameter("info_manager_email");
	String without_bankbook = request.getParameter("without_bankbook");
	String bank_account_number = request.getParameter("bank_account_number");
	String creditcard_use = request.getParameter("creditcard_use");
	String telpay_use = request.getParameter("telpay_use");
	String bookcoupon_use = request.getParameter("bookcoupon_use");
	String min_point = request.getParameter("min_point");
	String max_point = request.getParameter("max_point");
	String cashreceipts_use = request.getParameter("cashreceipts_use");
	String shipping_name = request.getParameter("shipping_name");
	String shipping_cost = request.getParameter("shipping_cost");
	String hopeshipping_use = request.getParameter("hopeshipping_use");
	
// 	int ww = 0;
// 	while(ww < formlist.length){
// 		admin_mall_setting.add(formlist[ww]);
// 		ww++;
// 	}
	admin_mall_setting.add(homepage_title);
	admin_mall_setting.add(homepage_email);
	admin_mall_setting.add(point_use);
	admin_mall_setting.add(join_point);
	admin_mall_setting.add(join_level);
	admin_mall_setting.add(company_name);
	admin_mall_setting.add(company_number);
	admin_mall_setting.add(head_name);
	admin_mall_setting.add(head_tel);
	admin_mall_setting.add(business_number);
	admin_mall_setting.add(tele_business_number);
	admin_mall_setting.add(company_zipcode);
	admin_mall_setting.add(company_addr);
	admin_mall_setting.add(info_manager_name);
	admin_mall_setting.add(info_manager_email);
	admin_mall_setting.add(without_bankbook);
	admin_mall_setting.add(bank_account_number);
	admin_mall_setting.add(creditcard_use);
	admin_mall_setting.add(telpay_use);
	admin_mall_setting.add(bookcoupon_use);
	admin_mall_setting.add(min_point);
	admin_mall_setting.add(max_point);
	admin_mall_setting.add(cashreceipts_use);
	admin_mall_setting.add(shipping_name);
	admin_mall_setting.add(shipping_cost);
	admin_mall_setting.add(hopeshipping_use);
	admin_mall_setting.add(NOW);
	out.print(admin_mall_setting);
	
	String SQL = "insert into admin_mall_setting values('0',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	try{	
		PreparedStatement PS = CON.prepareStatement(SQL);
	
// 		int w = 0;
// 		while(w < admin_mall_setting.size()){
			
// 			PS.setString(w, admin_mall_setting.get(w-1));
			PS.setString(1, admin_mall_setting.get(0));
			PS.setString(2, admin_mall_setting.get(1));
			PS.setString(3, admin_mall_setting.get(2));
			PS.setString(4, admin_mall_setting.get(3));
			PS.setString(5, admin_mall_setting.get(4));
			PS.setString(6, admin_mall_setting.get(5));
			PS.setString(7, admin_mall_setting.get(6));
			PS.setString(8, admin_mall_setting.get(7));
			PS.setString(9, admin_mall_setting.get(8));
			PS.setString(10, admin_mall_setting.get(9));
			PS.setString(11, admin_mall_setting.get(10));
			PS.setString(12, admin_mall_setting.get(11));
			PS.setString(13, admin_mall_setting.get(12));
			PS.setString(14, admin_mall_setting.get(13));
			PS.setString(15, admin_mall_setting.get(14));
			PS.setString(16, admin_mall_setting.get(15));
			PS.setString(17, admin_mall_setting.get(16));
			PS.setString(18, admin_mall_setting.get(17));
			PS.setString(19, admin_mall_setting.get(18));
			PS.setString(20, admin_mall_setting.get(19));
			PS.setString(21, admin_mall_setting.get(20));
			PS.setString(22, admin_mall_setting.get(21));
			PS.setString(23, admin_mall_setting.get(22));
			PS.setString(24, admin_mall_setting.get(23));
			PS.setString(25, admin_mall_setting.get(24));
			PS.setString(26, admin_mall_setting.get(25));
			PS.setString(27, admin_mall_setting.get(26));
// 			w++;
// 		}
		
	int n = 0;
		n = PS.executeUpdate();
	if(n > 0) {
		out.print("<script>alert('저장완료');history.go(-1);</script>");
		
	}
	else {
		throw new Exception("ERROR");
	}
	
	}catch(Exception e){
		out.print("DB CONNECT FAIL OR TABLE ERROR");
	}finally{	
		if(CON != null){
			CON.close();
		}
	}
	
%>