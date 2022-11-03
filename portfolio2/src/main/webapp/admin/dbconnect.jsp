<%@page import="java.sql.*"%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
		Connection CON = null;
	try{
		String DRIVER = "com.mysql.jdbc.Driver";
		String URL = "jdbc:mysql://umj7-009.cafe24.com/jangwoon0518";
// 		String URL = "jdbc:mysql://localhost:3306/jangwoon0518";
		String DBID = "jangwoon0518";
		String DBPW = "";
		Class.forName(DRIVER);
		CON = DriverManager.getConnection(URL,DBID,DBPW);
//  		out.print("<script>alert('DB CONNECTION SUCCESS')</script>");
	}catch(Exception e){
		out.print("<script>alert('DB CONNECTION FAIL')</script>");
	}
%>
