<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<script language="javascript">
var i=0
window.document.onkeydown = protectKey;
function down() {
        window.footer_cart.scrollBy(0,31)
        return;
}
function up() {
        window.footer_cart.scrollBy(0,-31)
        return;
}
function protectKey()
{
        //새로고침을 막는 스크립트.. F5 번키..
        if(event.keyCode == 116)
        {
                event.keyCode = 0;
                return false;
        }
        //CTRL + N 즉 새로 고침을 막는 스크립트....
        else if ((event.keyCode == 78) && (event.ctrlKey == true))
        {
                event.keyCode = 0;
                return false;
        }
}
</script>
<script>
history.pushState(null, null, location.href); 
window.onpopstate = function(event) { 
history.go(1); 
}
</script>
<style>
#label_width {
	margin-top: 50px;
	margin-left: 240px;
}
</style>


</head><body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
	<h2><label id="label_width">남은 시간은 </label>
	<label id="label_timeStart"></label>
	<label> 입니다.</label></h2>
	<section>
		<div id="content">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">시험 보기</h2>
						<p class="animated fadeInDown">시험 시간 준수해 주시기 바랍니다.</p>
					</div>
				</div>
			</div>
			<div class="col-md-12 top-20 padding-0">
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-12 padding-0" style="padding-bottom: 20px;">
								<div class="col-md-6" style="padding-left: 10px;"></div>
								<div class="col-md-6">
									<div class="col-lg-12">
										<div class="input-group">
											<div class="input-group-btn"></div>
											<!-- /btn-group -->
										</div>
										<!-- /input-group -->
									</div>
									<!-- /.col-lg-6 -->
								</div>
								<div class="responsive-table">
									<form name="class_test_student_reply"
										id="class_test_student_reply" action="test_student_reply.do">
										<table class="table table-striped table-bordered" width="100%"
											cellspacing="0">
											<tr>
												<th align="center">문제 번호</th>
												<td align="center">${stu_Test_Reply.c_t_q_num }</td>
												<th align="center">배점</th>
												<td align="center">${stu_Test_Reply.c_t_q_score }<input
													type="hidden" name="c_t_q_idx"
													value="${stu_Test_Reply.c_t_q_idx }"> <input
													type="hidden" name="stu_idx" value="${sessionScope.idx }">
													<input type="hidden" name="idx" id="test_idx"
													value="${stu_Test_Reply.test_idx}"> <input
													type="hidden" name="num" id="c_t_q_num"
													value="${stu_Test_Reply.c_t_q_num+1}">
												</td>
												<th>답</th>
												<td><input type="text" name="c_t_s_r_answer"></td>
											</tr>
											<tr>
												<th align="center">문제</th>
												<td colspan="5" align="center">${stu_Test_Reply.c_t_q_question }</td>
												<input type="hidden" name="c_t_q_answer"
													value="${stu_Test_Reply.c_t_q_answer }">
											</tr>
											<c:forEach var="list" items="${stuclass_question_list }">
												<tr>
													<td>보기${list.c_t_q_o_num}</td>
													<td colspan="5">${list.c_t_q_o_option }</td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="6" align="center"><input type="submit"
													class=" btn btn-raised btn-primary" value="답 제출"></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
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
</div>
</div>
</body>
</html>
<script>
var startTimer = new Date((Date)('${start_time}').toString());
var label_timeStart = document.getElementById("label_timeStart");
var nowTime = new Date();

if(nowTime.getHours()<10||nowTime.getHours()>21){
	alert("지금은 시험 시간이 아닙니다.");
	location.href="my_stuclass_test_List.do";
}
var st_time='${start_time}';


var check=0;
var timeM = 49;
var timeS = 60;
function timer(startTimer) {

nowTime = new Date();

var m = nowTime.getMinutes();
var m2=st_time.substring(st_time.length-5,st_time.length-3);
var s = nowTime.getSeconds();
var s2=st_time.substring(st_time.length-2,st_time.length);


if(m2-m>0){
	var check_m=(60-m2)+m;
	timeM-=check_m;
}else{
	timeM+=(m2-m);
}
if(s2-s>0){
	var check_s=(60-s2)+s;
	timeS-=check_s;
}else{
	timeS+=(s2-s);
}
time_check();
}
	
function time_check(){
	timeS--;
	if(timeS==0){
		timeS=59;
		timeM--;
	}
//	if(time.m==0&&time.s==0){
		
//	}
	
//	label_timeStart.innerHTML =startTimer;
	label_timeStart.innerHTML = timeM + "분 " + timeS + "초";
	if(timeM<=0&&timeS<=0){
		location.href="class_test_reply_timezero.do?test_idx=${stu_Test_Reply.test_idx}";
	}
//	label_timeStart.value = startTimer;
	window.setTimeout('time_check()',1000);
	
}

</script>

<script>
window.setTimeout('timer(startTimer)',100);

</script>