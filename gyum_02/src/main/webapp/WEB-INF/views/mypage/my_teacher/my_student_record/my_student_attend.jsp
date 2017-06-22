<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<h2>학생출결관리(강의별)</h2>
<select>
<c:forEach var="class" items="${class }">
	<option value="${class.num }">${class.subject }</option>
</c:forEach>
</select>
<div><!-- 여기에 select박스 option별 내용 표시 --></div>
</body>
</html>