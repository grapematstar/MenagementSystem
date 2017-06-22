<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- stylesheet -->
<!-- start: Css -->
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/simple-line-icons.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/mediaelementplayer.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/icheck/skins/flat/red.css" />
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>

</script>
</head>
<body>
	<section>
		<h2>문제 보기 리스트</h2>
		<table class="table table-striped table-bordered" width="100%"
			cellspacing="0">
			<tr>
				<th align="center">문제집번호</th>
				<th align="center">질문번호</th>
				<th align="center">문제</th>
				<th align="center">답번호</th>
				<th align="center">문제해설</th>
				<th align="center">배점</th>
				<th align="center">수정</th>
				<th align="center">삭제</th>
			</tr>
			<c:if test="${empty qs_list }">
				<tr>
					<td colspan="6" align="center">등록된 문제가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="qs_list" items="${qs_list}">
				<tr>
					<td align="center">${qs_list.test_idx }</td>
					<td align="center">${qs_list.c_t_q_num }</td>
					<td align="center">${qs_list.c_t_q_question }</td>
					<td align="center">${qs_list.c_t_q_answer }</td>
					<td align="center">${qs_list.c_t_q_explain }</td>
					<td align="center">${qs_list.c_t_q_score }</td>
					<!-- Trigger the modal with a button -->
					<td align="center"><button type="button"
							class=" btn btn-raised btn-primary"
							onclick="questionUpdate(${qs_list.c_t_q_idx})">수정</button></td>
					<td align="center"><button type="button"
							class=" btn btn-raised btn-primary"
							onclick="questionDelete(${qs_list.c_t_q_idx})">삭제</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8" align="center">${qs_pageStr }</td>
			</tr>
		</table>
	</section>
	<script>
	var modalBody=$(".modal-body");
	function questionUpdate(c_t_q_idx){
		var params = new Object();
		params.c_t_q_idx = c_t_q_idx;
		$.ajax({
			type:"GET",
			url:"class_question_update_select.do",
			data:params,
			success:function(mav){
				$(".modal-body").html(mav);
			}
		})
	}
	</script>
	<script>
	var modalBody=$(".modal-body");
	function questionDelete(c_t_q_idx){
		var params = new Object();
		params.c_t_q_idx = c_t_q_idx;
		$.ajax({
			type:"GET",
			url:"class_question_all_delete.do",
			data:params,
			success:function(mav){
				 $('#myModal').hide();
   			  $('.modal-backdrop').hide();
			}
		})
	}
	</script>
</body>
</html>