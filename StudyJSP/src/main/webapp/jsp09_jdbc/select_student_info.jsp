<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
 
 	String driver ="com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	// 1단계
	Class.forName(driver);
	
	// 2단계
	Connection con = DriverManager.getConnection(url, user, password);
// 	out.println("DB 연결 완료");
	
	// 3단계 : 학번이 일치하는 레코드 조회
	String sql = "SELECT * FROM student WHERE student_no=?;";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, studentNo);
	
	
	
	// 4단계
	ResultSet rs = pstmt.executeQuery();
	
	String name = "";
	String email = "";
	String phone = "";
	
	// ResultSet 객체로부터 데이터 꺼내서 변수에 저장하기
	// 검색된 데이터가 1줄(행)이라고 가정
	if(rs.next()) {
		name = rs.getString("name");
		email = rs.getString("email");
		phone = rs.getString("phone");
	}
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 상세 정보 조회</h1>
	<h3>학번 : <%=studentNo %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>E-Mail : <%=email %></h3>
	<h3>전화번호 : <%=phone %></h3>
</body>
</html>