<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./dbconnect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String ID = request.getParameter("ID"); 
	String SQL_SELECT_ID_CHECK = "select adminid from admin_account where adminid='" + ID + "'";
	PreparedStatement PS = null ;
	ResultSet RS = null;
	String MSG = "";
	String CK = "";
	response.setContentType("application/json;");
	if(ID == "admin" || ID == "master" || ID == "ADMIN" || ID == "MASTER"){
		out.print("'admin','master'은 아이디로 사용 불가합니다.");
	}else{
		try{
			PS = CON.prepareStatement(SQL_SELECT_ID_CHECK);
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
	}
%>