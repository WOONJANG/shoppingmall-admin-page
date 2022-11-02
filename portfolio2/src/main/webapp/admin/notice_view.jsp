<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./dbconnect.jsp"%>
<%
String idx = request.getParameter("idx");
String SQL = "SELECT * FROM admin_notice WHERE nidx='" + idx + "';";
PreparedStatement PS = null;
ResultSet RS = null;
ArrayList<Map<String,Object>> AL = null;

try{
	PS = CON.prepareStatement(SQL);
	RS = PS.executeQuery();
	AL = new ArrayList<>();
	
	while(RS.next()){
		Map<String,Object> MP = new HashMap<>();
	  	MP.put("nidx", RS.getString("nidx"));
	  	MP.put("notice", RS.getString("notice"));
	  	MP.put("ntitle", RS.getString("ntitle"));
	  	MP.put("nwriter", RS.getString("nwriter"));
	  	MP.put("nfile", RS.getString("nfile"));
	  	MP.put("ntext", RS.getString("ntext"));
	  	MP.put("ndate", RS.getString("ndate"));
	  	MP.put("nview", RS.getString("nview"));
		AL.add(MP);
	}
}catch(Exception e){
	e.getMessage();
}
%>
<meta charset="UTF-8">
	<p>공지사항 VIEW 페이지</p>
	<div class="write_view">
		<ul>
			<li>공지번호</li>
			<li ><input type="text" id="notice_input0" name="notice_input0" value="<%=idx%>" style="outline: none; border:0 solid black; width:25px;" readonly>번째 공지글</li>
		</ul>
		<ul>
		    <li>공지사항 여부</li>
		    <li>
		         <label class="label_notice"><em class="cbox"><input type="checkbox" name="chk" <%if(AL.get(0).get("notice").equals("on")){out.print("checked");} %>></em> 공지 출력 </label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
		    </li>
		</ul>
		<ul>
		    <li>공지사항 제목</li>
		    <li>
		        <input type="text" id="notice_input1" name="notice_input1" class="notice_input1" value="<%=AL.get(0).get("ntitle")%>"> ※ 최대 150자까지 입력이 가능
		    </li>
		</ul>
		<ul>
		    <li>글쓴이</li>
		    <li>
		        <input type="text" id="notice_input2" name="notice_input2" class="notice_input2" value="<%=AL.get(0).get("nwriter")%>"readonly> ※ 관리자 이름이 노출 됩니다.       
		    </li>
		</ul>
		<ul>
		    <li>첨부파일</li>
		    <li>
		        <input type="file" id="notice_input3" name="notice_input3" value="<%=AL.get(0).get("nfile")%>"> ※ 새로운 첨부파일 적용시 기본 첨부파일은 삭제 됩니다.
		        <em class="fileview">기존 첨부 파일명 : <%=AL.get(0).get("nfile")%></em>
		    </li>
		</ul>
		<ul class="ul_height">
		    <li>공지내용</li>
		    <li>
		        <textarea id="notice_text" name="notice_text" class="notice_input3" placeholder="공지내용 출력"><%=AL.get(0).get("ntext")%></textarea>
		    </li>
		</ul>
	</div>
<div class="board_btn">
	<button type="button" class="border_list" onclick="gopage(1)">공지목록</button>
	<button type="button" class="border_modify" onclick="gopage(2)">공지수정</button>
	<button type="button" class="border_del" onclick="gopage(3)">공지삭제</button>
</div>

<script>
	CKEDITOR.replace("notice_text");
</script>