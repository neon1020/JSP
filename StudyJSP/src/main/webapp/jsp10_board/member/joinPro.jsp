<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 게시판 글쓰기 기능과 회원가입 기능은 같은 과정!!

request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
String email = request.getParameter("email1") + "@" + request.getParameter("email2");
String job = request.getParameter("job");
String gender = request.getParameter("gender");

// ---------------------------------------------------------------------------------------

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp3";
String user = "root";
String password = "1234";

// 1단계
Class.forName(driver);

// 2단계
Connection con = DriverManager.getConnection(url, user, password);

//3단계
// 가입일(hire_date)에 now()함수로 날짜 호출
String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,now())";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, name);
pstmt.setString(2, id);
pstmt.setString(3, passwd);
pstmt.setString(4, jumin);
pstmt.setString(5, email);
pstmt.setString(6, job);
pstmt.setString(7, gender);


//4단계
int insertCount = pstmt.executeUpdate();

if(insertCount > 0) {
	response.sendRedirect("../index.jsp");
} else { %>
	<script>
		alert("회원가입 실패!");
		history.back();
	</script>
<%}%>
%>
