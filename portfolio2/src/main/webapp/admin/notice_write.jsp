<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./charset.jsp" %>
<% String ID2 = (String)session.getAttribute("ID"); %>
<meta charset="UTF-8">
<p>공지사항 등록페이지<form name="notice" id="notice" method="post" action="notice_write_insert.jsp"></p>
<div class="write_view">
<ul>
    <li>공지사항 여부</li>
    <li>
        <label class="label_notice"><em class="cbox"><input type="checkbox" id="notice_view" name="notice_view"value="NULL"></em> 공지 출력</label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
    </li>
</ul>
<ul>
    <li>공지사항 제목</li>
    <li>
        <input type="text" id="notice_title" name="notice_title" class="notice_input1"> ※ 최대 150자까지 입력이 가능
    </li>
</ul>
<ul>
    <li >글쓴이</li> 
    <li>
        <input type="text" id="notice_writer" name="notice_writer" class="notice_writer" value="<%=ID2%>" readonly> ※ 관리자 이름이 노출 됩니다.       
    </li>
</ul>
<ul>
    <li>첨부파일</li>
    <li>
        <input type="file" id="notice_file" name="notice_file" > ※ 첨부파일 최대 용량은 2MB 입니다.       
    </li>
</ul>
<ul class="ul_height">
    <li>공지내용</li>
    <li>
        <textarea id="notice_text" name="notice_text" class="notice_input3" placeholder="공지내용을 입력하세요!"></textarea>
    </li>
</ul>
</div></form>
<div class="board_btn">
    <a href="./admin_notice.jsp"><button class="border_del">공지목록</button></a>
    <button class="border_add" id="notice_insert_btn" name="notice_insert_btn">공지등록</button>
</div>

<script>
	CKEDITOR.replace("notice_text");
</script>