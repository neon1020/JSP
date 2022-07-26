<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro2.jsp - 로그인 처리</h1>
	
	<%
	String strId = request.getParameter("id");
	String strPasswd = request.getParameter("passwd");
	%>
	
	<h3>아이디 : <%=strId %></h3>
	<h3>비밀번호 : <%=strPasswd %></h3>
	
	<!-- 자바 코드 내에서 문자열 데이터를 비교할 때
	동등비교연산자(==) 대신 String 객체의 equals() 메소드를 사용
	
	< 기본 문법 >
	if(문자열변수명.equals("비교할문자열")) {}
	=> 문자열이 동일한지 판별한 후 boolean 타입 결과 리턴(true : 같음, false : 다름) -->
	
	<%if(strId.equals("admin") && strPasswd.equals("1234")) {%>
<!-- 	<h3>로그인 성공!</h3> -->
<!-- 	out.println("로그인 성공!") -->
		<script type="text/javascript">
			alert("로그인 성공!");
		</script>
	<%} else { %>
<!-- 	<h3>로그인 실패!</h3> -->
<!-- 	out.println("로그인 실패!") -->
		<script type="text/javascript">
			alert("로그인 실패!");
			history.back();
		</script>
	<%} %>
</body>
</html>