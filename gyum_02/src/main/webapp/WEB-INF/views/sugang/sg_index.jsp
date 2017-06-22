<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원관리프로그램</title>
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
<style type="text/css">
table tr:nth-of-type(odd) {
	background-color: #f3f1f1;
}
</style>
<!-- end: Css -->

<link rel="shortcut icon" href="asset/img/logomi.png">
</head>
<body id="mimin" class="dashboard" style="width: 1200px;">
<%@include file="../../../header.jsp"%>
<div class="container-fluid mimin-wrapper">
<%@include file="../../../sidemenu.jsp"%>
<div id="content" class="article-v1">

				<div class="panel" style="width: 880px;">
					<div class="panel-body">
	
						<div class="col-md-12">
							<h3 class="animated fadeInLeft">과목 리스트</h3>
							<p class="animated fadeInDown">
								수강신청 <span class="fa-angle-right fa"></span>과목 리스트
							</p>
						</div>
					</div>
				</div>
				<c:forEach var="stu" items="${stuList}">
					<input type="hidden" id="userid" value="${stu.stu_id}">
				</c:forEach>
				
		 <div class="panel  " style="width:880px;margin-top: 20px;">
					 <div class="panel-body">
							
								<div class="col-md-6">
									<div class="col-lg-12">
										<form name="f" method="get" action="sg_searchkeyword.do">
											<div class="input-group">
												<select name="searchHow" style="height: 35px;">
													<option value="subject" <c:out value="${map.searchHow == 'subject'?'selected':''}"/>>강의명</option>
													<option value="teacher" <c:out value="${map.searchHow == 'teacher'?'selected':''}"/>>선생님</option>
													<option value="subjectNteacher" <c:out value="${map.searchHow == 'subjectNteacher'?'selected':''}"/>>강의명+선생님</option>
												</select>
												<input type="text" id="keyword" name="searchWhat" class="form-control" aria-label="..." style="width:40%;float:right;height: 35px;" value="${map.searchWhat}">
											<div class="input-group-btn">
												<input class="btn btn-primary" type="submit" value="조회" style="height: 35px;"/>
											</div>
											<!-- /btn-group -->
										</div>
										</form>
										<!-- /input-group -->
									</div>
									<!-- /.col-lg-6 -->
								</div>
						
							<div class="responsive-table">
								<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<td colspan="7"><h4 style="font-family: fantasy;">개설 과목</h4></td>
										</tr>
										<tr>
											<th id="checkbox"><input type="checkbox"
												name="selectCurAll1" id="selectCurAll1" class="icheck">
											</th>
											<th>과목번호</th>
											<th>과목명</th>
											<th>강의실</th>
											<th>강의시간</th>
											<th>개강일/종강일</th>
											<th>강사</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty sgClassList}">
											<tr>
												<td colspan="7">등록된 게시물이 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="dto" items="${sgClassList}">
											<tr>
												<td id="checkbox"><input type="checkbox"
													name="selectCurBtn1" id="selectCurBtn1" class="icheck"
													value="${dto.class_idx}"></td>
												<td>${dto.subject_num}</td>
												<td>${dto.class_subject}</td>
												<td>${dto.classroom}</td>
												<td>${dto.class_time}</td>
												<td>${dto.class_startdate}&nbsp;/&nbsp;${dto.class_enddate}</td>
												<td>${dto.tea_name}</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3"></td>
											<td colspan="2"><div class="col-md-6" style="margin-top: 20px; margin-left: 25%;">
													<input type="button" class="btn btn-primary" value="추가"
														onclick="insertSub()" />
												</div></td>
											<td colspan="2">${pageStr}</td>
										</tr>
									</tbody>
								</table>
								</div></div></div>
										 <div class="panel  box-shadow-none content-header" style="width:880px;margin-top: 20px;">
					 <div class="panel-body">
								<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
									<tr>
										<td colspan="7"><h4 style="font-family: fantasy;">장바구니</h4></td>
									</tr>
									<tr align="center">
										<th id="checkbox"><input type="checkbox"
											name="selectCurAll2" id="selectCurAll2" class="icheck"></th>
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
											<td id="checkbox"><input type="checkbox"
												name="selectCurBtn2" id="selectCurBtn2" class="icheck"
												value="${dto.class_idx}"></td>
											<td>${dto.subject_num}</td>
											<td>${dto.class_subject}</td>
											<td>${dto.classroom}</td>
											<td>${dto.class_time}</td>
											<td>${dto.class_startdate}&nbsp;/&nbsp;${dto.class_enddate}</td>
											<td>${dto.tea_name}</td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="7" ><div class="col-md-6"
												style="float: none;">
												<input type="button" class="btn btn-primary" value="결제(등록)"
													data-toggle="modal" data-target="#paymentsub"
													id="submitBtn"> <input type="button"
													class="btn btn-primary" value="삭제" onclick="deleteSub()">
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
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 본문 끝 -->
		

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
	/* 	myWidth = screen.availWidth;
	 myHeight = screen.availHeight;	
	
	 if(myWidth >= 1500){
	 window.resizeTo(myWidth-400,myHeight-100);
	 }else if(myWidth >= 1280){
	 window.resizeTo(myWidth-200,myHeight-100);
	 } */
var payval;
IMP.init('imp17881325');
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

	$(function() {
		$("#selectCurAll2").click(function() {
			if ($("#selectCurAll2").prop("checked")) {
				$("input[name=selectCurBtn2]").prop("checked", true);
			} else {
				$("input[name=selectCurBtn2]").prop("checked", false);
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

	//장바구니 추가
	function insertSub() {
		var userid = $('#userid').val();

		var checkboxValues = [];
		$("input[name='selectCurBtn1']:checked").each(function() {
			checkboxValues.push($(this).val());
		});

		var totalData = {
			"userid" : userid,
			"checkArray" : checkboxValues
		};
		if (checkboxValues != '') {
			$.ajax({
				url : "../gyum_02/sg_favorcartIndexIns.do",
				type : 'GET',
				data : totalData,
				success : function(data) {
					$('body').html(data);
					location.replace("../gyum_02/sg_index.do");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("에러발생!\n" + textStatus + ":" + errorThrown);
					location.replace("../gyum_02/sg_index.do");
				}
			});
		} else {
			alert('아무것도 선택되지 않았습니다.');
		}
	};

	//장바구니 삭제
	function deleteSub() {
		var userid = $('#userid').val();

		var checkboxValues = [];
		$("input[name='selectCurBtn2']:checked").each(function() {
			checkboxValues.push($(this).val());
		});

		var totalData = {
			"userid" : userid,
			"checkArray" : checkboxValues
		};
		if (checkboxValues != '') {
			if (window.confirm("레알?")) {
				$.ajax({
					url : "../gyum_02/sg_favorcartIndexDel.do",
					type : 'GET',
					data : totalData,
					success : function(data) {
						$('body').html(data);
						location.replace("../gyum_02/sg_index.do");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("에러발생!\n" + textStatus + ":" + errorThrown);
						location.replace("../gyum_02/sg_index.do");
					}
				});
			}
		} else {
			alert('아무것도 선택되지 않았습니다.');
		}
	};

	//결제창


function paymentSub(){
	if(payval!=0){	
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
</script>
</html>