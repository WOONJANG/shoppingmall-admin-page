function gopage(n){
	// notice view 에서 notice list로 목록으로
	if(n == 1){
		location.href="./admin_notice.jsp";
	}
	// 수정
	else if(n == 2){
		notice_view_btn.action = "./notice_view_modify.jsp";
		notice_view_btn.submit();
	}
	// 삭제
	else if(n == 3){
		notice_view_btn.action = "./notice_view_delete.jsp";
		notice_view_btn.submit();
	}
}
