<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp" %>
<%
	int pageview = 10; // 한페이지당 보여지는 데이터 개수
	int startpage = 0; //시작 페이지 값
	double pagenumber = 1; //페이징 개수
	
	String pgno = request.getParameter("page"); //페이징번호 파라미터
	String search_page = request.getParameter("cate_search");
	String ct = "SELECT COUNT(*) AS ct FROM create_category WHERE d_name LIKE '%"+ search_page +"%';";
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
	
		String sql = "select * from create_category order by cide desc limit " + startpage + "," + pageview; //데이터 리스트		
		ps = CON.prepareStatement(sql);
		//ps.setInt(1, pageview);//sql에 ?사용시 자료형에 맞춰서 값을 넣어줌
	
		ResultSet RS = ps.executeQuery();
		AL = new ArrayList<>();
		while (RS.next()) {
			Map<String, Object> MP = new HashMap<>();
			MP.put("cide", RS.getString("cide"));
		  	MP.put("catecode", RS.getString("catecode"));
		  	MP.put("d_code", RS.getString("d_code"));
		  	MP.put("d_name", RS.getString("d_name"));
		  	MP.put("s_code", RS.getString("s_code"));
		  	MP.put("s_name", RS.getString("s_name"));
		  	MP.put("codeuse", RS.getString("codeuse"));
		  	MP.put("indate", RS.getString("indate"));
		  	AL.add(MP);
			
		}
	} catch (Exception e) {
	
	}
%>