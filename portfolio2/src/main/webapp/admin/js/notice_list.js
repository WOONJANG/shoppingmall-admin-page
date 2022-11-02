function notice_btn2(n) {
	// 삭제
	if (n==1) {
		var arr = document.getElementsByClassName("cknotice");
		var result = false;
		for(var f=0; f<arr.length; f++){
			if(document.getElementById("listck"+f).checked == true){
				result = true;
				
			}
		}
		
	if(result == false){
		alert("삭제할 공지사항이 선택되지 않았습니다.")
	}else{
		if(confirm("삭제하시겠습니까?")){
			notice_btn.action ="./notice_view_delete.jsp";
			notice_btn.submit();
		}else{
			alert("삭제가 취소되었습니다.");
		}
	}
		// 등록
	} else if(n==2) {
		location.href = "./admin_notice_write.jsp";
	}
}

function detail_view(idx) {
	notice_btn.action="./notice_detail_view_plus.jsp?nidx=" + idx;
	notice_btn.submit(idx);
}

function pagego(pgno) {
	location.href = "./admin_notice.jsp?page=" + pgno;
}

function rightpage(pgno) {
	var intpg = Integer.parseInt(pgno);
	var plus = 1;
	var intplus = Integer.parseInt(plus);
	location.href = "./admin_notice.jsp?page=" + intpg + intplus;
};