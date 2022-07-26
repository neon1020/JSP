<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>requestPro3.jsp - 학생 정보 출력</h1>
	<%
	// POST 방식으로 한글 가져올 경우 : request 객체의 setCharacterEncoding() 메소드 사용해
	// UTF-8 문자 지정 해줘야 함!
	// 반드시 파라미터값 가져오는 코드보다 앞에 위치해야 함!
	// 웬만하면 다 붙여주는 게 좋다! (get, post 방식 상관 없이)
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String grade = request.getParameter("grade");
	String[] hobby = request.getParameterValues("hobby");
	%>
	
	<h3>이름 : <%=name %></h3>
	<h3>나이 : <%=age %></h3>
	<h3>성별 : <%=gender %></h3>
	<h3>학년 : <%=grade %></h3>
	<h3>취미 : <%
			if(hobby == null) {
				out.println("없음");
			} else {
				for(int i = 0; i < hobby.length; i++) {
	 				out.println(hobby[i] + " ");
	 			}
			}
			%></h3>
</body>
</html>