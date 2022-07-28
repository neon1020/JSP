<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>includeTest2.jsp</h1>
	<h3>include 액션 태그에 의해 포함되는 페이지입니다.</h3>
	<%String paramValue = request.getParameter("paramValue"); %>
	<h3>전달받은 파라미터값 : <%=paramValue %></h3>
	
</body>
</html>