<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./charset.jsp"%>
<%@ include file="./dbconnect.jsp" %>
<%
		String sql = "select * from create_category";
		PreparedStatement PS = null;
		ResultSet RS = null;
		ArrayList<Map<String,Object>> AL = null;

		try {
			PS = CON.prepareStatement(sql);
			AL = new ArrayList<>();
			RS = PS.executeQuery();
			
		
			while (RS.next()) {
				Map<String, Object> MP = new HashMap<>();
		
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
			
			out.print("DB CONNECT FAIL");
		} finally {
			if (CON != null) {
				CON.close();
			}
		}
%>