<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//DELETE 구문 사용하여 글번호(idx) 와 패스워드(passwd)가 일치하는 게시물 삭제 후
//삭제 성공 시 글 목록(list.jsp)으로 이동

request.setCharacterEncoding("UTF-8");

//파라미터 가져오기
int idx = Integer.parseInt(request.getParameter("idx"));
String passwd = request.getParameter("passwd");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

//--------------------------------------------------------------------------------

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp3";
String user = "root";
String password = "1234";

//1단계
Class.forName(driver);

//2단계
Connection con = DriverManager.getConnection(url, user, password);

//3단계 : 글번호(idx) & 패스워드(passwd) 일치하는 레코드의 글제목과 글내용 수정 (UPDATE)
String sql = "UPDATE board SET subject=?, content=? WHERE idx=? AND passwd=?";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, subject);
pstmt.setString(2, content);
pstmt.setInt(3, idx);
pstmt.setString(4, passwd);

//4단계
int count = pstmt.executeUpdate();

if(count > 0) { // 수정 성공 시
	// content.jsp 페이지로 포워딩 => URL 파라미터로 글번호(idx) 전달
	response.sendRedirect("content.jsp?idx=" + idx);
} else { // 수정 실패 시
	%>
	<script>
		alert("글 수정 실패!");
		history.back();
	</script>
	<%
}
%> 
