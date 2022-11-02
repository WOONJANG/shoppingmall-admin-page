<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./dbconnect.jsp"%>
<%
	String title = request.getParameter("notice_input1");
	String file = request.getParameter("notice_input3");
	String text = request.getParameter("notice_text");
	String idx = request.getParameter("notice_input0");
	
	String SQL = "update admin_notice set ntitle = ?, nfile = ?, ntext = ?  where nidx = '"+ idx +"';";
	
	
	PreparedStatement PS = null;
	ResultSet RS = null;
	
	try{
		PS = CON.prepareStatement(SQL);
		PS.setString(1, title);
		PS.setString(2, file);
		PS.setString(3, text);
		PS.executeUpdate();
		out.print("<script>alert('수정완료');location.href='admin_notice_view.jsp?idx="+idx+"'</script>");
	}catch(Exception e){
		out.print("<script>alert('실패');history.go(-1);</script>");
	}
	
	
%>