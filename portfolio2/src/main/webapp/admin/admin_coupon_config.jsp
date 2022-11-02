<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="charset.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰 환경설정</title>
    <link rel="stylesheet" type="text/css" href="./css/basic.css">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=1">
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <link rel="stylesheet" type="text/css" href="./css/shipping.css?v=1">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
    <script src="./js/jquery.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="./js/coupon_insert.js?v=00000015"></script>
</head>
<body>
<header class="headercss">
<%@include file="./admin_header.html" %>
</header>
<nav class="navcss">
<%@include file="./admin_menu.html" %>
</nav>
<form name="coupon_submit" id="coupon_submit" method="post" action="./coupon_insert_insert.jsp">
<main class="maincss">
<section style="height: 85vh;">
<%@include file="./coupon_insert.jsp" %>
</section>
</main>
</form>
<footer class="main_copyright">
<%@include file="./admin_footer.html" %>
</footer>
</body>
</html>