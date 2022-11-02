<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./charset.jsp"%>
<%@include file="./dbconnect.jsp"%>
<%
		
	ArrayList<String> admin_account_update = new ArrayList<String>();	

	String id = request.getParameter("update_id");
	String password = request.getParameter("update_password");
	String name = request.getParameter("update_name");
	String email = request.getParameter("update_email");
	String tel1 = request.getParameter("update_tel1");
	String tel2 = request.getParameter("update_tel2");
	String tel3 = request.getParameter("update_tel3");
	String tel = tel1 + tel2 + tel3;
	String part = request.getParameter("part");
	String position = request.getParameter("position");
	
	LocalDateTime TIME = LocalDateTime.now();
	DateTimeFormatter DTF = DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm:ss");
	String NOW = TIME.format(DTF);
	
	
	admin_account_update.add(id);
	admin_account_update.add(password);
	admin_account_update.add(name);
	admin_account_update.add(email);
	admin_account_update.add(tel);
	admin_account_update.add(part);
	admin_account_update.add(position);
	admin_account_update.add(NOW);
	
	
	String SQL = "UPDATE admin_account SET adminpw=?, adminname=?, adminemail=?, admintel=?, adminpart=?, adminposition=?, adminjoindate=? WHERE adminid=?;";
	
	
	try {
		PreparedStatement PS = CON.prepareStatement(SQL);
		
		PS.setString(1, admin_account_update.get(1));
		PS.setString(2, admin_account_update.get(2));
		PS.setString(3, admin_account_update.get(3));
		PS.setString(4, admin_account_update.get(4));
		PS.setString(5, admin_account_update.get(5));
		PS.setString(6, admin_account_update.get(6));
		PS.setString(7, admin_account_update.get(7));
		PS.setString(8, admin_account_update.get(0));
		
		int n = 0;
		n = PS.executeUpdate();
		
		if (n > 0) {
			out.print("<script>alert('정보 수정 완료수정된 정보로 다시 로그인하세요'); location.href='./logout.jsp';</script>");
		} 
		else {
		}
	
	} catch (Exception e) {
		out.print("<script>alert('내부 시스템 오류');history.go(-1); </script>");
		out.print(e);
	}
%>