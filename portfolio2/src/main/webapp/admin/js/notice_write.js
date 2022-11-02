$(function(){
	
	$("#notice_insert_btn").click(function(){
		
//		const $notice_view = $("#notice_view").val();
		const $notice_title = $("#notice_title").val();
//		const $notice_writer = $("#notice_writer").val();
//		const $notice_file = $("#notice_file").val();
		const $notice_text = $("#notice_text").val();
		const $ckeditor_val = $( 'textarea.editor' ).val();
		if($notice_title == ""){
			alert("제목 입력");
		}
//		else if($notice_text == ""){
//			alert("내용 입력");
//		}
		else if($ckeditor_val == ""){
			alert("내용 입력");
		}
		else{
			notice.submit();
		}
		
	})
	
});

