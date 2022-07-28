<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="right">
	<!-- 로그인 성공(= 세션 아이디("sId")가 존재할 경우)과 실패에 따라 다른 메뉴 표시 -->
		<a href="session_login_form.jsp">로그인</a> | <a href="session_join_form.jsp">회원가입</a>
	</div>
	<h1 align="center">includeTest3_top.jsp</h1>
	<div align="center">
		<a href="includeTest3.jsp?pageName=main">HOME</a> 상단메뉴1 상단메뉴2 상단메뉴3 상단메뉴4 상단메뉴5
	</div>
</body>
</html>