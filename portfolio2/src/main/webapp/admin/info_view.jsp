<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./charset.jsp" %>
<%@include file="./info_view_update.jsp" %>
<% String ID3 = (String)session.getAttribute("ID"); %>
	<div class="admin_login_add">
	    <ul>
	        <li class="font_color1">관리자 정보 수정</li>
	        <li>
	        <input type="text" name="update_id" id="update_id" class="add_input1" value="<%=ID3%>" readonly>
	        </li>
	        <li>
	            <input type="password" name="update_password" id="update_password" class="add_input1" placeholder="변경할 패스워드를 입력하세요">
	            <input type="password" name="update_password_check" id="update_password_check" class="add_input1" placeholder="동일한 패스워드를 입력하세요">
	        </li>
	        <li class="font_color1">관리자 기본정보 입력</li>
	        <li>
	            <input type="text" name="update_name" id="update_name" class="add_input1" placeholder="변경할 이름을 입력하세요">
	        </li>
	        <li>
	        <input type="text" name="update_email" id="update_email" class="add_input1 emails" placeholder="변경할 이메일을 입력하세요">
	        </li>
	        <li class="font_color1">
	        <input type="text" name="update_tel1" id="update_tel1" class="add_input1 hp1" maxlength="3"  placeholder="010">
	        -
	        <input type="text" name="update_tel2" id="update_tel2" class="add_input1 hp2" maxlength="4" placeholder="1234">
	        -
	        <input type="text" name="update_tel3" id="update_tel3" class="add_input1 hp2" maxlength="4" placeholder="5678">
	        </li>
	        <li class="font_color1">관리자 담당부서 및 직책</li>
	        <li>
	            <select name="part" id="part" class="add_select1">
	                <option>담당자 부서를 선택하세요</option>
	                <option>임원</option>
	                <option>전산팀</option>
	                <option>디자인팀</option>
	                <option>CS팀</option>
	                <option>MD팀</option>
	            </select>
	            <select name="position" id="position" class="add_select1">
	                <option>담당자 직책을 선택하세요</option>
	                <option>대표</option>
	                <option>부장</option>
	                <option>팀장</option>
	                <option>과장</option>
	                <option>대리</option>
	                <option>사원</option>
	            </select>
	        </li>
	        <li class="font_color1">※ 아이디 외에 모든 정보는 수정 할 수 있습니다.</li>
	    </ul>
	    <span class="admin_addbtn">
	        <button type="button" name="info_update_btn" id="info_update_btn" class="btn_button btncolor1" title="관리자 등록">정보 수정</button>
	    </span>
	</div>
