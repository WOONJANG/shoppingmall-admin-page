<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@include file="./dbconnect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("application/json;");
	String p_code = request.getParameter("p_code"); 
	String SQL_SELECT_PRODUCT_CHECK = "select d_code from create_product where d_code='" + p_code + "'";
	PreparedStatement PS = null ;
	ResultSet RS = null;
	String result = "";
		try{
			PS = CON.prepareStatement(SQL_SELECT_PRODUCT_CHECK);
			RS = PS.executeQuery();
			String duplicate[] = {"ok","no"};
			if(RS.next() == true){
				result = duplicate[0];
			}else if (RS.next() == false){
				result = duplicate[1];
			}
			JSONArray ja = new JSONArray();
			ja.add(result);
		}catch(Exception e){
			new Exception ("ERROR");
		}
%>