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
table tr:nth-of-type(odd) {
	background-color: #f3f1f1;
}
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
<c:forEach var="stu" items="${stuList}">
	<input type="hidden" id="context" value="${stu.stu_id},수강료" />
	<input type="hidden" id="user_id" value="${stu.stu_id}">
	<input type="hidden" id="user_name" value="${stu.stu_name}">
	<input type="hidden" id="totalPrice" value="${priceSum}">
	<input type="hidden" id="user_tel" value="${stu.stu_tel}">
	<input type="hidden" id="user_email" value="${stu.stu_email}">
	<input type="hidden" id="user_school" value="${stu.stu_school}">
</c:forEach>

<body id="mimin" class="dashboard" style="width: 1200px;"onload="printClock()">
<%@include file="../../../header.jsp"%>
<div class="container-fluid mimin-wrapper">
<%@include file="../../../sidemenu.jsp"%>
<div id="content" class="article-v1">

				<div class="panel " style="width: 880px;">			
					<div class="panel-body">
						<div class="col-md-12">
							<h3 class="animated fadeInLeft">결제내역 및 취소</h3>
							<p class="animated fadeInDown">
								수강신청 <span class="fa-angle-right fa"></span>결제내역 및 취소
							</p>
						</div>
					</div>
				</div>
				<div class="panel " style="width: 880px;margin-top: 20px;">
				<div class="panel-body">
					<div class="responsive-table">
						<table class="table table-striped table-bordered" width="100%"
							cellspacing="0">
							<tr>
								<td colspan="8"><h4 style="font-family: fantasy;">결제 리스트</h4></td>
							</tr>
							<tr>
								<td colspan="7"><div id="cale"></div></td>
								<td><div id="clock"></div></td>
							</tr>
							<tr>
								<th id="checkbox"><input type="checkbox"
									name="selectCurAll1" id="selectCurAll1"></th>
								<th>과목번호</th>
								<th>과목명</th>
								<th>강의실</th>
								<th>강의시간</th>
								<th>개강일/종강일</th>
								<th>수강료</th>
								<th>수강신청일</th>
							</tr>
							<c:if test="${empty sgPaymentList}">
								<tr>
									<td colspan="8">등록된 게시물이 없습니다.</td>
								</tr>
							</c:if>
							<c:set var="priceSum" value="0" />
							<c:forEach var="dto" items="${sgPaymentList}">
								<tr align="center">
									<td id="checkbox"><input type="checkbox"
										name="selectCurBtn1" id="selectCurBtn1"
										value="${dto.class_idx}"></td>
									<td>${dto.subject_num}</td>
									<td>${dto.class_subject}</td>
									<td>${dto.classroom}</td>
									<td>${dto.class_time}</td>
									<td>${dto.class_startdate}&nbsp;/&nbsp;${dto.class_enddate}</td>
									<td>${dto.class_price}</td>
									<td>${dto.lpay_date}</td>
								</tr>
								<c:set var="priceSum" value="${priceSum + dto.class_price}" />
							</c:forEach>
							<tr>
								<td colspan="8"
									style="text-align: right; font-weight: bold; font-size: 16px;">총
									수강료 : <c:out value="${priceSum}" />원
								</td>
							</tr>
							<tr>
								<td colspan="8"><div class="col-md-6" style="float: none;">
										<input type="button" value="결제취소" class="btn btn-primary"
											onclick="cancelSelect()">
									</div></td>
							</tr>
						</table>
						<div id="popupWrapper" style="display: none;"></div>
					</div>
					<br />
				</div>
			</div>
		</div>
	</div>
</body>
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>


<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="asset/js/main.js"></script>
<script type="text/javascript">
	$(function() {
		//전체선택 체크박스 클릭
		$("#selectCurAll1").click(function() {
			//만약 체크박스가 선택된 상태일 경우,
			if ($("#selectCurAll1").prop("checked")) {
				//#selectCurAll1에 속한 전체 checkbox를 체크해준다.
				$("input[name=selectCurBtn1]").prop("checked", true);
				//전체 체크박스가 해제된 상태일 경우,
			} else {
				//#selectCurAll1모든 checkbox의 체크를 해제한다.
				$("input[name=selectCurBtn1]").prop("checked", false);

			}
		});
	});	
	
	

	//현재시간
	function printClock() {

		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var currentDate = new Date(); // 현재시간
		var cale = document.getElementById("cale");
		var calendar = currentDate.getFullYear() + "년"
				+ (currentDate.getMonth() + 1) + "월" + currentDate.getDate()
				+ "일"; // 현재 날짜
		var amPm = 'AM'; // 초기값 AM
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);

		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			amPm = 'PM';
			currentHours = addZeros(currentHours - 12, 2);
		}

		if (currentSeconds >= 50) {// 50초 이상일 때 색을 변환해 준다.
			currentSeconds = '<span style="color:#de1951;">' + currentSeconds
					+ '</span>'
		}
		clock.innerHTML = currentHours + ":" + currentMinute + ":"
				+ currentSeconds + " " + amPm; //날짜를 출력해 줌
		cale.innerHTML = calendar;

		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
	}

	//자릿수 맞춰주기
	function addZeros(num, digit) {
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}

	function cancelSelect() {

		//체크박스 리스트 정보
		var checkboxValues = [];
		$("input[name='selectCurBtn1']:checked").each(function() {
			checkboxValues.push($(this).val());
		});

		//사용자 정보
		var userid = $("#user_id").val();
		var username = ($('#user_name').val());
		var usertel = ($('#user_tel').val());
		var totalprice = ($('#totalPrice').val());
		var useremail = ($('#user_email').val());
		var userschool = ($('#user_school').val());

		//내용
		/* 	var context = $('#context').val(); */

		var totalData = {
			"userid" : userid,
			"checkboxValues" : checkboxValues
		};
		if (checkboxValues != '') {

			$.ajax({
				url : "../gyum_02/sg_paymentFi.do",
				type : 'GET',
				data : totalData,
				datatype : "html",
				success : function(data) {
					$("#popupWrapper").show();
					$("#popupWrapper").html(data);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("에러발생!\n" + textStatus + ":" + errorThrown);
				}
			});

		} else {
			alert('아무것도 선택되지 않았습니다.');
		}
	}
	function popupClose() {
		$("#popupWrapper").hide();
	}

</script>
</html>