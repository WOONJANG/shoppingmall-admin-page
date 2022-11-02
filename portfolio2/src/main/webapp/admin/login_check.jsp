<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./charset.jsp" %>
<%@ include file="./dbconnect.jsp" %>

<%

// 	out.print("<script>alert('잘못된 접근'); history.go(-1); </script>");

	String ID = request.getParameter("input_login_id");
	String PW = request.getParameter("input_login_pw");
	String SQL_SELECT_ID_CHECK = "select adminid, adminpw from admin_account where adminid='" + ID + "' and adminpw='"+ PW +"'";
	PreparedStatement PS = null ;
	String MSG = "";
		try{
			PS = CON.prepareStatement(SQL_SELECT_ID_CHECK);
			ResultSet RS = PS.executeQuery();
			if(RS.next() == true){
				MSG = "반갑습니다.";
				out.print("<script>location.href='./login_log.jsp?ID=" + ID + "'</script>");
			}else if (RS.next() == false){
				MSG = "관리자만 로그인할 수 있습니다.";
				out.print("<script>location.href='./index.html'</script>");
			}
			}catch(Exception e){
				new Exception ("ERROR");
			}finally{
				if(CON != null){
					CON.close();
				}
			}
		out.print("<script>alert('" + MSG + "'); history.go(-1); </script>");

%>