<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jdbc_connect_practice</h1>
	
	<%
	// 1단계 : JDBC 드라이버 클래스 로드
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	Class.forName(driver);
	
	
	
	// 2단계 : DB 연결
	Connection con = DriverManager.getConnection(url, user, password);
	
	
	
	// 3단계 :  SQL 구문 작성 및 전달
	// String sql = "CREATE TABLE practice1(idx INT, name VARCHAR(10))"; // 테이블 생성
	String sql = "INSERT INTO practice1 VALUES(?, ?)"; // 데이터 삽입
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, 1);
	ps.setString(2, "정채연");
	
	
	
	// 4단계 : SQL 구문 실행 및 결과 처리
	int count = ps.executeUpdate();
	
	%>
	
	<h3>SQL 구문 실행 완료! - <%=count %></h3>
	
</body>
</html>