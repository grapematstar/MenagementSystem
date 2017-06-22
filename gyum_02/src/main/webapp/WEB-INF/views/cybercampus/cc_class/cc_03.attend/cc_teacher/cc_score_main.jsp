<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이버캠퍼스-개인성적확인::</title>
</head>
<body>
<table class="table">
	<thead>
		<tr>
			<th>과목</th>
			<th>강의명</th>
			<th>시험날짜</th>
			<th>시험점수</th>
			<c:if test="${sessionScope.usergrade!='student'}">
		<!-- 	<th>수정</th>  -->
			</c:if>
		</tr>
	</thead>
	<tbody>
	<c:set var="list" value="${list}"/>
	<c:if test="${empty list}">
		<tr>
			<td colspan="5">아직 입력된 성적이 없습니다!</td>
		</tr>
	</c:if>
	<c:if test="${!empty list}">
	<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
		<tr>
			<td><div id="class_num" name="class_num">${list.get(i).class_num}</div></td>
			<td><div id="class_subject" name="class_subject">${list.get(i).class_subject}</div></td>
			<td><div id="s_s_date" name="s_s_date">${list.get(i).s_s_date}</div></td>
			<td><div id="s_s_result${list.get(i).s_s_date}" name="s_s_result${list.get(i).s_s_date}">${list.get(i).s_s_result}</div></td>
<!-- 			<c:if test="${sessionScope.usergrade!='student'}">
			<td><input type="button" value="수정" class="btn btn-primary" id="secondUpdate${list.get(i).s_s_date}" onclick="submitSingleScoreUpdate(${list.get(i).stu_idx},${list.get(i).s_s_date})"></td>
			</c:if>  -->
		</tr>
	</c:forEach>
	</c:if>
	</tbody>
	<!-- <tfoot>
		<tr>
			<td colspan="5">${pageStr}</td>
		</tr>
	</tfoot>  -->
</table>
<script>
function submitSingleScoreUpdate(o,d){
	
}
</script>
</body>
</html>