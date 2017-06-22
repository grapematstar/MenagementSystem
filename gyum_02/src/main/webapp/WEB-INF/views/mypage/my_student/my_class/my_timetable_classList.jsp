<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#classListSearchtable{
	width: 980px;
}
#classListSearchtable thead th{
	text-align:center;
	height: 40px;
}
</style>
</head>
<body>
<table id="classListSearchtable">
	<thead>
		<tr>
			<th>번호</th>
			<th>과목</th>
			<th>강의</th>
			<th>강사</th>
			<th>강의실</th>
			<th>요일</th>
			<th>시간</th>	
			<th>개강</th>	
			<th>종강</th>				
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.class_idx }</td>
			<td>${dto.subject_num }</td>
			<td onclick="makeTimetable('${dto.class_day}',${dto.class_time },'${dto.class_subject }', '${dto.class_idx }')">${dto.class_subject }</td>
			<td>${dto.tea_name }</td>
			<td>${dto.classroom }</td>
			<td>${dto.class_day }</td>
			<td>${dto.class_time }교시</td>
			<td>${dto.class_startdate }</td>
			<td>${dto.class_enddate }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>