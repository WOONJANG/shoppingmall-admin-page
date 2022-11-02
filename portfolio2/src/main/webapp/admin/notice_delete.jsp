<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbconnect.jsp" %>
<%@ include file="./charset.jsp"%>

<%
	PreparedStatement PS =null;
	String[] idx = request.getParameterValues("listck");
    String SQL = "DELETE FROM admin_notice WHERE nidx=?";
    PS = CON.prepareStatement(SQL);
    
	try{
		
        int w = 0;
        while(w < idx.length){
        	PS.setString(1, idx[w]);      
        	w++;
        }
		int result = PS.executeUpdate();
		if (result > 0) {
			out.print("<script>alert('삭제 완료');history.go(-1);</script>");
		} else {
			out.print("<script>alert('삭제 실패');history.go(-1);</script>");
		}
	}catch(Exception e){
		out.print("<script>alert('내부 시스템 오류');history.go(-1);</script>");
	}finally{   
		if(CON != null){
			CON.close();
		}
	}
%>