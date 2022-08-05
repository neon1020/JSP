<%@page import="java.sql.Date"%>
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
	<%
	// 글 번호(idx) 없을 경우(= null)
	// 자바스크립트 사용하여 출력문 출력 후 메인페이지 돌아가기
	
	if(request.getParameter("idx") == null) {%>
	<script type="text/javascript">
		alert("잘못된 접근입니다!");
		location.href = "../index.jsp";
	</script>
	<%}%>
	
	<h1>글 상세내용 보기</h1>
	
	<%
	// 글번호에 해당하는 레코드 조회 후 조회 성공 시 테이블을 통해 게시물 상세 정보 출력
	// => 글번호, 작성자, 제목, 내용, 작성일, 조회수
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";

	// 1단계
	Class.forName(driver);

	// 2단계
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql = "SELECT * FROM board WHERE idx =?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);

	// 4단계
	ResultSet rs = pstmt.executeQuery();
	
	if (rs.next()) {%>
		
		<table border="1">
		<tr>
			<th width="100">글번호</th><td width="100"><%=idx %></td>
			<th width="100">작성자</th><td width="100"><%=rs.getString("name") %></td>
			<th width="100">작성일</th><td width="100"><%=rs.getDate("date") %></td>
		</tr>
		
		<tr>
			<th>제목</th><td colspan="3"><%=rs.getString("subject") %></td>
			<th>조회수</th><td><%=rs.getInt("readcount") %></td>
		</tr>
		
		<tr>
			<th>내용</th><td colspan="5"><%=rs.getString("content") %></td>
		</tr>
		
		<tr>
			<td colspan="6" align="right">
				<input type="button" value="수정" onclick="location.href='updateForm.jsp?idx=<%=idx %>'">
				<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?idx=<%=idx %>'">
				<input type="button" value="목록" onclick="location.href='list.jsp'">
			</td>
		</tr>
	</table>
	<%}%>
	
	<!-- 글 번호 출력 -->
<%-- 	<%=	request.getParameter("idx")%> --%>
</body>
</html>