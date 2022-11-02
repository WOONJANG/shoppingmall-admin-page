$(function(){
	
	$("#info_update_btn").click(function(){
		const $update_password = $("#update_password").val();
		const $update_password_ck = $("#update_password_check").val();
		const $update_name = $("#update_name").val();
		const $update_email = $("#update_email").val();
		const $update_tel1 = $("update_tel1").val();
		const $update_tel2 = $("update_tel2").val();
		const $update_tel3 = $("update_tel3").val();
		
		if($update_password == "") {
			alert("변경할 패스워드를 입력해주세요.");
		}
		else if($update_password_ck == "") {
			alert("패스워드 확인란을 입력해주세요");
		}
		else if($update_password != $update_password_ck) {
			alert("변경할 패스워드를 동일하게 입력해주세요");
		}
		else if($update_name == "") {
			alert("변경할 이름을 입력해주세요");
		}
		else if($update_email == "") {
			alert("변경할 이메일 입력해주세요");
		}
		else if($update_tel1 == "" || $update_tel2 == "" || $update_tel3 == "") {
			alert("변경할 전화번호를 정확하게 입력해주세요");	
		}
		else {
			info_update.submit();
		}
	})
});
