<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./cate_list_search_paging.jsp"%>
<%
String SQL = null;
String search_select = request.getParameter("cate_select");
String search = request.getParameter("cate_search");

if (search_select.equals("cate_name")) {
	SQL = "SELECT * FROM create_category WHERE d_name LIKE '%"+search+"%' OR s_name LIKE '%"+search+"%' ORDER BY cide DESC";
} else if (search_select.equals("cate_code")) {
	SQL = "SELECT * FROM create_category WHERE d_code LIKE '%"+search+"%' OR s_code LIKE '%"+search+"%' ORDER BY cide DESC";
}
try {
	PreparedStatement PS = CON.prepareStatement(SQL);
	ResultSet RS = PS.executeQuery();
	AL = new ArrayList<>();

	while (RS.next()) {
		Map<String, Object> MP = new HashMap<>();
		MP.put("cide", RS.getString("cide"));
	  	MP.put("catecode", RS.getString("catecode"));
	  	MP.put("d_code", RS.getString("d_code"));
	  	MP.put("d_name", RS.getString("d_name"));
	  	MP.put("s_code", RS.getString("s_code"));
	  	MP.put("s_name", RS.getString("s_name"));
	  	MP.put("codeuse", RS.getString("codeuse"));
	  	MP.put("indate", RS.getString("indate"));
		AL.add(MP);
	}

} catch (Exception e) {
	out.print("DB CONNECT FAIL.");
} finally {
	if (CON != null) {
		CON.close();
	}
}
%>
<meta charset="UTF-8">
<p>카테고리관리 페이지</p>
<div class="subpage_view">
	<form id="cate_search_form" name="cate_search_form" method="get" action="./admin_category_search.jsp" onsubmit="return category_search_btn();">
		<span>
			<select id="cate_select" name="cate_select" class="p_select1">
				<option value="" disabled>옵션선택</option>
				<option value="cate_name">카테고리명</option>
				<option value="cate_code">카테고리코드</option>
			</select> 
			<input type="text" id="cate_search" name="cate_search" class="p_input1" value="<%=search %>" placeholder="검색어를 입력해 주세요">
			<input type="submit" value="검색" title="카테고리 검색" class="p_submit">
			<input type="button" value="전체 카테고리" title="전체 카테고리" class="p_submit" onclick="category_all_search()">
			*빈칸 검색시 한 페이지에 모든데이터 출력
		</span>
	</form>
</div>
<div class="subpage_view2">
	<ul>
		<li><input type="checkbox" id="allck" name="allck"
			onclick="allck3();"></li>
		<li>분류코드</li>
		<li>대메뉴 코드</li>
		<li>대메뉴명</li>
		<li>소메뉴 코드</li>
		<li>소메뉴명</li>
		<li>사용 유/무</li>
		<li>관리</li>
	</ul>
<%
	int w = 0;
	while (w < AL.size()){
%>
	<ul>
		<li><input type="checkbox" id="listck<%=w%>" name="listck" 
			class="ckproduct" value='<%=AL.get(w).get("cide")%>'
			onclick="getckboxval2(<%=AL.get(w).get("cide")%>);"></li>
		<li style="text-align: left; text-indent: 5px;"><%=AL.get(w).get("catecode")%></li>
		<li><%=AL.get(w).get("d_code")%></li>
		<li style="text-align: left; text-indent: 5px;"><%=AL.get(w).get("d_name")%></li>
		<li><%=AL.get(w).get("s_code")%></li>
		<li style="text-align: left; text-indent: 5px;"><%=AL.get(w).get("s_name")%></li>
		<li><%=AL.get(w).get("codeuse")%></li>
		<li onclick="alert('준비중');">[수정]</li>
	</ul>
<%
	w++;
	}
%>
	<!--     <ul> -->
	<!--         <li style="width: 100%;">등록된 카테고리가 없습니다.</li> -->
	<!--     </ul> -->
</div>
<div class="subpage_view3">
	<ul class="pageing">
		<li><img src="./ico/double_left.svg"></li>
		<%
		int p = 1;
		%>
		<li onclick="leftpage(<%=p%>);"><img src="./ico/left.svg"></li>
		<%
		while (p <= pagenumber) {
		%>
		<li onclick="pagego(<%=p%>);"><%=p%></li>
		<%
		p++;
		}
		%>
		<li onclick="rightpage(<%=p%>);"><img src="./ico/right.svg"></li>
		<li><img src="./ico/double_right.svg"></li>
	</ul>
</div>
<div class="subpage_view4">
	<input type="button" value="카테고리 삭제" title="카테고리 삭제" class="p_button" onclick="category_btn2(1);">
	<span style="float: right;"> 
		<input type="button" value="상품 리스트" title="상품 리스트" class="p_button p_button_color1" onclick="category_btn2(2);">
		<input type="button" value="카테고리 등록" title="카테고리 등록" class="p_button p_button_color2" onclick="category_btn2(3);">
	</span>
</div>