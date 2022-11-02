<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<%@ include file="charset.jsp" %>
<%@ include file="./notice_list_paging.jsp" %>
<%

// String sql = "select * from admin_notice order by nidx desc";
String sql = "select * from admin_notice order by nidx desc limit " + startpage + "," + pageview; //데이터 리스트
ArrayList<Map<String,Object>> AL = null;
try{
   PreparedStatement PS = CON.prepareStatement(sql);
   ResultSet RS = PS.executeQuery();
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
   out.print("DB CONNECT FAIL");
}finally{   
   if(CON != null){
      CON.close();
   }
}
%>


<p style="width: 200px">공지사항 관리페이지</p>
<div class="subpage_view">
<ul>
    <li><input type="checkbox" id="allck" name="allck" onclick="allck2();"></li>
    <li>NO</li>
    <li>제목</li>
    <li>글쓴이</li>
    <li>날짜</li>
    <li>조회</li>
</ul>
<%
	int w = 0;
	int no = 0;
	while (w < AL.size()){
		no = (total-w)-startpage;
%>

	<ol>
	    <li><input type="checkbox" id="listck<%=w%>" name="listck" class="cknotice" value='<%=AL.get(w).get("nidx")%>' onclick="getckboxval(<%=AL.get(w).get("nidx")%>);"></li>
	    <li id="no" name="no" value="<%=AL.get(w).get("nidx")%>"><%=no%></li>
		<li id="nidx" name="nidx" onclick="detail_view(<%=AL.get(w).get("nidx")%>);"><input  type="hidden" id="notice_idx" name="notice_idx" value="<%=AL.get(w).get("nidx")%>"><%=AL.get(w).get("ntitle")%></li>
	    <li><%=AL.get(w).get("nwriter")%></li>
	    <li><%=AL.get(w).get("ndate").toString().substring(0, 11)%></li>
	    <li id="nview" name="nview" value="<%=AL.get(w).get("nview")%>"><%=AL.get(w).get("nview")%></li>
	</ol>
<%
w++;
	}
%>
<!--  <ol class="none_text"> -->
<!--     <li>등록된 공지 내용이 없습니다.</li> -->
<!-- </ol> -->
	</div>
	<div class="board_btn">
    	<button type="button" class="border_del" onclick="notice_btn2(1)">공지삭제</button>
    	<button type="button" class="border_add" onclick="notice_btn2(2)">공지등록</button>
	</div>

<div class="border_page">
    <ul class="pageing">
        <li><img src="./ico/double_left.svg"></li>
        <li onclick="leftpage();"><img src="./ico/left.svg"></li>
<%
			int p =1;
			while(p<=pagenumber){
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
<script>
	function allck2() {
		if(document.getElementById("allck").checked == true){
			for(var i=0;i<<%=AL.size()%>;i++) 
				document.getElementsByName("listck")[i].checked = true;
		};
		if(document.getElementById("allck").checked == false){
			for(var i=0;i<<%=AL.size()%>;i++)
				document.getElementsByName("listck")[i].checked = false;
		};
		// 전체선택 누를때 선택된 목록 가져오기
		  const query = 'input[name="listck"]:checked';
		  const selectedEls = 
		      document.querySelectorAll(query);
		  
		  // 선택된 목록에서 value 찾기
		  let result = '';
		  let arr = [];
		  selectedEls.forEach((el) => {
// 		    result += el.value + ' ';
		    result += add.el.value;
		  });
		  
		  // 콘솔 출력
		    console.log(result);
	}
	
	function getckboxval(val){
		// 선택된 목록 가져오기
		  let query = 'input[name="listck"]:checked';
		  let arr = [];
		  let selectedEls = 
		      document.querySelectorAll(query);
		  
		  // 각 선택된 목록에서 value 찾기
		  let result = '';
		  selectedEls.forEach((el) => {
		    result += el.value + ' ';
		    arr += el.value
		  });
		  
		  // 콘솔 출력
		    console.log(result);
	}
	
	
</script>
