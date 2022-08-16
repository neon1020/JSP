<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
// out.println(id + " " + passwd);

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost/study_jsp3";
String user = "root";
String password = "1234";

// 1단계
Class.forName(driver);

// 2단계
Connection con = DriverManager.getConnection(url, user, password);

//3단계
String sql = "SELECT * FROM member WHERE id=? AND passwd=?";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, id);
pstmt.setString(2, passwd);

//4단계
ResultSet rs = pstmt.executeQuery();

//만약, 조회 결과가 있을 경우(rs.next() 가 true) 로그인 성공이므로
//=> 세션 객체에 "sId" 라는 속성명으로 로그인 아이디를 저장하고 메인페이지(index.jsp)로 이동
if(rs.next()) {
	session.setAttribute("sId", id);
	response.sendRedirect("../index.jsp");
} else {
	%>
	<script>
		alert("로그인 실패!");
		location.href = "history.back()"
	</script>
	<%
}
%>