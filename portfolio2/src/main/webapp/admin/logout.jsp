<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
out.print("<script>alert('세션 초기화 완료')</script>");
out.print("<script>location.href='./index.html'</script>");
%>