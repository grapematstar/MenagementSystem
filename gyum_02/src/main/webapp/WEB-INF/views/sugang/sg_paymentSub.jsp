<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원관리프로그램</title>
<!-- stylesheet -->
<!-- start: Css -->
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">
<style type="text/css">
</style>

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
</head>
<body>
	<div class="responsive-table">
		<table class="table table-striped table-bordered" width="100%"
			cellspacing="0">
			<tr>
				<td colspan="3"><h4 style="font-family: fantasy;">*수강신청된 과목은 제외됩니다*</h4></td>
			</tr>
			<tr>
				<th>과목번호</th>
				<th>과목명</th>
				<th>수강료</th>
			</tr>
			<c:if test="${empty sgPaymentFavorList}">
				<tr>
					<td colspan="3">등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:set var="priceSum" value="0" />
			<c:forEach var="dto" items="${sgPaymentFavorList}">
				<tr align="center">
					<td><input type="hidden" name="payVal" id="payVal"
						value="${dto.class_idx}"> ${dto.subject_num}</td>
					<td>${dto.class_subject}</td>
					<td>${dto.class_price}</td>
				</tr>
				<c:set var="priceSum" value="${priceSum + dto.class_price}" />
			</c:forEach>
			<tr>
				<td colspan="3" style="text-align: right; font-size: 20px; font-weight: bold;">총 수강료 : <c:out
						value="${priceSum}" />원<input type="hidden" id="money" value="${priceSum}">
				</td>
			</tr>
			<tr>
				<td colspan="3"><div class="col-md-6" style="float: none;"><input type="button" class="btn btn-primary" value="카드결제"
					onclick="paymentSub()"></div></td>
			</tr>
			<c:forEach var="stu" items="${stuList}">
				<input type="hidden" id="context" value="${stu.stu_id},수강료" />
				<input type="hidden" id="user_id" value="${stu.stu_id}">
				<input type="hidden" id="user_name" value="${stu.stu_name}">
				<input type="hidden" id="totalPrice" value="${priceSum}">
				<input type="hidden" id="user_tel" value="${stu.stu_tel}">
				<input type="hidden" id="user_email" value="${stu.stu_email}">
				<input type="hidden" id="user_school" value="${stu.stu_school}">
			</c:forEach>
		</table>
	</div>
</body>
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>

<!-- custom -->
<script src="asset/js/main.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</html>