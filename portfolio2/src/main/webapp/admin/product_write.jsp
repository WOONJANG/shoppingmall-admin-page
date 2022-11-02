<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./charset.jsp" %>
<meta charset="UTF-8">

<p>상품 등록 페이지</p>
<div class="product_insert">
    <ul>
        <li>대메뉴 카테고리</li>
        <li>
            <input type="text" name="d_code" id="d_code" class="product_input1"> 
        </li>
    </ul>
    <ul>
        <li>소메뉴 카테고리</li>
        <li>
            <input type="text" name="s_code" id="s_code"  class="product_input1"> 
        </li>
    </ul>
    <ul>
        <li>상품코드</li>
        <li>
        	<input type="hidden" name="codeok" value="">
            <input type="text" name="p_code"  id="p_code" class="product_input1" maxlength="6" placeholder="6자리 코드를 입력하세요"> 
            <input type="button" id="product_ajax" name="product_ajax" value="중복확인" title="중복확인" class="product_btn"> <span class="help_text">※ 상품코드는 절대 중복되지 않도록 합니다.</span>
        </li>
    </ul>
    <ul>
        <li>상품명</li>
        <li>
            <input type="text" name="p_name" id="p_name" class="product_input2" maxlength="100"> <span class="help_text">※ 상품명은 최대 100자까지만 적용할 수 있습니다.</span>
        </li>
    </ul>
    <ul>
        <li>상품 부가설명</li>
        <li>
            <input type="text" name="p_text" id="p_text" class="product_input4" maxlength="200"> <span class="help_text">※ 상품명은 최대 200자까지만 적용할 수 있습니다.</span>
        </li>
    </ul>
    <ul>
        <li>판매가격</li>
        <li>
            <input type="text" name="p_money" id="p_money" class="product_input3" maxlength="7"> <span class="help_text">※ , 없이 숫자만 입력하세요 최대 7자리</span>
        </li>
    </ul>
    <ul>
        <li>할인율</li>
        <li>
            <input type="text" name="p_sale" id="p_sale" class="product_input3" maxlength="2" value="0" onkeyup="calcs(this.value)">% <span class="help_text">※ 숫자만 입력하세요</span>
        </li>
    </ul>
    <ul>
        <li>할인가격</li>
        <li>
            <input type="text" name="p_salemoney" id="p_salemoney" class="product_input3" maxlength="7" value="0" readonly> <span class="help_text">※ 할인율이 0%일 경우 할인가격은 0으로 처리 합니다.</span>
        </li>
    </ul>
    <ul>
        <li>상품재고</li>
        <li>
            <input type="text" name="p_ea" id="p_ea" class="product_input3" maxlength="4" value="0">EA <span class="help_text">※ 숫자만 입력하세요. 재고가 0일 경우 soldout이 됩니다.</span>
        </li>
    </ul>
    <ul>
        <li>판매 유/무</li>
        <li>
            <label class="product_label">
            <input type="radio" name="p_use" value="Y" style="vertical-align:-1px;" checked> 판매시작
            </label>
            <label class="product_label">
            <input type="radio" name="p_use" value="N" style="vertical-align:-1px;"> 판매종료
            </label> <span class="help_text">※ 숫자만 입력하세요. 재고가 0일 경우 soldout이 됩니다.</span>
        </li>
    </ul>
    <ul>
        <li>조기품절</li>
        <li>
            <label class="product_label">
                <input type="radio" name="p_soldout" value="Y" style="vertical-align:-1px;"> 사용
            </label>
            <label class="product_label">
                <input type="radio" name="p_soldout" value="N" style="vertical-align:-1px;" checked> 미사용
            </label>
        </li>
    </ul>
    <ul style="height: 160px;">
        <li>상품 대표이미지</li>
        <li>
            <ol style="width:100%; height: auto;">
            <li style="width:100%; height:45px;">
            <input type="file" name="p_img1" id="p_img1">
            <span class="help_text">※ 상품 대표이미지 이며, 이미지 용량은 2MB 까지 입니다.</span>
            </li>
            <li style="height:45px;">
            <input type="file" name="p_img2" id="p_img2">
            <span class="help_text">※ 추가 이미지 이며, 이미지 용량은 2MB 까지 입니다.</span>
            </li>
            <li style="height:45px;">
            <input type="file" name="p_img3" id="p_img3">
            <span class="help_text">※ 추가 이미지 이며, 이미지 용량은 2MB 까지 입니다.</span>
            </li>
            </ol>
        </li>
    </ul>
    <ul style="height: 400px;">
        <li>상품 상세설명</li>
        <li>
            <textarea class="product_text1" name="p_info" id="p_info"></textarea>
            <script>
            	CKEDITOR.replace("p_info",{
            		height:290,
            		width:'100%'
            	});
            </script>
        </li>
    </ul>
</div>
<div class="subpage_view4" style="text-align:center;">
    <input type="button" value="상품 리스트" title="상품 리스트" class="p_button p_button_color1" style="margin-right: 5px;" onclick="pagego('1')">
    <input type="button" value="상품 등록" title="상품 등록" class="p_button p_button_color2" onclick="product_ck();">
</div>