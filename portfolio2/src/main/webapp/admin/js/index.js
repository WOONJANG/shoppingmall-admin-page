$(function(){
	$("#login_check").submit(function(){
		let $ID = $("#input_login_id").val();
		let $PW = $("#input_login_pw").val();
		
		if($ID == ""){
			alert("아이디를 입력해주세요.");
			$("#input_login_id").focus();
			return false;
		}
		else if ($PW == ""){
			alert("비밀번호를 입력해주세요.")
			$("#input_login_pw ").focus();
			return false;
		}
		else{
			return true;
		}
	})
	
	
	
	// 신규 관리자 등록 요청 버튼
	$("#new_account_btn").click(function(){
		location.href="./add_master.html";
	});
	
	// 아이디 / 패스워드 찾기 버튼
	$("#search_account_btn").click(function(){
		location.href="./add_master_search.html";
	});
});










