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
	<h1>jdbc_connect_test4.jsp</h1>
	
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
	// 	int num = 10;
	// 	String sql = "CREATE TABLE test2 (idx INT)";
	// 	String sql = "DROP TABLE test2";
	// 	String sql = "INSERT INTO test VALUES (?)";
	
	// 	PreparedStatement ps = con.prepareStatement(sql);
	
	// setXXX 에서 XXX는 자바 기준으로 ? 자리에 들어갈 데이터 타입을 고르면 됨
	// 	ps.setInt(1, num);
	int num = 3;
	String name = "정채연";
	
	// 	String sql = "INSERT INTO test2 VALUES (1,'홍길동')";
	// 	String sql = "INSERT INTO test2 VALUES ("+num+",'"+name+"')";

	// 만능문자 ? 사용하여 변수 데이터 교체
	// SQL 구문 전달 후 데이터 타입 지정하므로 편리
	String sql = "INSERT INTO test2 VALUES (?, ?)";
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setInt(1, num);
	ps.setString(2, name);
	
	
	
	// 4단계 : SQL 구문 실행 및 결과 처리
	int count = ps.executeUpdate();
	
	%>

	<h3>SQL 구문 실행 완료! - <%=count %></h3>
	
</body>
</html>