<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %> 
<%
	int pageview = 5; // 한페이지당 보여지는 데이터 개수
	int startpage = 0; //시작 페이지 값
	double pagenumber = 1; //페이징 개수
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String pt = request.getParameter("search");
	String pgno = request.getParameter("page"); //페이징번호 파라미터
	String andsql = ""; // 검색할때 사용
	if (pt == null || pt == "") {
		andsql = " ";//sql 문법상 띄어쓰기가 적용되도록 하기 위함
	} else {
		andsql = " where id='" + pt + "' "; //sql문법추가시에도 띄어쓰기 확인
	}
	String ct = "select count(*) as ct from admin_notice"/*  + andsql */; // 데이터의 총 개수 확인
	PreparedStatement psct = null;
	PreparedStatement ps = null;
	List<Map<String, Object>> data = null;
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
	
		String sql = "select * from admin_notice order by nidx desc limit " + startpage + "," + pageview; //데이터 리스트		
		ps = CON.prepareStatement(sql);
		//ps.setInt(1, pageview);//sql에 ?사용시 자료형에 맞춰서 값을 넣어줌
	
		ResultSet rs = ps.executeQuery();
		data = new ArrayList<>();
		while (rs.next()) {
			Map<String, Object> mp = new HashMap<>();
			mp.put("nidx", rs.getString("nidx"));
			mp.put("ntitle", rs.getString("ntitle"));
			mp.put("nwriter", rs.getString("nwriter"));
			mp.put("ndate", rs.getString("ndate"));
			mp.put("nview", rs.getString("nview").substring(0, 10));
			data.add(mp);
			
		}
	} catch (Exception e) {
	
	}
	

%>