<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test3.jsp</title>
</head>
<body>
	<form action="test3_result.jsp" method="post">
		<table border="1">
			<tr>
				<th>이름</th><td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>값</th><td><input type="text" name="num"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>