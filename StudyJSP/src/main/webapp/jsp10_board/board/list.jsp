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
	<h1>글 목록</h1>
	<table border="1">
		<tr>
			<th width="50">번호</th>
			<th width="400">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>
		<%
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost/study_jsp3";
		String user = "root";
		String password = "1234";

		// 1단계
		Class.forName(driver);

		// 2단계
		Connection con = DriverManager.getConnection(url, user, password);

		//3단계
		// 최신글(= 글 번호 높음)이 위로 오게하기 위해 내림차순 정렬
		String sql = "SELECT * FROM board ORDER BY idx DESC";
		PreparedStatement pstmt = con.prepareStatement(sql);

		//4단계
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int idx = rs.getInt("idx");
			String subject = rs.getString("subject");
			String name = rs.getString("name");
			String date = rs.getString("date"); // getDate도 있음
			int readcount = rs.getInt("readcount");%>
			
			<tr>
				<td><%=idx %></td>
				<!-- 게시물 제목 클릭 시 content.jsp 페이지로 이동 (글번호(idx)를 파라미터로 전달) -->
				<td><a href="content.jsp?idx=<%=idx %>"><%=subject %></a></td>
				<td><%=name %></td>
				<td><%=date %></td>
				<td><%=readcount %></td>
			</tr>
			
		<%}%>
	</table>
	<div align="right"><input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'"></div>
</body>
</html>