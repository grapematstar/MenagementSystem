<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<c:forEach var="stu" items="${stuList}">
	<input type="hidden" id="context" value="${stu.stu_id},수강료" />
	<input type="hidden" id="user_id" value="${stu.stu_id}">
	<input type="hidden" id="user_name" value="${stu.stu_name}">
	<input type="hidden" id="totalPrice" value="${priceSum}">
	<input type="hidden" id="user_tel" value="${stu.stu_tel}">
	<input type="hidden" id="user_email" value="${stu.stu_email}">
	<input type="hidden" id="user_school" value="${stu.stu_school}">
</c:forEach>
<body>
	<div class="responsive-table">
		<table class="table table-striped table-bordered" width="100%"
			cellspacing="0">
			<tr>
				<td colspan="7"><h4 style="font-family: fantasy;">취소 리스트</h4></td>
			</tr>
			<tr>
				<th>과목번호</th>
				<th>과목명</th>
				<th>개강일</th>
				<th>수강신청일</th>
				<th>수강료</th>
				<th>환불수강료</th>
			</tr>
			<c:if test="${empty sgPaymentList}">
				<tr>
					<td colspan="7">등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:set var="priceSum" value="0" />
			<c:set var="dto" value="${sgPaymentList}" />
			<c:set var="chk" value="${dcPriceList}" />
			<c:forEach var="i" begin="0" end="${fn:length(sgPaymentList)-1}">
				<tr align="center">
					<td><input type="hidden" name="payVal" id="payVal"
						value="${dto.get(i).class_idx}"> ${dto.get(i).subject_num}</td>
					<td>${dto.get(i).class_subject}</td>
					<td>${dto.get(i).class_startdate}</td>
					<td>${dto.get(i).lpay_date}</td>
					<td>${dto.get(i).class_price}</td>
					<td>${chk.get(i).payment}</td>
				</tr>
				<c:set var="priceSum" value="${priceSum + chk.get(i).payment}" />
			</c:forEach>
			<tr>
				<td colspan="7" style="text-align: right;font-weight: bold;font-size: 16px;">총 환불수강료 : <c:out
						value="${priceSum}" />원
				</td>
			</tr>
			<tr>
				<td colspan="7">
				<div class="col-md-6" style="float: none;">
					<input type="button" class="btn btn-primary" value="취소하기"
					onclick="cancelSub()"> <input type="button" value="닫기"
					class="btn btn-primary" onclick="javascript:popupClose()"></div></td>
			</tr>
		</table>
	</div>
</body>
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>

<!-- custom -->
<script src="asset/js/main.js"></script>
<script type="text/javascript">
//결제내역 삭제(취소)
function cancelSub(){
	
	//리스트 정보
	var listValues = [];
		$("input[name='payVal']").each(function(){
			listValues.push($(this).val());
		});
	
	//사용자 정보
	var userid = $("#user_id").val();
	var username = ($('#user_name').val());
	var usertel = ($('#user_tel').val());
	var totalprice = ($('#totalPrice').val());
	var useremail = ($('#user_email').val());
	var userschool = ($('#user_school').val());
	
	//내용
	var context = $('#context').val();
	
	var totalData = {"userid":userid, "listValues":listValues, "context":context};
	if(listValues!=''){
		if (window.confirm("정말 취소하시겠습니까?")) {
			$.ajax({
				url : "../gyum_02/sg_paymentDel.do",
				type : 'GET',
				data : totalData,
				success : function(data) {
					var msg = '취소되었습니다.'
					alert(msg);
					$("body").html(data);
					location.replace('../gyum_02/sg_payment.do');
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("에러발생!\n" + textStatus + ":" + errorThrown);
				}
			});
		}
	} else {
			alert('아무것도 선택되지 않았습니다.');
		}
};

</script>
</html>