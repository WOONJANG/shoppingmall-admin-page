<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 계정 저장</title>
</head>
<body>
<%@ include file="./charset.jsp" %>
<%@ include file="./dbconnect.jsp" %>

<% 
	ArrayList<String> admin_account = new ArrayList<String>();
	
	String ID = request.getParameter("input_id");
	String PW = request.getParameter("input_pw");
	String NAME = request.getParameter("input_name");
	String EMAIL = request.getParameter("input_email");
	String TEL1 = request.getParameter("input_tel1");
	String TEL2 = request.getParameter("input_tel2");
	String TEL3 = request.getParameter("input_tel3");
	String TEL = TEL1 + TEL2 + TEL3;
	String PART = request.getParameter("part");
	String POSITION = request.getParameter("position");
	LocalDateTime TIME = LocalDateTime.now();
	DateTimeFormatter DTF = DateTimeFormatter.ofPattern("YYYY-MM-dd HH:mm:ss");
	String NOW = TIME.format(DTF);
	
	admin_account.add(ID);
	admin_account.add(PW);
	admin_account.add(NAME);
	admin_account.add(EMAIL);
	admin_account.add(TEL);
	admin_account.add(PART);
	admin_account.add(POSITION);
	admin_account.add(NOW);
	
	String SQL = "insert into admin_account values ('0',?,?,?,?,?,?,?,?);";
	
try{
		
		PreparedStatement PS = CON.prepareStatement(SQL);
		
		PS.setString(1, admin_account.get(0));
		PS.setString(2, admin_account.get(1));
		PS.setString(3, admin_account.get(2));
		PS.setString(4, admin_account.get(3));
		PS.setString(5, admin_account.get(4));
		PS.setString(6, admin_account.get(5));
		PS.setString(7, admin_account.get(6));
		PS.setString(8, admin_account.get(7));
		
		int n = 0;
			n = PS.executeUpdate();
		if(n > 0) {
			out.print("<script>alert('관리자 계정 등록완료')</script>");
			out.print("<script>location.href='./index.html'</script>");
		}
		else {
			throw new Exception("ERROR");
		}
		
}catch(Exception e){
		out.print("DB CONNECT FAIL OR TABLE ERROR");
		out.print("<script>alert('관리자 계정 등록실패')</script>");
		out.print("<script>history.go(-1);</script>");
}finally{	
		if(CON != null){
			CON.close();
		}
	}
%>

</body>
</html>