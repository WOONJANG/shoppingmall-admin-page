$(function(){
	$( "#coupondatestart" ).datepicker({ dateFormat: 'yy-mm-dd' });
	$( "#coupondateend" ).datepicker({ dateFormat: 'yy-mm-dd' });
	
	$(function (){
		$("#usageStart").datepicker();
	 	$('#usageStart').datepicker("option", "maxDate", $("#usageEnd").val());
	    $("#usageStart").datepicker("option", "onClose", function ( selectedDate ) {
	    $("#usageEnd").datepicker( "option", "minDate", selectedDate );
	    });
		
		
		$("#usageEnd").datepicker();
		$('#usageEnd').datepicker();
	    $('#usageEnd').datepicker("option", "minDate", $("#usageStart").val());
	    $('#usageEnd').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#usageStart").datepicker( "option", "maxDate", selectedDate );
	    });
		
		$("#coupon_list_btn").click(function(){
			location.href="./admin_shopping.jsp";
		});
		
		$("#coupon_insert_btn").click(function(){
		
		let $cname = $("#cname").val();
		let $cpart = $("#cpart option:selected").val();
		let $coupondatestart = $("#coupondatestart").val();
		let $coupondateend = $("#coupondateend").val();
		let $ctype = $("#ctype option:selected").val();
		let $cdiscount = $("#cdiscount").val();
		let $cmincost = $("#cmincost").val();
		let $cimage = $("#cimage").val();
		
		console.log($ctype);
		
		if($cname == ""){
			alert("쿠폰명을 확인해주세요.");
		}
		else if($cpart == ""){
			alert("쿠폰 종류를 선택해주세요.");
		}
		else if($coupondatestart == "" || $coupondateend == ""){
			if(($coupondatestart > $coupondateend) == f) {
				alert("쿠폰 사용기한을 다시 확인해주세요.");
			}
			alert("쿠폰 사용기한을 입력해주세요.");
		}
		else if ($ctype == ""){
			alert("할인 종류 입력해주세요.")
		}
		else if($cdiscount == ""){
			alert("할인 금액 또는 할인율을 입력해주세요.")
		}
		else if($cmincost == ""){
			alert("최소 금액을 입력해주세요")
		}
		else if($cimage == "") {
			alert("쿠폰이미지를 첨부해주세요 ")
		}
		else if($ctype == "정액할인" && $cdiscount < 1000){
			alert("정액 할인 금액은 1000원 이상의 금액이 입력되어야합니다.")
		}
		else if($ctype == "정률할인" && $cdiscount > 100){
			alert("정률 할인 금액은 100% 초과의 값은 입력하실 수 없습니다.")
		}
		else if($cmincost < 10000){
			alert("최소 주문금액 설정은 만원 이상부터입니다.")
		}
		else {
			coupon_submit.submit();
		}
		
			
		})
	});
})