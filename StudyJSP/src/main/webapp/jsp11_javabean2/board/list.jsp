<%@page import="jsp11_javabean2.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp11_javabean2.BoardDAO"%>
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
		// DB 작업 위한 BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
		
		// DB 조회 작업 수행 위한 BoardDAO 객체의 select() 메소드 호출
		// => 파라미터 : 없음, 리턴타입 : java.util.ArrayList (boardList)
		ArrayList boardList = dao.select();
		
		// for문 사용하여 ArrayList 객체 크기만큼 반복
		for(int i = 0; i < boardList.size(); i++) {
// 			Object o = boardList.get(i);

			// Object -> BoardDTO 로 다운캐스팅 (ArrayList 안에 들어있는 내용은 Object 타입)
			BoardDTO board = (BoardDTO)boardList.get(i);
			%>
			<tr>
				<td><%=board.getIdx() %></td>
				<!-- 게시물 제목 클릭 시 content.jsp 페이지로 이동 (글번호(idx)를 파라미터로 전달) -->
				<td><a href="content.jsp?idx=<%=board.getIdx() %>"><%=board.getSubject() %></a></td>
				<td><%=board.getName() %></td>
				<td><%=board.getDate() %></td>
				<td><%=board.getReadcount() %></td>
			</tr>
			<%
		}
		%>
			
			
	</table>
	<div align="right"><input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'"></div>
</body>
</html>