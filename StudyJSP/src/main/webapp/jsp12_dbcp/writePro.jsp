<%@page import="jsp12_dbcp.BoardDTO"%>
<%@page import="jsp12_dbcp.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String passwd = request.getParameter("passwd");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

// 데이터베이스 작업 수행 위해 BoardDAO 클래스 인스턴스 생성
BoardDAO dao = new BoardDAO();

// BoardDAO 객체의 insert() 메소드 호출하여 글쓰기 작업 수행
// => 파라미터 : 작성자, 패스워드, 글제목, 글내용
// dao.insert(name, passwd, subject, content); => 메소드에 변수 직접 전달할 경우

// -----------------------------------------------------------------------------------

// DTO 객체 활용하여 변수 저장 후 DTO 객체를 파라미터로 전달할 경우
// => 파라미터 : BoardDTO 객체

// 1) BoardDTO 클래스의 인스턴스(객체) 생성
BoardDTO board = new BoardDTO();

// 2) BoardDTO 객체의 Setter 메소드 호출하여 각 게시물 정보를 멤버변수에 저장
board.setName(name);
board.setPasswd(passwd);
board.setSubject(subject);
board.setContent(content);

// 3) BoardDAO 객체의 insert() 메소드 호출하여 글쓰기 작업 수행
//=> 파라미터 : BoardDTO 객체, 리턴타입(int insertCount)
int insertCount = dao.insert(board);


if(insertCount > 0) {
	response.sendRedirect("list.jsp");
} else { %>
	<script>
		alert("글쓰기 실패!");
		history.back();
	</script>
<%}%>
