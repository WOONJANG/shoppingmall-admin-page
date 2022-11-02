$(function(){
	
	$("#create_account_btn").click(function(){
		let $ID = $("#input_id").val();
		const $PW = $("#input_pw").val();
		const $PW_CK = $("#input_pw_ck").val();
		const $NAME = $("#input_name").val();
		const $EMAIL = $("#input_email").val();
		const $TEL = $("#input_tel3").val();
		const $PART = $("#part").val();
		const $POSITION = $("#position").val();
		
		if($ID == ""){
			alert("아이디를 입력하세요.");
			$("#input_id").focus();
		}
		else if($ID == "master" || $ID == "MASTER" || $ID == "admin" || $ID == "ADMIN"){
			alert("admin 및 master 라는 아이디는 사용 불가합니다");
			$("#input_id").focus();
		}
		else{
			if($PW == ""){
				alert("패스워드를 입력하세요.");
				$("#input_pw").focus();
			}
			else if ($PW != $PW_CK){
				alert("동일한 패스워드를 입력하세요.");
				$("#input_pw_ck").focus();
			}
			else{
				if($NAME == ""){
					alert("이름을 입력하세요.");
					$("#input_name").focus();
				}
				else{
					if($EMAIL == ""){
						alert("이메일을 입력하세요.");
						$("#input_email").focus();
					}
					else{
						if($TEL == ""){
							alert("전화번호를 입력하세요.");
							$("#input_tel2").focus();
						}
						else{
							if($PART == ""){
								alert("부서를 선택해주세요");
							}
							else{
								if($POSITION == ""){
									alert("직책을 선택해주세요");	
								}
								else{
									account_submit.submit();
								}
							}
						}
					}
				}
			}
		}
	})
	
		// 등록 취소 버튼
	$("#create_account_cancle_btn").click(function(){
		location.href="./index.html";
	})
	
//		 아이디 중복 체크 버튼
	$("#id_ck").click(function(){
		let $ID = $("#input_id").val(); 
		if($ID == ""){
			alert("아이디 입력 후 중복체크 하세요.");
		}
		else{
			$.fn.idduple($ID)
		}
	});
	
	$.fn.idduple=function($ID){
		$.ajax({
			url : "id_check.jsp",
			cache : false,
			type : "post",
			data : {"ID" : $ID},
			dataType : "html",
			enctype : "application/x-www-form-urlencoded",
			success : function($RESULT){
				let $DUPLICATE = $.parseJSON($RESULT);
				console.log($DUPLICATE);	
				if($DUPLICATE == "0"){
					alert("존재하는 아이디");
				}
				else if ($DUPLICATE == "1"){
					alert("사용 가능한 아이디");
					$("#input_id").prop("readonly",true);
				}
			},
			error : function(){
				alert("server error")
			}
	})
		
			
		}
	
	
})	// 제이쿼리 마지막