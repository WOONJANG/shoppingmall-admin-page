<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./charset.jsp" %>
<p>쇼핑몰 관리 페이지</p>
<div class="subpage_view" style="margin-top: 25px;">
    <span style="height: 35px; border-bottom:1px solid #ccc;">※ 신규 쿠폰등록 </span>
    <span>
     <ol class="coupon_in">
        <li>쿠폰명</li>
        <li><input type="text" id="cname" name="cname" class="inputs coupon_intext4" maxlength="40"> ※ 쿠폰명은 최대 40자까지 입력이 가능합니다.</li>
     </ol>
     <ol class="coupon_in">
        <li>쿠폰종류</li>
         <li>
        	<select id="cpart" name="cpart">
        		<option> --- 선 택 --- </option>
        		<option value ="상품할인">상품할인 </option>
        		<option value= "배송할인">배송비할인 </option>
        	</select> ※ 쿠폰종류를 입력해 주세요 (상품할인, 배송비할인)
        </li>
     </ol>
     <ol class="coupon_in">
        <li>사용 시작일</li>
        <li><input type="text"id="coupondatestart" name="coupondatestart"  class="inputs coupon_intext1" maxlength="10" readonly> ※ 클릭시 해당 시작을 캘린더에서 선택 하세요</li>
     </ol>
     <ol class="coupon_in">
        <li>사용 종료일</li>
        <li><input type="text" id="coupondateend" name="coupondateend" class="inputs coupon_intext1" maxlength="10" readonly> ※ 종료 일자 이후에는 쿠폰은 더 이상 사용되지 않습니다.</li>
     </ol>
     <ol class="coupon_in">
        <li>쿠폰타입</li>
        <li>
            <select  id="ctype" name="ctype" class="inputs coupon_intext2">
                <option>쿠폰 타입 선택</option>
                <option>정액할인</option>
                <option>정률할인</option>
            </select>
             ※ 정액할인 일 경우 할인 금액을 입력해야 하며, 정률 할인 일 경우 할인율 % 값을 입력하세요</li>
     </ol>
     <ol class="coupon_in">
        <li>할인금액 및 할인율</li>
        <li><input type="text" id="cdiscount" name="cdiscount" class="inputs coupon_intext1"> ※ 정률할인 일 경우 숫자 100 이상 입력이 안됩니다.</li>
     </ol>
     <ol class="coupon_in">
        <li>최소 주문금액</li>
        <li><input type="text" id="cmincost" name="cmincost" class="inputs coupon_intext1"> ※ 해당 쿠폰은 최소 주문금액이 되어야만 사용이 가능합니다. (최소 10000 이상 부터 입력이 가능합니다.)</li>
     </ol>
     <ol class="coupon_in">
        <li>쿠폰이미지 등록</li>
        <li><input type="file" id="cimage" name="cimage" > ※ 쿠폰이미지는 최소 2MB 이하 이미지만 사용가능 합니다.</li>
     </ol>
    </span>
    <span>
	    <input type="button" value="쿠폰 리스트" id="coupon_list_btn" name="coupon_list_btn" class="shopping_btn2" title="쿠폰 리스트">
	    <input type="button" value="등록 완료" id="coupon_insert_btn" name="coupon_insert_btn" class="shopping_btn" title="등록 완료">
    </span>
</div>

</div>