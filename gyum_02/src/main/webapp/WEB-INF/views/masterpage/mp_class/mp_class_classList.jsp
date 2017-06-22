<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
		<tr>
			<th>번호</th>
			<th>강의명</th>
			<th>개강날짜</th>
			<th>종강날짜</th>
			<th>강의실</th>
			<th>강의여부</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty c_list }">
			<tr>
				<td colspan="6" align="center">등록된 강의가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="c_list" items="${c_list}">
			<tr>
				<td align="center">${c_list.class_idx }</td>
				<td align="center"><a href="class_content.do?class_idx=${c_list.class_idx }">${c_list.class_subject }</a></td>
				<td align="center">${c_list.class_startdate }</td>
				<td align="center">${c_list.class_enddate }</td>
				<td align="center">${c_list.classroom}</td>
				<td align="center">${c_list.class_check}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="center">${c_pageStr }</td>
		</tr>
	</tbody>
	</table>
</body>
</html>