<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 요청에 대한 한글 파라미터 처리
    request.setCharacterEncoding("UTF-8");

	// 폼파라미터 가져오기
	// 	String studentNo = request.getParameter("studentNo");
	// String 타입인 request 객체를 int 타입으로 변환!
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	// -------------------------------------------------------------------
	
	// jdbc 활용하여 study_jsp3 데이터베이스 내의 student 테이블에 데이터 추가
	String driver ="com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계
	Class.forName(driver);
	
	// 2단계
	Connection con = DriverManager.getConnection(url, user, password);
// 	out.println("DB 연결 완료");
	
	// 3단계 : +로 데이터 결합하여 삽입하기
	String sql = "INSERT INTO student VALUES (" + studentNo + ",'" + name + "','" + email + "','" + phone + "')";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 4단계
	int count = pstmt.executeUpdate();
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 정보 출력</h1>
	
	<h3>학번 : <%=studentNo %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>E-Mail : <%=email %></h3>
	<h3>전화번호 : <%=phone %></h3>
	<hr>
	<h3>학생 정보 DB 저장 완료 - <%=count %>개 레코드</h3>
</body>
</html>