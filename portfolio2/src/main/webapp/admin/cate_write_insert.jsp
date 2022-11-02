<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="./charset.jsp" %>
<%@ include file="./dbconnect.jsp" %>
<%
	ArrayList<String> create_category = new ArrayList<String>();	
	
	String catecode = request.getParameter("cate_input1");
	String d_code = request.getParameter("cate_input2");
	String d_name = request.getParameter("cate_input3");
	String s_code = request.getParameter("cate_input5");
	String s_name = request.getParameter("cate_input6");
	String codeuse = request.getParameter("cate_input7");
	String indate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	
	create_category.add(catecode);
	create_category.add(d_code);
	create_category.add(d_name);
	create_category.add(s_code);
	create_category.add(s_name);
	create_category.add(codeuse);
	create_category.add(indate);
	
	String SQL = "insert into create_category values('0',?,?,?,?,?,?,?)";
	try{	
		PreparedStatement PS = CON.prepareStatement(SQL);

		PS.setObject(1, create_category.get(0));
		PS.setObject(2, create_category.get(1));
		PS.setObject(3, create_category.get(2));
		PS.setObject(4, create_category.get(3));
		PS.setObject(5, create_category.get(4));
		PS.setObject(6, create_category.get(5));
		PS.setObject(7, create_category.get(6));
		
		int n = 0;
		n = PS.executeUpdate();
	if(n > 0) {
		out.print("<script>alert('카테고리 저장 완료');history.go(-1);</script>");
	}
	else {
		throw new Exception("ERROR");
	}
	
	}catch(Exception e){
		out.print("DB CONNECT FAIL OR TABLE ERROR");
		out.print(e);	
	}finally{	
		if(CON != null){
			CON.close();
		}
	}
%>