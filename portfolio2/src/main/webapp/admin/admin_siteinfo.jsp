<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./charset.jsp" %>
<%@include file="./admin_siteinfo_select.jsp"%>
<meta charset="UTF-8">
<p style="width: 200px;">홈페이지 가입환경 설정</p>
<div class="subpage_view">
<ul class="info_form">
    <li>홈페이지 제목</li>
    <li>
        <input type="text" id="homepage_title" name="homepage_title" class="in_form1" value="<%=al.get(0).get("mall_title")%>">
    </li>
</ul>    
<ul class="info_form">
    <li>관리자 메일 주소</li>
    <li>
        <input type="text" id="homepage_email" name="homepage_email" class="in_form2"value="<%=al.get(0).get("mall_email")%>"> ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)
    </li>
</ul> 
<ul class="info_form">
    <li>포인트 사용 유/무</li>
    <li class="checkcss">
        <em><label><input type="radio" name="point_use" value="Y" <%if(al.get(0).get("mall_pointuse") == "Y"){out.print("checked");}%> class="ckclass">포인트 사용</label></em> 
        <em><label><input type="radio" name="point_use" value="N" <%if(al.get(0).get("mall_pointuse") == "N"){out.print("checked");}%> class="ckclass">포인트 미사용</label></em>
    </li>
</ul>
<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>회원가입시 적립금</li>
    <li>
        <input type="text" id="join_point" name="join_point" class="in_form3" maxlength="5" value="<%=al.get(0).get("mall_basicpoint")%>"> 점
    </li>
    <li>회원가입시 권한레벨</li>
    <li>
        <input type="text" id="join_level" name="join_level" class="in_form3" maxlength="1" value="<%=al.get(0).get("mall_joinlevel")%>"> 레벨
    </li>
</ul> 
</div>
<p style="width: 200px;">홈페이지 기본환경 설정</p>
<div class="subpage_view">
<ul class="info_form2">
    <li>회사명</li>
    <li>
        <input type="text" id="company_name" name="company_name" class="in_form0" value="<%=al.get(0).get("mall_name")%>"> 
    </li>
    <li>사업자등록번호</li>
    <li>
        <input type="text" id="company_number" name="company_number" class="in_form0" value="<%=al.get(0).get("mall_number")%>"> 
    </li>
</ul> 
<ul class="info_form2">
    <li>대표자명</li>
    <li>
        <input type="text" id="head_name" name="head_name" class="in_form0" value="<%=al.get(0).get("mall_headname")%>"> 
    </li>
    <li>대표전화번호</li>
    <li>
        <input type="text" id="head_tel" name="head_tel" class="in_form0" value="<%=al.get(0).get("mall_headtel")%>"> 
    </li>
</ul>
<ul class="info_form2">
    <li>통신판매업 신고번호</li>
    <li>
        <input type="text" id="business_number" name="business_number" class="in_form0" value="<%=al.get(0).get("mall_businessnumber")%>"> 
    </li>
    <li>부가통신 사업자번호</li>
    <li>
        <input type="text" id="tele_business_number" name="tele_business_number" class="in_form0" value="<%=al.get(0).get("mall_telebusinessnumber")%>"> 
    </li>
</ul>
<ul class="info_form2">
    <li>사업장 우편번호</li>
    <li>
        <input type="text" id="company_zipcode" name="company_zipcode" class="in_form0" maxlength="5" value="<%=al.get(0).get("mall_zipcode")%>"> 
    </li>
    <li>사업장 주소</li>
    <li>
        <input type="text" id="company_addr" name="company_addr" class="in_form2" value="<%=al.get(0).get("mall_addr")%>"> 
    </li>
</ul>
<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>정보관리책임자명</li>
    <li>
        <input type="text" id="info_manager_name" name="info_manager_name" class="in_form0" value="<%=al.get(0).get("mall_infomanagername")%>"> 
    </li>
    <li>정보책임자 E-mail</li>
    <li>
        <input type="text" id="info_manager_email" name="info_manager_email" class="in_form1" value="<%=al.get(0).get("mall_infomanagermail")%>"> 
    </li>
