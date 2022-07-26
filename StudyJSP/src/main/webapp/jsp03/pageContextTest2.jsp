<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>pageContextTest2.jsp</h1>
	<h1>pageContext 객체의 include() 메소드 호출 전</h1>
	<hr>
	<%
	// include() 메소드 호출하여 포함시킬 페이지 지정
	pageContext.include("pageContextTest3-1.jsp");
	%>
	<hr>
	<%
	pageContext.include("pageContextTest3-2.jsp");
	%>
	<hr>
	<h1>pageContext 객체의 include() 메소드 호출 후</h1>
</body>
</html>