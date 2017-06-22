<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#attendtable{
	width: 800px;
}
#attendtable thead th{
	text-align: center;
	height: 40px;
}

</style>
</head>
<body>
<table id="attendtable">
	<thead>
		<tr>
			<th>강의명</th>
			<c:forEach var="date" items="${dateList }">
			<th>${date }</th>
			</c:forEach>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${attendList }">
			<tr>
				<td style="text-align: left;">${dto.class_subject }</td>
				<c:forEach var="num" begin="1" end="7" step="1">
				<td>
				<c:if test="${dto.attend_date == num}">
					${dto.attend }
				</c:if>
				<c:if test="${dto.attend_date != num}">
					<span style="color:darkgray;">ㆍ</span>
				</c:if>
				</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="8">※출석:O 지각:△ 조퇴:□ 결석:X</td>
		</tr>
	</tfoot>
</table>
</body>
</html>