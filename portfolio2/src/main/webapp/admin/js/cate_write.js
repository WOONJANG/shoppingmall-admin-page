$(function(){	// 제이쿼리 시작
	
		// 카테고리 생성 함수
		$("#create_category").click(function(){
			
		const $cate_input2 = $("#cate_input2").val();	// 대메뉴 코드
		const $cate_input3 = $("#cate_input3").val();	// 대메뉴 이름
		const $cate_input4 = $("#cate_input4").is(":checked");	// 대메뉴만 사용 체크박스
		console.log($cate_input4);
		const $cate_input5 = $("#cate_input5").val();	// 소메뉴 코드
		const $cate_input6 = $("#cate_input6").val();	// 소메뉴 이름
		const $cate_input7 = $("#cate_input7").val();	// 사용 유무
		
		if($cate_input2 == ""){
			alert("대메뉴 코드를 입력해주세요");
		}
		else if($cate_input3 == ""){
			alert("대메뉴명을 입력해주세요");
		}
		else if ($cate_input4 == false &&$cate_input5.length < 2){
			alert("소메뉴 코드를 2자리 이상 입력해주세요");
		}
		else if($cate_input7 == ""){
			alert("사용 유/무 체크");
		}
		else{
			if($cate_input4 == false && $cate_input6.length <= 0){
				alert("소메뉴명을 입력해주세요");
			}
			else{
				category_form.submit();
			}
		}
	});		 
		
		// 카테고리 리스트 버튼
		$("#category_list").click(function(){
			location.href="./admin_category.jsp";
		});
});	// 제이쿼리 마지막

	// 분류코드 오토인풋(대메뉴코드 + 소메뉴코드)
	function plus() {
			let bigcode = document.getElementById("cate_input2").value;
			let smaillcode = document.getElementById("cate_input5").value;
			document.getElementById("cate_input1").value = bigcode + smaillcode;
	};

	// 대메뉴만 생성 체크시 소메뉴 일괄 disabled
	function onlybig() {
		let bigcode = document.getElementById("cate_input2").value;	// 분류코드 벨류
		let cate_input4 = document.getElementById("cate_input4");	// 체크박스
		let cate_input5 = document.getElementById("cate_input5");	// 소메뉴 코드
		let cate_input6 = document.getElementById("cate_input6");	// 소메뉴명

		if(!cate_input4.checked) {
			cate_input5.removeAttribute("disabled");
			cate_input6.removeAttribute("disabled");
		}
		else {
			cate_input5.disabled ="true";
			cate_input5.value = "";
			cate_input6.disabled ="true";
			cate_input6.value = "";
			document.getElementById("cate_input1").value = bigcode;
		}
	}