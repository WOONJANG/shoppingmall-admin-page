<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./charset.jsp" %>
<%@include file="./dbconnect.jsp" %>
<meta charset="UTF-8">
<%
		String SQL = "select * from admin_account order by adminidx desc";
		
		ArrayList<Map<String,Object>> AL = null;
		try{
			PreparedStatement PS = CON.prepareStatement(SQL);
			ResultSet RS = PS.executeQuery();
			
			AL = new ArrayList<>();
			
			while(RS.next()){
				
				Map<String,Object> MP = new HashMap<>();
				MP.put("adminidx", RS.getString("adminidx"));
				MP.put("adminname", RS.getString("adminname"));
				MP.put("adminid", RS.getString("adminid"));
				MP.put("admintel", RS.getString("admintel"));
				MP.put("adminemail", RS.getString("adminemail"));
				MP.put("adminpart", RS.getString("adminpart"));
				MP.put("adminposition", RS.getString("adminposition"));
				MP.put("adminjoindate", RS.getString("adminjoindate").substring(0,19));
				AL.add(MP);
			}
		}catch(Exception e){
			out.print("DB CONNECT FAIL OR TABLE ERROR");
		}finally{	
			if(CON != null){
				CON.close();
			}
		}
%>

<p>신규등록 관리자</p>
<ol class="new_admin_title">
    <li>NO</li>
    <li>관리자명</li>
    <li>아이디</li>
    <li>전화번호</li>
    <li>이메일</li>
    <li>담당부서</li>
    <li>담당직책</li>
    <li>가입일자</li>
    <li>승인여부</li>
</ol>
<!-- <ol class="new_admin_none"> -->
<!--     <li>신규 등록된 관리자가 없습니다.</li> -->
<!-- </ol> -->
<%
	int w = 0;
	while (w < AL.size()){
%>
<ol class="new_admin_lists">
    <li><%=AL.get(w).get("adminidx")%></li>
    <li><%=AL.get(w).get("adminname")%> </li>
    <li><%=AL.get(w).get("adminid") %></li>
    <li><%=AL.get(w).get("admintel") %></li>
    <li><%=AL.get(w).get("adminemail") %></li>
    <li><%=AL.get(w).get("adminpart") %></li>
    <li><%=AL.get(w).get("adminposition") %></li>
    <li><%=AL.get(w).get("adminjoindate") %></li>
    <li>
        <input type="button" value="승인" class="new_addbtn1" title="승인">
        <input type="button" value="미승인" class="new_addbtn2" title="미승인">
    </li>
</ol>
<%
		w++;
	}
%>
