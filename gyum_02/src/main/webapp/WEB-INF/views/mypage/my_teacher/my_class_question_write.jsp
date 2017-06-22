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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script>
  
   var count = 1;
   var arr = new Array(count);
   $(document).ready(function(){
      $('#btn-add-row').click(function(){
    	if(count<=5){
        $('#mytable > tbody:last').append('<tr><td><input type="text" id="c_t_q_o_num" name="c_t_q_o_num" value="'+count+'"></td><td><input type="text" id="c_t_q_o_option" name="c_t_q_o_option"></td></tr>');
        count++;
    	}
      });
      $('#btn-delete-row').click(function(){
         $('#mytable > tbody:last > tr:last').remove();
         count--;
      });
      $("#submitOn").click(function(){
    	  var c_t_q_question = document.getElementById('c_t_q_question').value;
    	  var c_t_q_answer = document.getElementById('c_t_q_answer').value;
    	  var c_t_q_explain = document.getElementById('c_t_q_explain').value;
    	  var c_t_q_score = document.getElementById('c_t_q_score').value;
    	  if(c_t_q_question==null||c_t_q_answer==0||c_t_q_explain==null||c_t_q_score==0){
    		  alert("빈칸이 있으므로 다시 입력해 주시기 바랍니다.");
    		  location.href="class_testWriteForm.do?test_idx="+${param.test_idx }+"&question_count="+${param.question_count };
    	  }
    	  var list = new Object();
    	  list.test_idx = $("#test_idx").val();
    	  list.c_t_q_num = $("#c_t_q_num").val();
    	  list.c_t_q_question = $("#c_t_q_question").val();
    	  list.c_t_q_answer = $("#c_t_q_answer").val();
    	  list.c_t_q_explain = $("#c_t_q_explain").val();
    	  list.c_t_q_score = $("#c_t_q_score").val();
    	  list.c_question_Option_num = [];
    	  $("input[name='c_t_q_o_num']").each(function(){
    		  list.c_question_Option_num.push($(this).val());
    	  });
    	  list.c_question_Option_option = [];
    	  $("input[name='c_t_q_o_option']").each(function(){
    		  list.c_question_Option_option.push($(this).val());
    	  });
    	  $.ajax({
    		  type:"GET",
    		  url:"class_question_Write.do",
    		  data:list,
    		  success:function(args){
    			  $("body").html(args);
    		  },
    		  error:function(e){
    			  $("#dialog").html(e.responseText);
    		  }
    	  });
      });
    });
   </script>
   <style>
   #submitBt{
   	margin-left: 495px;
   }
   </style>
</head>
<body>
<%@include file="/header.jsp"%>
	<%@include file="/mypage_sidemenu.jsp"%>
	<section>
		<div id="content">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">온라인 시험 문제</h2>
						<p class="animated fadeInDown">시험 문제 등록하는 곳입니다.</p>
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
		<table id="mytable" class="table table-striped table-bordered" width="100%"
			cellspacing="0">
			<tr>
				<th>문제집번호</th>
				<td><input type="text" id="test_idx" name="test_idx"
					value="${param.test_idx }" readonly></td>
			</tr>
			<tr>
				<th>질문번호</th>
				<td><input type="number" id="c_t_q_num" name="c_t_q_num"
					value="${param.question_count }" readonly></td>
			</tr>
			<tr>
				<th>문제</th>
				<td><textarea rows="2" cols="20" id="c_t_q_question" name="c_t_q_question"></textarea>
			</tr>
			<tr>
				<th>답번호</th>
				<td><input type="number" id="c_t_q_answer" name="c_t_q_answer"></td>
			</tr>
			<tr>
				<th>문제해설</th>
				<td><textarea rows="2" cols="22" id="c_t_q_explain" name="c_t_q_explain"></textarea>
			</tr>
			<tr>
				<th>배점</th>
				<td><input type="number" id="c_t_q_score" name="c_t_q_score"></td>
			</tr>
			<tr>
				<th>번호</th>
				<th>보기</th>
			</tr>
				<tbody></tbody>
		<td colspan="2" align="center">
		<input type="button" class=" btn btn-raised btn-primary" id="btn-add-row" value="보기 추가"> 
					<input type="button" class=" btn btn-raised btn-primary" id="btn-delete-row" value="보기 삭제">   
		</td>
		</table>
		<p id="submitBt"><input type="button" id="submitOn" class=" btn btn-raised btn-primary" value="작성"></p>
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
</body>
</html>