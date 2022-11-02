function product_btn2(n) {
	// 삭제
	if(n==1){
		var arr = document.getElementsByClassName("ckproduct");
		var result = false;
		for(var f=0; f<arr.length; f++){
			if(document.getElementById("listck"+f).checked == true){
				result = true;
			}
		}
	if(result == false){
		alert("삭제할 상품이 선택되지 않았습니다.")
	}else{
		if(confirm("삭제하시겠습니까?")){
			product_btn.action ="./product_list_delete.jsp";
			product_btn.submit();
		}else{
			alert("삭제가 취소되었습니다.");
		}
	}
	// 상품등록
	}else if(n==2){
		location.href = "./admin_product_write.jsp";
	// 카테고리 등록
	}else if(n==3){
		location.href = "./admin_category_write.jsp";
	}
}

function pagego(pgno) {
	location.href = "./admin_product.jsp?page=" + pgno;
}

function rightpage(pg) {
	var intpg = Integer.parseInt(pg);
	var plus = 1;
	var intplus = Integer.parseInt(plus);
	location.href = "./admin_product.jsp?page=" + intpg + intplus;
};