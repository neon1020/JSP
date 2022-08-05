<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// out.println(request.getParameter("idx") + ", " + request.getParameter("passwd"));

// DELETE 구문 사용하여 글번호(idx) 와 패스워드(passwd)가 일치하는 게시물 삭제 후
// 삭제 성공 시 글 목록(list.jsp)으로 이동

// 파라미터 가져오기
int idx = Integer.parseInt(request.getParameter("idx"));
String passwd = request.getParameter("passwd");

// --------------------------------------------------------------------------------

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp3";
String user = "root";
String password = "1234";

// 1단계
Class.forName(driver);

// 2단계
Connection con = DriverManager.getConnection(url, user, password);

// 3단계 : 글번호 & 패스워드 일치하는 레코드 삭제
String sql = "DELETE FROM board WHERE idx= ? AND passwd= ?";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setInt(1, idx);
pstmt.setString(2, passwd);

// 4단계
int count = pstmt.executeUpdate();


// 삭제 성공 시 글 목록(list.jsp)으로 이동
if(count > 0) {
	response.sendRedirect("list.jsp");
} else {%>
	<script>
		alert("삭제 실패!");
		history.back();
	</script>
<%}%>

