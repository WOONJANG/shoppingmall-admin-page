function category_search_btn(){
	return true;
}

function category_all_search(){
	location.href = "./admin_category.jsp";
}

function category_btn2(n) {
	// 삭제
	if (n == 1) {
		var arr = document.getElementsByClassName("ckproduct");
		var result = false;
		for (var f = 0; f < arr.length; f++) {
			if (document.getElementById("listck" + f).checked == true) {
				result = true;
			}
		}
		if (result == false) {
			alert("삭제할 카테고리가 선택되지 않았습니다.")
		} else {
			if (confirm("삭제하시겠습니까?")) {
				category_btn.action = "./cate_list_delete.jsp";
				category_btn.submit();
			} else {
				alert("삭제가 취소되었습니다.");
			}
		}
		// 상품 리스트 버튼
	} else if (n == 2) {
		location.href = "admin_product.jsp";
		// 카테고리 등록 버튼a
	} else if (n == 3) {
		location.href = "admin_category_write.jsp";
	}
}