</ul>
</div>
<p style="width: 200px;">결제 기본환경 설정</p>
<div class="subpage_view">  
<ul class="info_form2">
    <li>무통장 은행</li>
    <li>
        <input type="text" id="without_bankbook" name="without_bankbook" class="in_form0" value="<%=al.get(0).get("mall_withoutbank")%>"> 
    </li>
    <li>은행계좌번호</li>
    <li>
        <input type="text" id="bank_account_number" name="bank_account_number" class="in_form1" value="<%=al.get(0).get("mall_banknumber")%>"> 
    </li>
</ul>
<ul class="info_form">
    <li>신용카드 결제 사용</li>
    <li class="checkcss">
        <em><label><input type="radio" name="creditcard_use" value="Y"<%if(al.get(0).get("mall_creditcarduse") == "Y"){out.print("checked");}%> class="ckclass"> 사용</label></em> 
        <em><label><input type="radio" name="creditcard_use" value="N"<%if(al.get(0).get("mall_creditcarduse") == "N"){out.print("checked");}%> class="ckclass" > 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
    </li>
</ul>
<ul class="info_form">
    <li>휴대폰 결제 사용</li>
    <li class="checkcss">
        <em><label><input type="radio" name="telpay_use" value="Y" <%if(al.get(0).get("mall_telpaymentuse") == "Y"){out.print("checked");}%> class="ckclass"> 사용</label></em> 
        <em><label><input type="radio" name="telpay_use" value="N" <%if(al.get(0).get("mall_telpaymentuse") == "N"){out.print("checked");}%> class="ckclass"> 미사용</label></em> ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
    </li>
</ul>
<ul class="info_form">
    <li>도서상품권 결제사용</li>
    <li class="checkcss">
        <em><label><input type="radio" name="bookcoupon_use" value="Y" <%if(al.get(0).get("mall_bookcouponuse") == "Y"){out.print("checked");}%> class="ckclass"> 사용</label></em> 
        <em><label><input type="radio" name="bookcoupon_use" value="N" <%if(al.get(0).get("mall_bookcouponuse") == "N"){out.print("checked");}%> class="ckclass"> 미사용</label></em> ※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.
    </li>
</ul>
<ul class="info_form2">
    <li>결제 최소 포인트</li>
    <li>
        <input type="text" id="min_point" name="min_point" class="in_form0" maxlength="5" value="<%=al.get(0).get("mall_minpoint")%>"> 점
    </li>
    <li>결제 최대 포인트</li>
    <li>
        <input type="text" id="max_point" name="max_point" class="in_form0" maxlength="5" value="<%=al.get(0).get("mall_maxpoint")%>"> 점
    </li>
</ul>
<ul class="info_form">
    <li>현금 영수증 발급사용</li>
    <li class="checkcss">
        <em><label><input type="radio" name="cashreceipts_use" value="Y" <%if(al.get(0).get("mall_cashreceiptsuse") == "Y"){out.print("checked");}%> class="ckclass"> 사용</label></em> 
        <em><label><input type="radio" name="cashreceipts_use" value="N" <%if(al.get(0).get("mall_cashreceiptsuse") == "N"){out.print("checked");}%> class="ckclass"> 미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.
    </li>
</ul>
<ul class="info_form2">
    <li>배송업체명</li>
    <li>
        <input type="text" id="shipping_name" name="shipping_name" class="in_form0" value="<%=al.get(0).get("mall_shippingcompany")%>"> 
    </li>
    <li>배송비 가격</li>
    <li>
        <input type="text" id="shipping_cost" name="shipping_cost" class="in_form0" maxlength="7" value="<%=al.get(0).get("mall_shippingcost")%>"> 원
    </li>
</ul>
<ul class="info_form" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>희망배송일</li>
    <li class="checkcss">
        <em><label><input type="radio" name="hopeshipping_use" value="Y" <%if(al.get(0).get("mall_hopeshippingdate") == "Y"){out.print("checked");}%> class="ckclass"> 사용</label></em> 
        <em><label><input type="radio" name="hopeshipping_use" value="N" <%if(al.get(0).get("mall_hopeshippingdate") == "N"){out.print("checked");}%> class="ckclass"> 미사용</label></em> ※ 희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.
    </li>
</ul>
</div>
<div class="btn_div">
    <button type="button" id="save_btn" name="save_btn" class="sub_btn1" title="설정 저장">설정 저장</button>
    <button type="button" id="cancle_btn" name="cancle_btn" class="sub_btn2" title="저장 취소">저장 취소</button>
</div>
