<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp3";
String user = "root";
String password = "1234";

// 1단계
Class.forName(driver);

// 2단계
Connection con = DriverManager.getConnection(url, user, password);

//3단계
String sql = "SELECT * FROM student";
PreparedStatement pstmt = con.prepareStatement(sql);
	
// 4단계
ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function info (studuntNo) {
		location = "select_student_info.jsp";
	}
</script>
</head>
<body>
	<h1>학생 목록 조회</h1>
	<!-- 학생 목록을 표시하기 위한 테이블 생성(제목열까지만 표시) -->
	<table border="1">
		<tr>
			<th width="100">학번</th>
			<th width="100">이름</th>
			<th width="150">E-Mail</th>
			<th width="150">전화번호</th>
			<th width="100">상세정보</th>
		</tr>
		
		<!-- while 문을 사용하여 ResultSet 객체에 대해 반복 접근하면서 tr td 태그 통해 데이터 출력 -->
		<%
		while(rs.next()) {
			// 컬럼인덱스로 접근 시
// 			int studentNo = rs.getInt(1);
// 			String name = rs.getString(2);
// 			String email = rs.getString(3);
// 			String phone = rs.getString(4);

			// 컬럼명으로 접근 시
			int studentNo = rs.getInt("student_no");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			
			// <tr><td></td></tr> 태그를 통해 1개 레코드(= 학생 1명) 출력하는 작업 반복
			// 1) 태그를 문자열로 생성하여 out.println() 메소드로 출력하는 방법
// 			out.println("<tr>");
// 			out.println("<td>" + studentNo + "</td>");
// 			out.println("<td>" + name + "</td>");
// 			out.println("<td>" + email + "</td>");
// 			out.println("<td>" + phone + "</td>");
// 			out.println("</tr>");
			
			// 2) 표현식을 사용하여 데이터를 출력하는 방법
			%>
			<tr>
				<td><%=studentNo %></td>
				<td><%=name %></td>
				<td><%=email %></td>
				<td><%=phone %></td>
				
				<!-- 한 명 학생의 상세 정보 조회를 위한 버튼 생성 -->
				<!-- 클릭 시 select_student_info.jsp 페이지로 이동(파라미터로 학번 전달) -->
				<!-- 전달할 파라미터 여러개인 경우 &로 연결 -->
<%-- 				<td><input type="button" value="상세정보" onclick=info(<%=studentNo %>)></td> --%>
				<td><input type="button" value="상세정보" onclick="location.href='select_student_info.jsp?studentNo=<%=studentNo %>'"></td>
			</tr>
		<%}%>
		
	</table>
</body>
</html>