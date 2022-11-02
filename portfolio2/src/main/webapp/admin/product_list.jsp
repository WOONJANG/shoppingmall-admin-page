<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./charset.jsp"%>
<%@ include file="product_list_paging.jsp"%>
<%

String sql = "select * from create_product order by pidx desc limit " + startpage + "," + pageview; //데이터 리스트
try{
	PreparedStatement PS = CON.prepareStatement(sql);
	ResultSet RS = PS.executeQuery();
	AL = new ArrayList<>();

	while(RS.next()){   
	  	Map<String,Object> MP = new HashMap<>();
	  	
	  	MP.put("pidx", RS.getString("pidx"));
	  	MP.put("d_code", RS.getString("d_code"));
	  	MP.put("s_code", RS.getString("s_code"));
	  	MP.put("p_code", RS.getString("p_code"));
	  	MP.put("p_name", RS.getString("p_name"));
	  	MP.put("p_text", RS.getString("p_text"));
	  	MP.put("p_money", RS.getString("p_money"));
	  	MP.put("p_sale", RS.getString("p_sale"));
	  	MP.put("p_salemoney", RS.getString("p_salemoney"));
	  	MP.put("p_ea", RS.getString("p_ea"));
	  	MP.put("p_use", RS.getString("p_use"));
	  	MP.put("p_sold", RS.getString("p_sold"));
	  	MP.put("p_img1", RS.getString("p_img1"));
	  	MP.put("p_img2", RS.getString("p_img2"));
	  	MP.put("p_img3", RS.getString("p_img3"));
	  	MP.put("p_info", RS.getString("p_info"));
	  	MP.put("p_indate", RS.getString("p_indate"));
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

<meta charset="UTF-8">
<p>상품관리 페이지</p>
<div class="subpage_view">
	<span>등록된 상품 <%=total %>건
	</span>
	<form id="product_search_form" name="product_search_form" method="get" action='./admin_product_list_search.jsp'>
		<span>
		<input type="hidden" name="page" id="page"
			value="<%=pgno%>">
			<select id="search_select"
				name="search_select" class="p_select1">
				<option value="" disabled>옵션선택</option>
				<option value="goods_name">상품명</option>
				<option value="goods_code">상품코드</option>
		</select>
		<input type="text" id="search" name="search" class="p_input1"
			placeholder="검색어를 입력해 주세요"> 
			<input type="submit" value="검색" title="상품검색" class="p_submit">
			*빈칸 검색시 한 페이지에 모든데이터 출력
		</span>
	</form>
</div>
<div class="subpage_view2">
	<ul>
		<li><input type="checkbox" id="allck" name="allck"
			onclick="allck3();"></li>
		<li>코드</li>
		<li>이미지</li>
		<li>상품명</li>
		<li>카테고리 분류</li>
		<li>판매가격</li>
		<li>할인가격</li>
		<li>할인율</li>
		<li>재고현황</li>
		<li>판매유/무</li>
		<li>품절</li>
		<li>관리</li>
	</ul>
	<%
         int w=0;
         while(w<AL.size()){
%>
	<ul>
		<li><input type="checkbox" id="listck<%=w%>" name="listck"
			class="ckproduct" value='<%=AL.get(w).get("pidx") %>'
			onclick="getckboxval2(<%=AL.get(w).get("pidx")%>);"></li>
		<li><%=AL.get(w).get("p_code")%></li>
		<li><img src='../<%=AL.get(w).get("p_img1")%>'
			style="width: 100%; height: inherit; object-fit: cover;"></li>
		<li><%=AL.get(w).get("p_name")%></li>
		<li><%=AL.get(w).get("d_code")%></li>
		<li><%=AL.get(w).get("p_money")%></li>
		<li><%=AL.get(w).get("p_salemoney")%></li>
		<li><%=AL.get(w).get("p_sale")%></li>
		<li><%=AL.get(w).get("p_ea")%></li>
		<li><%=AL.get(w).get("p_use")%></li>
		<li><%=AL.get(w).get("p_sold")%></li>
		<li><a href="#" onclick="alert('준비중');return false;">관리</a></li>
	</ul>
	<%
	w++;
}
%>
	<!--     <ul> -->
	<!--         <li style="width: 100%;">등록된 상품이 없습니다.</li> -->
	<!--     </ul> -->
</div>
<div class="subpage_view3">
	<ul class="pageing">
		<!-- 		<li><img src="./ico/double_left.svg"></li> -->
		<%
		int p =1; 
		%>
		<li onclick="leftpage(<%=p%>);"><img src="./ico/left.svg"></li>
		<%
			while(p<=pagenumber){
		%>
		<li onclick="pagego(<%=p%>);"><%=p%></li>
		<% 
			p++;
			}
		%>
		<li onclick="rightpage(<%=p%>);"><img src="./ico/right.svg"></li>
		<!-- 		<li><img src="./ico/double_right.svg"></li> -->
	</ul>
</div>
<div class="subpage_view4">
	<input type="button" value="선택상품 삭제" title="선택상품 삭제" class="p_button"
		onclick="product_btn2(1);"> <span style="float: right;">
		<input type="button" value="신규상품 등록" title="신규상품 등록"
		class="p_button p_button_color1" onclick="product_btn2(2);"> <input
		type="button" value="카테고리 등록" title="카테고리 등록"
		class="p_button p_button_color2" onclick="product_btn2(3);">
	</span>
</div>

<script>
	function allck3() {
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
		    result += el.value + ' ';
		  });
		  
		  // 콘솔 출력
		    console.log(result);
	}
	
	function getckboxval2(val){
		// 선택된 목록 가져오기
		  let query = 'input[name="listck"]:checked';
		  let arr = [];
		  let selectedEls = 
		      document.querySelectorAll(query);
		  
		  // 각 선택된 목록에서 value 찾기
		  let result = '';
		  selectedEls.forEach((el) => {
		    result += el.value + ' ';
		  });
		  
		  // 콘솔 출력
		    console.log(result);
	}
</script>
