<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 아이디 패스워드 가져와서 변수에 저장
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro4.jsp</h1>
	<!-- 아이디 패스워드 출력 -->
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	
<%-- 	<%if(id.equals("admin") && passwd.equals("1234")) {%> --%>
<!-- 	<script type="text/javascript">alert("로그인 성공!")</script> -->
<%-- 	<%} else { %> --%>
<!-- 	<script type="text/javascript">alert("로그인 실패!")</script> -->
<%-- 	<%} %> --%>


		<!-- 로그인 성공 시 requestPro4_responseResult1.jsp 페이지로 이동 -->
		<!-- 로그인 실패 시 requestPro4_responseResult2.jsp 페이지로 이동 -->
		<!-- 페이지 이동 방법 : 1) 하이퍼링크   2) 자바스크립트 location.href   3) 자바 response.sendRedirect -->
		
		<!-- 자바스크립트 location 객체로 이동하기 -->
		<%if(id.equals("admin") && passwd.equals("1234")) { %>
			<script type="text/javascript">
// 				location.href="requestPro4_responseResult1.jsp"
			</script>
		<%} else { %>
			<script type="text/javascript">
// 				location.href="requestPro4_responseResult2.jsp"
			</script>
		<%} %>
		
		<!-- 자바 response 객체로 이동하기 -->
		<%
		if(id.equals("admin") && passwd.equals("1234")) {
			response.sendRedirect("requestPro4_responseResult1.jsp"); // get 방식!
		} else {
			response.sendRedirect("requestPro4_responseResult2.jsp");
		}
		%>
</body>
</html>
