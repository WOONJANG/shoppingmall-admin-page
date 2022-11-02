<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./charset.jsp" %>
<%@ include file="./dbconnect.jsp" %>
<%
	ArrayList<String> admin_notice = new ArrayList<String>();	
	
	LocalDateTime TIME = LocalDateTime.now();
	DateTimeFormatter DTF = DateTimeFormatter.ofPattern("YYYY-MM-dd");
	String NOW = TIME.format(DTF);
	String notice_view = "";
	String notice_view2 = request.getParameter("notice_view");
	if(notice_view2 != ""){
		notice_view = "on";
	}else if (notice_view2 == ""){
		notice_view = "NULL";
	}
	String notice_title = request.getParameter("notice_title");
	String notice_writer = request.getParameter("notice_writer");
	String notice_file = request.getParameter("notice_file");
	String notice_text = request.getParameter("notice_text");
	
	admin_notice.add(notice_view);
	admin_notice.add(notice_title);
	admin_notice.add(notice_writer);
	admin_notice.add(notice_file);
	admin_notice.add(notice_text);
	admin_notice.add(NOW);
	
// 	out.print(admin_notice);
	
	String SQL = "insert into admin_notice values('0',?,?,?,?,?,'0',?)";
	
	try{	
		PreparedStatement PS = CON.prepareStatement(SQL);
		
		PS.setObject(1, admin_notice.get(0));
		PS.setObject(2, admin_notice.get(1));
		PS.setObject(3, admin_notice.get(2));
		PS.setObject(4, admin_notice.get(3));
		PS.setObject(5, admin_notice.get(4));
		PS.setObject(6, admin_notice.get(5).substring(0,10));
		
		
		
		int n = 0;
		n = PS.executeUpdate();
	if(n > 0) {
		out.print("<script>alert('공지 저장 완료');location.href='admin_notice.jsp';</script>");
		
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

