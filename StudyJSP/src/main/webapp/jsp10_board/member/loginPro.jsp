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

if(rs.next()) {
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