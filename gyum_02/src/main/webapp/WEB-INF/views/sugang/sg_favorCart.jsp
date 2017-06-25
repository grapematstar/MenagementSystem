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
	<input type="hidden" id="user_id" value="${stu.stu_id}">
</c:forEach>
<body id="mimin" class="dashboard" style="width: 1200px;">
<%@include file="../../../header.jsp"%>
<div class="container-fluid mimin-wrapper">
<%@include file="../../../sidemenu.jsp"%>
<div id="content" class="article-v1">

				<div class="panel"  style="width:880px;">
					<div class="panel-body">
						<div class="col-md-12">
							<h3 class="animated fadeInLeft">수강 장바구니</h3>
							<p class="animated fadeInDown">
								수강신청 <span class="fa-angle-right fa"></span>수강 장바구니
							</p>
						</div>
					</div>
				</div>
				
				
				   <div class="panel" style="width:880px;margin-top: 20px;">
					 <div class="panel-body">
					<div class="responsive-table">					
						<table class="table table-striped table-bordered" width="100%"
							cellspacing="0">
							<tr>
								<td colspan="7"><h4 style="font-family: fantasy;">수강 장바구니</h4></td>
							</tr>
							<tr>
								<th id="checkbox"><input type="checkbox" id="selectCurAll"></th>
								<th>과목번호</th>
								<th>과목명</th>
								<th>강의실</th>
								<th>강의시간</th>
								<th>개강일/종강일</th>
								<th>강사</th>
							</tr>
							<c:if test="${empty sgFavorList}">
								<tr>
									<td colspan="7">등록된 게시물이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="dto" items="${sgFavorList}">
								<tr align="center">
									<td><input type="checkbox" name="selectCurBtn"
										id="selectCurBtn" value="${dto.class_idx}"></td>
									<td>${dto.subject_num}</td>
									<td>${dto.class_subject}</td>
									<td>${dto.classroom}</td>
									<td>${dto.class_time}</td>
									<td>${dto.class_startdate}/${dto.class_enddate}</td>
									<td>${dto.tea_name}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="7"><div class="col-md-6" style="float: none;">
										<input type="button" class="btn btn-primary" value="결제(등록)"
											data-toggle="modal" data-target="#paymentsub" id="submitBtn">
										<input type="button" id="closeModal" class="btn btn-primary"
											value="삭제" onclick="deleteSub()">
									</div></td>
							</tr>
						</table>
						</div>
						<!-- This is modal -->
						<div class="modal fade" id="paymentsub" role="dialog">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">

									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" align="center">최종 결제 리스트</h4>
									</div>

									<div class="modal-body" id="paymentsubCon"></div>

									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
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
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

IMP.init('imp17881325');

var payval;
function paymentSub(){
	
	if(payval!=0){
/* 		var userid = $('#userid').val();
		
		var listValues = [];
		$("input[name='payVal']").each(function(){
			listValues.push($(this).val());
		});
		
		var totalData = {"userid":userid, "listValues":listValues};
		
		$.ajax({
			url:"../gyum_02/sg_paymentIns.do",
			type:'GET',
			data:totalData,
			success:function(data){
				alert('결제가 완료됨.');
				window.self.close();
			},
			error:function(jqXHR, textStatus, errorThrown){
				alert("에러발생!\n"+textStatus+":"+errorThrown);
				self.close;
			}
		}); */
		
		//사용자 정보
		var userid = $("#user_id").val();
		var username = ($('#user_name').val());
		var usertel = ($('#user_tel').val());
		var totalprice = ($('#totalPrice').val());
		var useremail = ($('#user_email').val());
		var userschool = ($('user_school').val());
		
		
		//총 가격
		var totalPrice = parseInt("<c:out value='${priceSum}'/>");
	
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '수강료 납부 테스트',
		    amount : totalprice,
		    buyer_email : 'darkcom87@gmail.com',
		    buyer_name : username,
		    buyer_tel : usertel,
		    buyer_addr : userschool
		}, function(rsp) {
			
			var errormsg = '사용자가 결제를 취소하셨습니다';

			if (rsp.error_msg=='errormsg') {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    		var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			        alert(msg);
			        window.self.close();
		    	
		    } else {
				
				var listValues = [];
				$("input[name='payVal']").each(function(){
					listValues.push($(this).val());
				});
				
				var context = $('#context').val();
		
				var totalData = {"userid":userid, "listValues":listValues, "totalPrice":totalPrice, "context":context};
		    	
		    	jQuery.ajax({
		    		url:"../gyum_02/sg_paymentIns.do",
					type:'GET',
					data:totalData
		    	});
		    	
 		    	$.ajax({
		    		url:"../gyum_02/sg_paymentIns.do",
		    		type:'POST',
		    		data:totalData
		    	}); 
		    	
		        var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : '+username;
    			msg += '\n상점 거래ID : '+userid+useremail;
    			
    			alert(msg);
    			closeModal();
		    }
		});
	} else {
		var msg = '이미 결제가 되었거나 리스트가 없습니다.';
		alert(msg);

	};
};
//모달창 닫기
function closeModal(){
	$('#paymentsub').hide();
 	$('.modal-backdrop').hide();
}


	//체크박스 전체선택
	$(function() {
		$("#selectCurAll").click(function() {
			if ($("#selectCurAll").prop("checked")) {
				$("input[name='selectCurBtn']").prop("checked", true);
			} else {
				$("input[name='selectCurBtn']").prop("checked", false);
			}
		});
		
		$("#submitBtn").click(function() {
			$.ajax({
				type : 'GET',
				url : 'sg_paymentview.do',
				success : function(data) {
					$('#paymentsubCon').html(data);
					payval=parseInt($('#money').val());
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("에러발생!\n" + textStatus + ":" + errorThrown);
					location.replace("../gyum_02/sg_favorcartview.do");
				}
			});
		});
		
	});

	//장바구니 삭제
	function deleteSub() {

		var userid = $("#user_id").val();

		var checkboxValues = [];
		$("input[name='selectCurBtn']:checked").each(function() {
			checkboxValues.push($(this).val());
		});

		var totalData = {
			"userid" : userid,
			"checkArray" : checkboxValues
		};
		if (checkboxValues != '') {
			if (window.confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					url : "../gyum_02/sg_favorcartDel.do",
					type : 'GET',
					data : totalData,
					success : function(data) {
						$("body").html(data);
						location.replace("../gyum_02/sg_favorcartview.do");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("에러발생!\n" + textStatus + ":" + errorThrown);
						location.replace("../gyum_02/sg_favorcartview.do");
					}
				});
			}
		} else {
			alert('아무것도 선택되지 않았습니다.');
		}
	};

	//결제창 팝업
/* 	function permit() {
		var url = "../gyum_02/sg_paymentview.do"
		var popupOption = "width=800, height=600, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
		window.open(url, "", popupOption);
	};
 */
	/* $(function(){
	
	 var userid = $('#userid').val();
	 var totalId = "?userid="+userid;
	
	 $.ajax({
	 url:"../gyum_02/sg_favorcart.do"+totalId,
	 type:'GET',
	 success:function(asd){
	 alert(asd.sgFavorList[0].subject_num);
	
	 }
	
	 });
	 }); */
</script>
</html>