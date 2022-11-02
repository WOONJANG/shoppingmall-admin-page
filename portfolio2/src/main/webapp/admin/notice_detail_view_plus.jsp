<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./dbconnect.jsp"%>
<%
// String idx = request.getParameter("notice_input0");
// String list_idx = request.getParameter("listck");
String idx =  request.getParameter("nidx");
PreparedStatement PS = null;
PreparedStatement PS2 = null;
ResultSet RS = null;

int count = 1;
String getReadCountSql = "SELECT nview FROM admin_notice WHERE nidx = ?";

try {
	PS = CON.prepareStatement(getReadCountSql);
	PS.setString(1, idx);
	RS = PS.executeQuery();
	while(RS.next()){
	
	String sql = "UPDATE admin_notice SET nview = ? WHERE nidx = ?";
	PS2 = CON.prepareStatement(sql);
	PS2.setInt(1, RS.getInt("nview") + count);
	PS2.setString(2, idx);
	PS2.executeUpdate();
}

	out.print("<script>location.href='./admin_notice_view.jsp?idx="+idx+"'</script>");
	CON.close();
	
} catch (Exception e) {
	e.printStackTrace();
}
%>