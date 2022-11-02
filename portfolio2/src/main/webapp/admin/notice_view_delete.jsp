<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./dbconnect.jsp"%>
<%
	
	String SQL = "DELETE FROM admin_notice WHERE nidx = ?";
	
	
	PreparedStatement PS = null;
	PreparedStatement PS2 = null;
	ResultSet RS = null;
	
	try{
		
	// 뷰
	String idx = request.getParameter("notice_input0");
	// 리스트
	String ck_idx[] = request.getParameterValues("listck");
	
			
		
		if(ck_idx != null){
			for(int ckb=0; ckb < ck_idx.length; ckb++){
				PS2 = CON.prepareStatement(SQL);
				PS2.setString(1, ck_idx[ckb]);
			PS2.executeUpdate();
			}
		}else {
			PS = CON.prepareStatement(SQL);
			PS.setString(1, idx);
			PS.executeUpdate();
		}
		
		
		
		
		out.print("<script>alert('삭제 완료');location.href='./admin_notice.jsp';</script>");
	}catch(Exception e){
		out.print("<script>alert('실패');history.go(-1);</script>");
		
		out.print(e.getMessage());
	}
	
	
	
	
%>