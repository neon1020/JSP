<%@page import="jsp11_javabean2.BoardDAO"%>
<%@page import="jsp11_javabean2.BoardDTO"%>
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

// 가져온 폼 파라미터 데이터를 BoardDTO 객체(board) 생성하여 저장
BoardDTO board = new BoardDTO();

board.setIdx(idx);
board.setPasswd(passwd);

// DB 작업 수행 위한 BoardDAO 객체(dao) 생성
BoardDAO dao = new BoardDAO();

// BoardDAO 객체의 delete() 메소드 호출하여 글삭제 수행
// => 파라미터 삭제할 게시물 정보(BoardDTO객체 - board)  리턴타입 : int(deleteCount)
int deleteCount = dao.delete(board);


if(deleteCount > 0) {%>
	<script type="text/javascript">
		alert("게시물 삭제 성공!")
		location.href = "list.jsp";
	</script>
<%} else {%>
	<script>
		alert("게시물 삭제 실패!");
		history.back();
	</script>
<%}%>