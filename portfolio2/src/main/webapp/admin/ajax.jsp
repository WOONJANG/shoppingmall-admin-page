<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./dbconnect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String p_code = request.getParameter("p_code"); 
	String SQL_SELECT_CODE_CHECK = "select p_code from create_product where p_code='" + p_code + "'";
	PreparedStatement PS = null ;
	ResultSet RS = null;
	String MSG = "";
	String CK = "";
	response.setContentType("application/json;");
		try{
			PS = CON.prepareStatement(SQL_SELECT_CODE_CHECK);
			RS = PS.executeQuery();
			String duplicate[] = {"0","1"};
			if(RS.next() == true){
				out.print(duplicate[0]);
			}else if (RS.next() == false){
				out.print(duplicate[1]);
			}
		}catch(Exception e){
			new Exception ("ERROR");
		}finally{
			if(CON != null){
				CON.close();
			}
		}
%>