<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
	String ID = null;
	ID = (String)session.getAttribute("ID");
	session.setMaxInactiveInterval(60 * 1);
	
	if(ID == null || ID == "" || ID == "null"){
		out.print("<script>alert('잘못된 접근\n로그인 페이지로 이동됩니다');</script>");
		response.sendRedirect("./index.html");
	}
%>