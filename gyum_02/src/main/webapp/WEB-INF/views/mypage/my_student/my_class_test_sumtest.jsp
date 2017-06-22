<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Insert title here</title>
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

</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">온라인 시험 작성</h2>
						<p class="animated fadeInDown">자신의 강의 목록</p>
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
							</div>
							<div class="responsive-table">
<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
	<tr>
		<th>문제수</th>
		<td>${class_test_student_sum_test }</td>
		<th>점수</th>
		<td>${class_test_student_sum_test_score }</td>
	</tr>
	<tr>
		<th>맞힌 문제</th>
		<td>${class_test_student_sum_count }</td>
		<th>틀린 문제</th>
		<td>${class_test_student_rain_count }</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<!-- Trigger the modal with a button -->
  			<button type="button" class=" btn btn-raised btn-primary" data-toggle="modal" data-target="#myModal" onclick="class_test_solved_problem(${test_idx})">정답 문제 보기</button>
			<button type="button" class=" btn btn-raised btn-primary" data-toggle="modal" data-target="#myModal" onclick="class_test_wrong_answer(${test_idx})">오답 문제 보기</button>
			<input type="button" class=" btn btn-raised btn-primary" value="다른시험보러가기" onclick="javascript:location.href='my_stuclass_test_List.do'">
		</td>
	</tr>
</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

	  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">문제 보기</h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<script>
function class_test_solved_problem(test_idx){
	var params = "?test_idx="+test_idx;
	
	$.ajax({
		type:"GET",
		url:"class_test_solved_problem.do?test_idx="+test_idx,
		data:null,
		success:function(mav){
			$(".modal-body").html(mav);
		}
	})
}
function class_test_wrong_answer(test_idx){
	var params = "?test_idx="+test_idx;
	
	$.ajax({
		type:"GET",
		url:"class_test_wrong_answer.do?test_idx="+test_idx,
		data:null,
		success:function(mav){
			$(".modal-body").html(mav);
		}
	})
}
</script>
</body>
</html>