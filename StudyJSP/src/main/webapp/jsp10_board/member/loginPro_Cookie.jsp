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

// member 테이블에서 id 가 파라미터와 같고, passwd 도 파라미터와 같은 레코드를 조회(SELECT)
//=> 조회 결과가 있을 경우 로그인 성공이므로 session 객체에 "sId" 라는 속성으로 아이디를 저장하고
// 메인페이지(index.jsp)로 이동
//=> 조회 결과가 없을 경우 로그인 실패이므로
// 자바스크립트를 사용하여 "로그인 실패!" 출력 후 이전 페이지로 돌아가기

//3단계
String sql = "SELECT * FROM member WHERE id=? AND passwd=?";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, id);
pstmt.setString(2, passwd);

//4단계
ResultSet rs = pstmt.executeQuery();

if(rs.next()) {
	session.setAttribute("sId", id);
	
	// ------------------------------------------------------------------------------------------------------
	// 로그인 성공 시 아이디 저장 관련 쿠키 기능 추가
	// 1. 아이디 저장 체크박스 체크 여부 판별
	if(request.getParameter("rememberId") != null) {
		// 체크박스가 체크되어 있을 경우
		// "cookieId" 라는 이름의 쿠키 생성하여 로그인에 성공한 아이디 저장(1일)
		Cookie cookie = new Cookie("cookieId", id);
		cookie.setMaxAge(60 * 60 * 24); // 1일
		response.addCookie(cookie);
	}
	
	response.sendRedirect("../index.jsp");
} else {
	%>
	<script>
		alert("아이디 또는 패스워드가 틀렸습니다!");
		history.back();
	</script>
	<%
}
%>