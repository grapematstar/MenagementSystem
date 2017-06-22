<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="reply" action="re_Write.do">
	<table>
		<c:set var="dto" value="${list }"></c:set>
		<c:if test="${'student' eq usergrade }">
		<tr>
			<td><input type="text" name="name" value="${dto.get(0).stu_name }"></td>
		</tr>
		</c:if>
		<c:set var="dto" value="${list }"></c:set>
		<c:if test="${'parent' eq usergrade }">
		<tr>
			<td><input type="text" name="name" value="${dto.get(0).par_id }"></td>
		</tr>
		</c:if>
		<c:set var="dto" value="${list }"></c:set>
		<c:if test="${'teacher' eq usergrade }">
		<tr>
			<td><input type="text" name="name" value="${dto.get(0).tea_id }"></td>
		</tr>
		</c:if>
		<tr>
			<td><input type="text" name="qna_content"></td>
		</tr>
		<tr>
			<td><input type="submit" value="등록"></td>
		</tr>
	</table>
</form>
</body>
</html>