<%@page import="java.sql.ResultSet"%>
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
<h1>jdbc_connect_test3_select.jsp</h1>
	
	<%
	// DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계
	Class.forName(driver);
	
	// 2단계
	// 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
	Connection con = DriverManager.getConnection(url, user, password);
	out.println("<h3>1단계 & 2단계 성공!</h3>");
	
	// 3단계
	// test2 테이블의 모든 레코드 검색(조회, SELECT)
	// select문도 3단계까지는 동일!
	String sql = "SELECT * FROM test2";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 4단계
	// => PreparedStatement 객체의 executeQuery() 메소드를 호출하여 SELECT 구문을 실행하고
	//    리턴되는 결과값을 java.sql.ResultSet 타입 변수에 저장
	ResultSet rs = pstmt.executeQuery();
	
	/*
	다음 형태의 테이블이 ResultSet 타입 객체로 리턴됨
    +------+--------+
    | idx  | name   | <- 현재 커서(Cursor) 위치(항상 첫번째 레코드 위에 위치)
    +------+--------+
    |    1 | 홍길동 | <- rs.next() 메소드를 한 번 호출했을 때의 커서 위치(true 리턴 = 레코드 있음)
    |    2 | 이순신 | <- rs.next() 메소드를 두 번 호출했을 때의 커서 위치(true 리턴 = 레코드 있음)
    +------+--------+ <- rs.next() 메소드를 세 번 호출했을 때의 커서 위치(false 리턴 = 레코드 없음)
	*/
	
// 	out.println(rs.next()); // true
// 	out.println(rs.next()); // true
// 	out.println(rs.next()); // true
// 	out.println(rs.next()); // true
// 	out.println(rs.next()); // false

// 	if(rs.next()) {
// 		out.println("레코드 존재함");
// 	} else {
// 		out.println("레코드 존재하지 않음");
// 	}

	while(rs.next()) {
// 		out.println("레코드 존재함");
		
		// 데이터 가져오기
// 		int idx = rs.getInt(1); // 컬럼 인덱스 번호 지정
		int idx = rs.getInt("idx"); // 컬럼명으로 지정
		
// 		String name = rs.getString(2);
		String name = rs.getString("name");
		
		out.println(idx + ",  " + name + "<br>");
	}
	
	%>
</body>
</html>
