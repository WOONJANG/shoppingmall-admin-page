<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% 
	String folder = application.getRealPath("/product");
	out.print(folder);
	String type="UTF-8";
	int size = 1024*1024*2;
	try{
		// MultipartRequest(POST 또는 GET 형태의 통신,저장경로,파일크기,언어셋)
		MultipartRequest multi = new MultipartRequest(request,folder,size,type);
		String d_code = multi.getParameter("/d_code");
		String filenm1 = multi.getFilesystemName("p_img1");
		String filenm2 = multi.getFilesystemName("p_img2");
		String filenm3 = multi.getFilesystemName("p_img3");
		out.print(d_code);
		out.print(filenm1);
		out.print(filenm2);
		out.print(filenm3);
	}catch(Exception e){
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="f" id="f">
	<input type="text" name="d_code"> 
	<input type="file" name="p_img1">
	<input type="file" name="p_img2">
	<input type="file" name="p_img3">
	<input type="button" value="ss" onclick="abc();">
	</form>
</body>
<script>
	function abc() {
		f.method = "POST";
		f.enctype = "multipart/form-data";
		f.action = "./test.jsp";
		f.submit();
	}
</script>
</html>