<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./dbconnect.jsp"%>
<%
	
	String SQL = "DELETE FROM create_product WHERE pidx = ?";
	
	
	PreparedStatement PS = null;
	PreparedStatement PS2 = null;
	ResultSet RS = null;
	
	try{
		
	// 리스트
	String ck_idx[] = request.getParameterValues("listck");
	
		for(int ckb=0; ckb < ck_idx.length; ckb++){
			PS2 = CON.prepareStatement(SQL);
			PS2.setString(1, ck_idx[ckb]);
		PS2.executeUpdate();
		}
			
	
		
		
		out.print("<script>alert('삭제 완료');location.href='./admin_product.jsp';</script>");
	}catch(Exception e){
// 		out.print("<script>alert('실패');history.go(-1);</script>");
		
		out.print(e.getMessage());
	}
	
	
	
	
%>