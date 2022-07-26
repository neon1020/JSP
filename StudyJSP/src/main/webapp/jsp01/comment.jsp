<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HTML 주석입니다. 이 주석은 웹브라우저 소스보기를 통해 확인이 가능합니다. -->
	<h1>test.jsp</h1>
	
	<%--
	JSP 주석입니다. 이 주석은 서버에서 처리되므로 웹브라우저 소스보기를 통해 확인이 불가능합니다.
	=> JSP 코드가 포함될 경우 HTML 주석으로는 처리 불가능하므로 반드시 JSP 주석 사용
	--%>
	<%
	// 이 부분은 자바 코드가 기술되는 부분으로 웹브라우저에서 코드가 표시되지 않습니다.
	// => 서버에서 처리되는 코드입니다.
	Timestamp now = new Timestamp(System.currentTimeMillis());
	%>
	<!-- <h3>현재 시각 : <%=now %></h3> -->
	<!-- 주의! JSP 코드가 포함된 부분을 HTML 주석으로 처리할 경우 JSP 코드는 실행된다! -->
</body>
</html>
