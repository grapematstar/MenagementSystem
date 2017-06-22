<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<caption>${stu_name}의 출석표</caption>
<thead>
	<tr>
		<th>과목</th>
		<th>강의명</th>
		<th>출석날짜</th>	
		<th>출결상태</th>	
		<th>비고</th>	
	</tr>
</thead>
<tbody>
	<c:forEach var="" items="">
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	</c:forEach>
</tbody>
<tfoot>
</tfoot>

</table>


</body>
</html>