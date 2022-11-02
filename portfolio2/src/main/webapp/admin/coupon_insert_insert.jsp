<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="charset.jsp"%>
<%@ include file="dbconnect.jsp"%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String cname = request.getParameter("cname");
	String cpart = request.getParameter("cpart");
	String coupondatestart = request.getParameter("coupondatestart") + " 00:00:00";
	String coupondateend = request.getParameter("coupondateend") + " 23:59:59";
	String ctype = request.getParameter("ctype");
	String cdiscount = request.getParameter("cdiscount");
	String cmincost = request.getParameter("cmincost");
	String cimage = request.getParameter("cimage");
	String writedate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	
	String sql = "insert create_coupon values ('0',?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = CON.prepareStatement(sql);
	
	ps.setString(1, cname);
	ps.setString(2, cpart);
	ps.setString(3, coupondatestart);
	ps.setString(4, coupondateend);
	ps.setString(5, ctype);
	ps.setString(6, cdiscount);
	ps.setString(7, cmincost);
	ps.setString(8, cimage);
	ps.setString(9, writedate);
	
	int a = 0;
	a = ps.executeUpdate();
	if (a > 0) {
		out.print("<script>alert('쿠폰이 등록 되었습니다'); location.href='./admin_shopping.jsp';</script>");
	
	} else {
		out.print("<script>alert('오류발생'); history.go(-1);</script>");
	}
%>


