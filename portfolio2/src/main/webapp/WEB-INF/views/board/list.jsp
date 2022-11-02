<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<style type="text/css">
.row {
	margin: 0px auto;
	width: 900px;
}

h1 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>게시판</h1>
			<table class="table">
				<tr>
					<td><a href="./insert" class="btn btn-sm btn-primary">새글</a>
					</td>
				</tr>
			</table>
			<div>
				<div id="searchMember" style="height: 100px; margin: 0px auto; text-align: center;">
						<select name="searchType">
							<option value="" disabled selected>검색타입</option>
							<option value="name">아이디</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>	
						</select> <input type="text" name="keyword"> 
                        <input type="submit" value="검색">
				</div>
			</div>
			<table class="table table-striped">
				<tr class="danger">
					<th class="text-center" width=10%>번호</th>
					<th class="text-center" width=45%>제목</th>
					<th class="text-center" width=15%>이름</th>
					<th class="text-center" width=20%>작성일</th>
					<th class="text-center" width=10%>조회수</th>
				</tr>
					<tr>
						<td class="text-center" width=10%></td>
						<td class="text-left" width=45%><a
							href=""></a></td>
						<td class="text-center" width=15%></td>
						<td class="text-center" width=20%><%-- <fmt:formatDate
								value="" pattern="yyyy-MM-dd" /> --%></td>
						<td class="text-center" width=10%></td>
					</tr>
			</table>
			<table class="table">
				<td class="text-center">
                    <a href="#" class="btn btn-sm btn-primary">이전</a> page /
					pages <a href="#" class="btn btn-sm btn-primary">다음</a>
				</td>
			</table>
		</div>
	</div>
</body>
</html>