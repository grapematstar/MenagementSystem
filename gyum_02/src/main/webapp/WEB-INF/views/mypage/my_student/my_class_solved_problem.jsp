<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="panel-body" width="100%">
					<div class="col-md-12" width="100%">
						<h2 class="animated fadeInLeft">맞힌 문제</h2>
						<p class="animated fadeInDown">맞힌 문제 확인하는 곳입니다.</p>
					</div>
				</div>
<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
	<tr>
		<th>번호</th>
		<th>문제</th>
		<th>정답</th>
		<th>배점</th>
	</tr>
	<c:if test="${empty solved_List }">
	<tr>
		<td colspan="4" align="center">맞힌 문제가 없습니다.</td>
	</tr>
	</c:if>
	<c:forEach var="list" items="${solved_List }">
	<tr>
		<td>${list.c_t_q_num }</td>
		<td>${list.c_t_q_question }</td>			
		<td>${list.c_t_q_answer }</td>
		<td>${list.c_t_q_score }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>