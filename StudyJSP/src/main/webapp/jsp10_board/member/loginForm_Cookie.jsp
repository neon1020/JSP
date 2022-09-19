<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//쿠키에 저장된 아이디 값("cookieId" 쿠키명)을 cookieId 라는 변수에 불러오기
// 기본값으로 널스트링 설정
String cookieId = "";

String cookieHeader = request.getHeader("Cookie");

if(cookieHeader != null) {
	Cookie[] cookies = request.getCookies();
	
	for(Cookie c : cookies) {
		if(c.getName().equals("cookieId")) {
			cookieId = c.getValue();
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="loginPro.jsp" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<%-- <td><input type="text" name="id" id="name" <%if(!cookieId.equals("")) { %>value="<%=cookieId %>"<%} %> required="required"></td> --%>
				<td><input type="text" name="id" id="name" value="${cookie.cookieId.value }" required="required"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="passwd" id="passwd" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" name="rememberId">ID 기억하기</td>
			</tr>
		</table>
		
	</form>
</body>
</html>