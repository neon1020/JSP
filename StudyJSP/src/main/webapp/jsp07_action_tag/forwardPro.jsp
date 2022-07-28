<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forwardPro.jsp</h1>
	<%
	// post 방식 요청에 대한 인코딩 방식 변경(한글 깨짐 방지)
	// request.getParameter() 메소드 호출 전에 실행해야함!
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String jumin = request.getParameter("jumin");
	
	int num = 100; // jsp:param 에 전달
	%>
	
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>주민번호 : <%=jumin %></h3>
	<hr>
	
	<%--
	액션 태그(Action Tag)
	- JSP 페이지 내에서 자바 코드를 직접 사용하지 않고
	  XML 형식의 태그 문법을 활용하여 동일한 작업을 수행하도록 하는 태그(기능)
	- <jsp:액션태그명 속성명="값" /> 형태로 사용하며
	  태그 사이에 다른 태그를 포함해야하는 경우 끝 태그(</jsp:액션태그명>)를 사용해야함
	  => 주의! 반드시 끝에 끝태그 또는 끝 표시(/) 를 포함해야함
	- 액션 태그명 : forward, include, useBean, setProperty 등
	
	1. forward 액션 태그
	   - pageContext 객체의 forward() 메소드와 동일한 기능을 제공하는 액션 태그
	     즉, 페이지 이동(포워딩) 처리를 수행하는 액션 태그
	   - 현재 페이지의 request 객체를 그대로 유지하여 페이지 이동 수행
	     => 주소표시줄의 URL(주소)이 그대로 유지되며, request 객체에 저장된 데이터가 유지됨
	        (= Dispatcher 방식 포워딩)
	   - 포워딩 시 전달하는 데이터는 주소(URL) 뒤에 파라미터 형식으로 붙여서 전달하거나
	     (ex. forwardPro.jsp?id=admin)
	     <jsp:param> 태그를 사용하여 데이터를 포함시켜 전달 가능
	     (= form 태그에서 <input type="hidden"> 과 동일한 역할 수행)
	     => 전달되는 데이터는 GET 방식이라 하더라도 URL 에 파라미터가 노출되지 않는다!
	   
	   < 기본 문법 >
	   <jsp:forward page="포워딩 할 페이지 또는 파일" />
	   또는
	   
	   <jsp:forward page="포워딩 할 페이지 또는 파일">
	   		<jsp:param name="파라미터명1" value="데이터1" />
	   		<jsp:param name="파라미터명n" value="데이터n" />
	   </jsp:forward>  
	--%>
	
	<!-- 스크립틀릿 안 써도 된다! -->
	<%-- <jsp:forward page="forwardPro2.jsp?num=100" /> --%>
	<!-- 이동해도 주소는 forwardPro가 표시됨 => num=100 도 안보임! -->
	<!-- 이 태그에서 dispatcher 방식 요청이 일어났으므로 fowardPro2에서도 request로 값 받아올 수 있음 -->
	
	<%-- <jsp:forward page="forwardPro2.jsp"></jsp:forward> 위랑 같은 방식
	참고 : HTML이 아닌 XML 태그이므로 이 주석이 사용됨 --%>
	
	<jsp:forward page="forwardPro2.jsp">
		<jsp:param name="num" value="<%=num %>"/>
		<jsp:param name="str" value="forward 액션 태그의 param 데이터"/>
	</jsp:forward>
	
</body>
</html>