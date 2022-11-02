<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %> 
<%
	int pageview = 10; // 한페이지당 보여지는 데이터 개수
	int startpage = 0; //시작 페이지 값
	double pagenumber = 1; //페이징 개수
	
	String pt = request.getParameter("search");
	String pgno = request.getParameter("page"); //페이징번호 파라미터
	String search_select = request.getParameter("search_select"); // 검색 셀렉트
	String andsql = ""; // 검색할때 사용
	if (pt == null || pt == "") {
		andsql = " ";//sql 문법상 띄어쓰기가 적용되도록 하기 위함
	} else {
		andsql = " where p_name='" + pt + "' "; //sql문법추가시에도 띄어쓰기 확인
	}
	String ct = "select count(*) as ct from create_product"/*  + andsql */; // 데이터의 총 개수 확인
	PreparedStatement psct = null;
	PreparedStatement ps = null;
	List<Map<String, Object>> AL = null;
	int total = 0;
	
	try {
		psct = CON.prepareStatement(ct);
		ResultSet rsct = psct.executeQuery();
	
		while (rsct.next()) {
			total = rsct.getInt("ct");
		}
	
		if (pgno == null || pgno == "") {
			startpage = 0;
		} else {//페이지 2번부터 적용되는 사항
			startpage = (Integer.parseInt(pgno) - 1) * pageview;
		}
	
		//페이징 총 개수 파악
		if (total % pageview == 0) {
			pagenumber = total / pageview;
		} else {
			pagenumber = (total / pageview) + 1;
		}
	
		String sql = "select * from create_product order by pidx desc limit " + startpage + "," + pageview; //데이터 리스트		
		ps = CON.prepareStatement(sql);
	
		ResultSet RS = ps.executeQuery();
		AL = new ArrayList<>();
		while (RS.next()) {
			Map<String, Object> MP = new HashMap<>();
			MP.put("pidx", RS.getString("pidx"));
		  	MP.put("d_code", RS.getString("d_code"));
		  	MP.put("s_code", RS.getString("s_code"));
		  	MP.put("p_code", RS.getString("p_code"));
		  	MP.put("P_name", RS.getString("P_name"));
		  	MP.put("p_text", RS.getString("p_text"));
		  	MP.put("p_money", RS.getString("p_money"));
		  	MP.put("p_sale", RS.getString("p_sale"));
		  	MP.put("p_salemoney", RS.getString("p_salemoney"));
		  	MP.put("p_ea", RS.getString("p_ea"));
		  	MP.put("p_use", RS.getString("p_use"));
		  	MP.put("p_sold", RS.getString("p_sold"));
		  	MP.put("p_img1", RS.getString("p_img1"));
		  	MP.put("p_img2", RS.getString("p_img2"));
		  	MP.put("p_img3", RS.getString("p_img3"));
		  	MP.put("p_info", RS.getString("p_info"));
		  	MP.put("p_indate", RS.getString("p_indate"));
			AL.add(MP);
			AL.add(MP);
		}
	} catch (Exception e) {
	
	}
%>