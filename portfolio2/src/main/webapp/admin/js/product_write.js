function pagego(n) {
	let url = "";

	switch (n) {
		// 상품 리스트 버튼
		case "1":
			url = "admin_product.jsp";
			break;
	}
	location.href = url;
}

function product_ck() {
	if (frm.d_code.value == "") {
		alert("대메뉴 카테고리를 선택하세요");
	}
	else if (frm.p_code.value == "") {
		alert("상품코드를 입력하세요");
	}
	else if (frm.p_name.value == "") {
		alert("상품명을 입력하세요");
	}
	else if (frm.p_text.value == "") {
		alert("부가설명을 입력하세요");
	}
	else if (frm.p_money.value == "") {
		alert("판매금액을 입력하세요");
	}
	else if (frm.p_ea.value == "") {
		alert("재고를 입력하세요");
	}
	else {
		if (isNaN(frm.p_money.value) == true) {
			alert("판매금액은 숫자만 입력하세요");
			return false;
		}
		else if (Number(frm.p_money.value) < 1000) {
			alert("판매금액은 최소 1000원 입니다");
			return false;
		}
		else {
			if (frm.p_sale.value == 0 || frm.p_sale.value == "") {
				frm.p_salemoney.value == "0";
			}
//			else if (frm.codeok.value == "") {
//				alert("상품코드 중복체크를 하세요")
//			}
			else { 
//				// 파일첨부 체크
//				let w = 1;
//				var filenm = document.getElementById("p_img"+w).value;
//				// 속성명 소문자로 변환
//				let propery = file.slice(filenm.indexOF(".")+1).toLowerCase();
//				if(propery != "jpeg"||propery != "jpg"||propery != "bmp"||propery != "png"||propery != webb){
//					alert("이미지 파일만 업로드 가능합니다");
//				}
				frm.method = "POST";
				frm.enctype = "multipart/form-data";
				frm.action = "product_write_insert.jsp";
				frm.submit();
			}
		}
	}
}

/* 상품코드 중복 ajax */

$(function() {
	$("#product_ajax").click(function(){
		let $p_code = $("#p_code").val();
		if ($p_code == "") {
			alert("중복체크 하세요.");
		}
		else {
			$.fn.codeduple($p_code)
		}
	});
	$.fn.codeduple = function($p_code){
		$.ajax({
			url: "product_check.jsp",
			cache: false,
			type: "POST",
			data: {"p_code":$p_code },
			dataType: "text",
			enctype: "application/x-www-form-urlencoded",
			success: function($RESULT){
				let $DUPLICATE = $.parseJSON($RESULT);
				console.log($DUPLICATE);
				if ($DUPLICATE == "no") {
					alert("중복 코드");
				}
				else if ($DUPLICATE == "ok") {
					alert("사용 가능한 코드");
					$("#p_code").prop("readonly", true);
				}
			},
			error: function($RESULT) {
				let $DUPLICATE = $.parseJSON($RESULT);
//				alert("server error");
				alert($DUPLICATE);
			}
		})
	}
})


/* 할인율 자동 계산 */

function calcs(z) {

	if (frm.p_money.value == "") {
		alert("할인율 적용시 판매가격 1000원 이상 입력하세요");
	}
	else {
		let money = Number(frm.p_money.value);
		let sale = Number(z);
		let total = "";

		total = money - (money * (sale / 100));
		frm.p_salemoney.value = total;



		console.log(total);
	}

}