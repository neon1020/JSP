<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_connect_test3.jsp</h1>
	
	<%
	// DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계 : 드라이버 클래스 로드
	Class.forName(driver);
	
	// 2단계 : DB 연결
	// 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
	Connection con = DriverManager.getConnection(url, user, password);
	%>
	
	<h3>1단계 & 2단계 성공!</h3>
	<h3>Connection 객체 정보 : <%=con %></h3>
	
	<%
	// 3단계 : SQL 구문 작성 및 전달
	
	// 1) SQL 구문 작성 (세미콜론 필요 x)
// 	String sql = "CREATE TABLE test (idx INT)"; // 테이블 생성 구문
	String sql = "CREATE TABLE test2 (idx INT, name VARCHAR(10))"; // 테이블 생성 구문
// 	String sql = "DROP TABLE test"; // 테이블 삭제 구문

// 	String sql = "INSERT INTO test VALUES (2)"; // 데이터 삽입
// 	String sql = "DELETE FROM test"; // 테이블 삭제

	// 2) 작성된 SQL 구문 전달
	// Connection 객체(변수 con)의 prepareStatement() 메서드를 호출하여 SQL 구문 전달
	// => 파라미터 : SQL 구문(변수 sql)   리턴타입 : java.sql.PreparedStatement
	PreparedStatement pstmt = con.prepareStatement(sql);

	%>
	
	<h3>SQL 구문 전달 완료!</h3>
	
	<%
	// 4단계 : SQL 구문 실행 및 결과 처리
	// => CREATE, DROP, INSERT, DELETE 등을 실행하기 위해 executeUpdate() 메소드 호출
	int count = pstmt.executeUpdate();
	%>
	
	<h3>SQL 구문 실행 완료! - <%=count %></h3>
	
</body>
</html>