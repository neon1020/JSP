<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String passwd = request.getParameter("passwd");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp3";
String user = "root";
String password = "1234";

// 1단계
Class.forName(driver);

// 2단계
Connection con = DriverManager.getConnection(url, user, password);


// board 테이블에 폼 파라미터 사용하여 글쓰기 작업 수행(INSERT)
// 글번호(idx) = 가장 큰 번호 + 1 으로 설정
// 작성일(date) = 데이터베이스의 now() 함수 사용 (자바 함수 x)
// 조회수(readcount) = 기본값 0으로 설정

// 1) 새 글 번호 계산 : 데이터베이스 max() 함수 활용
int idx = 1; // 새 글 번호 저장할 변수 선언 (기본값 1)

// 3단계
// MAX(컬럼명) 함수 사용하여 특정 컬럼에서 가장 큰 값 조회 가능
String sql = "SELECT MAX(idx) FROM board";
PreparedStatement pstmt = con.prepareStatement(sql);

// 4단계
ResultSet rs = pstmt.executeQuery();

//다음 레코드가 존재할 경우 첫번째 컬럼 값(INT 타입) + 1 값을 idx 변수에 저장
if(rs.next()) {
	idx = rs.getInt(1) + 1;
}

// ----------------------------------------------------------------------------

// 2) 글 등록하기 (INSERT)
// 3단계
// 작성일(6번 파라미터 : now() 함수 호출), 조회수(7번 파라미터 : 기본값 0)
sql = "INSERT INTO board VALUES(?,?,?,?,?,now(),0)";
pstmt = con.prepareStatement(sql);

pstmt.setInt(1, idx);
pstmt.setString(2, name);
pstmt.setString(3, passwd);
pstmt.setString(4, subject);
pstmt.setString(5, content);

// 4단계

int insertCount = pstmt.executeUpdate();

if(insertCount > 0) {
	response.sendRedirect("list.jsp");
} else { %>
	<script>
		alert("글쓰기 실패!");
		history.back();
	</script>
<%}%>
