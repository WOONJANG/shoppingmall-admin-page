$(function(){	// 제이쿼리 시작
	
	$("#save_btn").click(function(){
	
		const $homepage_title = $("#homepage_title").val(); // 홈페이지 제목
		const $homepage_email = $("#homepage_email").val();	// 관리자 메일주소
		const $join_point = $("#join_point").val();	// 회원가입시 적립금
		const $join_level = $("#join_level").val();	//회원가입시 권한레벨
		const $company_name = $("#company_name").val();	// 회사명
		const $company_number = $("#company_number").val();	// 사업자등록번호
		const $head_name = $("#head_name").val();	// 대표자명
		const $head_tel = $("#head_tel").val(); // 대표전화번호
		const $business_number = $("#business_number").val();	// 통신판매업 신고번호
		const $tele_business_number = $("#tele_business_number").val();	// 부가통신 사업자 번호
		const $company_zipcode = $("#company_zipcode").val();	// 사업장 우편번호
		const $company_addr = $("#company_addr").val();
		const $info_manager_name = $("#info_manager_name").val();	// 정보책임관리자명
		const $info_manager_email = $("#info_manager_email").val();	// 정보책임관리자 메일주소
		const $without_bankbook = $("#without_bankbook").val();	// 무통장 은행명
		const $bank_account_number = $("#bank_account_number").val();	// 은행 계좌번호명
		const $min_point = $("#min_point").val();	// 결제 최소 포인트
		const $amx_point = $("#amx_point").val();	// 결제 최대 포인트
		const $shipping_name = $("#shipping_name").val();	// 배송업체명
		const $shipping_cost = $("#shipping_cost").val();	//배송비 가격
		
		if($homepage_title == ""){
			alert("홈페이지 제목 입력")
		}
		else if($homepage_email == ""){
			alert("관리자 메일 주소 입력")
		}
		else if($join_point == ""){
			alert("가입시 적립금 입력")
		}
		else if($join_level == ""){
			alert("회원가입시 권한 레벨 입력")
		}
		else if($company_name == ""){
			alert("회사명 입력")
		}
		else if($company_number == ""){
			alert("사업자 등록 번호 입력")
		}
		else if($head_name == ""){
			alert("대표자명 입력")
		}
		else if($head_tel == ""){
			alert("대표자 전화번호 입력")
		}
		else if($company_zipcode == ""){
			alert("사업장 우편번호")
		}
		else if($company_addr == ""){
			alert("사업장 주소 입력")
		}
		else if($info_manager_name == ""){
			alert("정보관리 책임자 명 입력")
		}
		else if($info_manager_email == ""){
			alert("정보 책암자 메일주소 입력")
		}
		else if($without_bankbook == ""){
			alert("무통장 은행 입력")
		}
		else if($bank_account_number == ""){
			alert("계좌번호 입력")
		}
		else if($min_point == ""){
			alert("최소 사용 포인트 입력")
		}
		else if($amx_point == ""){
			alert("최대 사용 포인트 입력")
		}
		else if($shipping_name == ""){
			alert("택배회사명 입력")
		}
		else if($shipping_cost == ""){
			alert("배송비 가격 입력")
		} 
		else{
			homepage_join.submit();
		}
		
	
	
	})
	
	// 저장 취소 버튼
	$("#cancle_btn").click(function(){
        $(location).prop("href", location.href);
	
	})
	
})	// 제이쿼리 마지막