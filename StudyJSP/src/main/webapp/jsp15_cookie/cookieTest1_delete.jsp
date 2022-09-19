<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>클라이언트에 저장되어 있는 쿠키 삭제</h1>
	<%
	// 쿠키를 삭제하기 위해서는 쿠키의 타이머(유효기간)을 0으로 설정 후 전송
	
	// 1. 특정 쿠키 제거 (보통 이걸 많이 씀)
	// Cookie cookie = new Cookie("cookieName", null);
	// cookie.setMaxAge(0); => 타이머를 0으로 설정
	// response.addCookie(cookie);
	
	// 2. 모든 쿠키 제거
	// => Cookie[] 객체를 가져와서 각 Cookie 객체마다 타이머를 0으로 설정
	String cookieHeader = request.getHeader("Cookie");
	
	if(cookieHeader != null) {
		Cookie[] cookies = request.getCookies();
		
		for(Cookie c : cookies) {
			c.setMaxAge(0); // 각각의 Cookie 객체마다 타이머를 0으로 설정
			response.addCookie(c); // 응답객체(response)에 각 쿠키 추가
		}
	}
	
	// 삭제된 쿠키 확인을 위해 cookieTest1_use.jsp 페이지로 포워딩
	response.sendRedirect("cookieTest1_use.jsp");
	%>
</body>
</html>