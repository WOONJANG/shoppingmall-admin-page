<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./charset.jsp" %>
<%@ include file="./dbconnect.jsp" %>

<%
	ArrayList<String> admin_login_log = new ArrayList<String>();	

	LocalDateTime TIME = LocalDateTime.now();
	DateTimeFormatter DTF = DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm:ss");
	String NOW = TIME.format(DTF);
	
	String LOGIN_ID = request.getParameter("ID");
	
	admin_login_log.add(LOGIN_ID);
	admin_login_log.add(NOW);
	
	
	String SQL = "insert into admin_login_log values ('0',?,?);";
	try{	
		PreparedStatement PS = CON.prepareStatement(SQL);
	
		PS.setString(1, admin_login_log.get(0));
		PS.setString(2, admin_login_log.get(1));
	
	int n = 0;
		n = PS.executeUpdate();
	if(n > 0) {
		out.print("<script>alert('관리자 로그인되었습니다')</script>");
		out.print("<script>location.href='./admin_main.jsp'</script>");
		session.setAttribute("ID", LOGIN_ID);
	}
	else {
		out.print("<script>alert('승인된 관리자만 로그인이 가능합니다')</script>");
		throw new Exception("ERROR");
	}
	
	}catch(Exception e){
		out.print("DB CONNECT FAIL OR TABLE ERROR");
		out.print("<script>alert('승인된 관리자만 로그인이 가능합니다')</script>");
	}finally{	
		if(CON != null){
			CON.close();
		}
	}
%>
<% String SESSIONID = LOGIN_ID;
	session.setAttribute("mname", SESSIONID);%>