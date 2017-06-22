<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form class="form-signin">
          <div class="panel periodic-login">
              <span class="atomic-number">28</span>
              <div class="panel-body text-center">
                  <h1 class="atomic-symbol">GYUM</h1>
                  <p class="element-name">ACADEMY</p>

                  <i class="icons icon-arrow-down"></i>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" class="form-text" name="stu_id" id="stu_id" value="${stu_id}" required>
                    <input type="button" value="중복확인" onclick="idCheck()">
                    <span class="bar"></span>
                    <label>Username</label>
                  </div>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="password" class="form-text" name="stu_pwd" id="pwd1" required>
                    <span class="bar"></span>
                    <label>Password</label>
                    <input type="password" class="form-text" id="pwd2"  onkeyup="compare()" required>
                    <span class="bar"></span>
                    <label>Password</label>
                    <label id="pwdCheckText"></label>
                  </div>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" class="form-text" required>
                    <span class="bar"></span>
                    <label>Email</label>
                  </div>
                  
                  <label class="pull-left">
                  <input type="checkbox" class="icheck pull-left" name="checkbox1"/> &nbsp Agree the terms and policy
                  </label>
                  <input type="submit" class="btn col-md-12" value="SignUp"/>
              </div>
                  <div class="form-group form-animate-text" style="margin-top:40px !important;">
                    <input type="text" class="form-text" required>
                    <span class="bar"></span>
                    <label>Email</label>
                  </div>
                <div class="text-center" style="padding:5px;">
                    <a href="login.html">Already have an account?</a>
                </div>
          </div>
        </form>

      </div>

      <!-- end: Content -->
      <!-- start: Javascript -->
      <script src="asset/js/jquery.min.js"></script>
      <script src="asset/js/jquery.ui.min.js"></script>
      <script src="asset/js/bootstrap.min.js"></script>

      <script src="asset/js/plugins/moment.min.js"></script>
      <script src="asset/js/plugins/icheck.min.js"></script>

      <!-- custom -->
      <script src="asset/js/main.js"></script>
      <script type="text/javascript">
       $(document).ready(function(){
         $('input').iCheck({
          checkboxClass: 'icheckbox_flat-aero',
          radioClass: 'iradio_flat-aero'
        });
       });
     </script>
     <!-- end: Javascript -->
</body>
          <hr>
	<div class="container">
		<form name="my_studentWrite" id="stu_Write" class="form-signin"
			enctype="multipart/form-data" action="studentWrite.do" method="post">
			<div class="panel periodic-login">
				<div class="panel-body text-center">
					<h1 class="atomic-symbol">GYUM</h1>
					<p class="element-name">ACADEMY</p>
					<i class="icons icon-arrow-down"></i>
					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<input type="text" name="stu_id" id="stu_id" class="form-text"
							required value="${stu_id}"> <input type="button"
							value="중복확인" onclick="idCheck()"> <span class="bar"></span>
						<label>아이디</label>
					</div>
					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<input type="text" name="stu_name" class="form-text" required>
						<span class="bar"></span> <label>이름</label>
					</div>
					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<input type="password" name="stu_pwd" id="pwd1" class="form-text"
							required> <span class="bar"></span> <label>비밀번호</label>
					</div>
					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<input type="password" name="stu_pwd" id="pwd2"
							onkeyup="compare()" class="form-text" required> <span
							class="bar"></span> <label>비밀번호</label> <label
							id="pwdCheckText"></label>
					</div>
					<label class="col-sm-2 control-label text-right">질문</label>
					<div class="col-sm-10">
						<div class="col-sm-12 padding-0">
							<select name="pwd_q_idx" id="pwd_q_idx" class="form-control">
								<option value="0">비밀번호 찾기 질문</option>
								<option value="1">너의 이름은?</option>
								<option value="2">너의 보물은?</option>
								<option value="3">너의 나이는?</option>
							</select>
						</div>
					</div>
					<div class="form-group form-animate-text"
						style="margin-top: 40px !important;">
						<input type="password" name="stu_pwd" id="pwd1" class="form-text"
							required> <span class="bar"></span> <label>비밀번호 찾기 답</label>
					</div>
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" id="cal_1" name="stu_birth" class="form-text"
								required> <span class="bar" id="calen"></span> <label>생년월일</label>
						</div>
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="number" name="stu_tel" class="form-text" required>
							<span class="bar"></span> <label>전화번호</label>
						</div>
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" name="stu_email" class="form-text" required>
							<span class="bar"></span> <label>E-mail</label>
						</div>
						<div class="form-group form-animate-text"
							style="margin-top: 40px !important;">
							<input type="text" name="stu_school" class="form-text" required>
							<span class="bar"></span> <label>학교</label>
						</div>
						<div class="input-group fileupload-v1"
							style="margin-top: 40px !important;">
							<input type="file" name="manualfile"
								class="fileupload-v1-file hidden" /> <input type="text"
								class="form-control fileupload-v1-path"
								placeholder="File Path..." disabled> <span
								class="input-group-btn">
								<button class="btn fileupload-v1-btn" type="button">
									<i class="fa fa-folder"></i>
								</button>
							</span>
						</div>
					</div>
					<div class="col-md-6" style="margin-top: 5px;">
						<button class="btn ripple-infinite btn-outline btn-primary"
							onclick="submitON()">
							<div>
								<span>가입 등록</span>
							</div>
						</button>
						<button type="reset"
							class="btn ripple-infinite btn-outline btn-primary">
							<div>
								<span>다시 작성</span>
							</div>
						</button>
					</div>
				</div>
				
				
				
				
				<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script>

function timeStart(){
	document.getElementById("label_timeStart").value;
	window.setTimeout('timeStart()',1000);
	
}




function stu_onetest(test_idx,q){
	alert(test_idx+"//"+q);
	location.href='stu_onetest.do?test_idx='+test_idx+'&c_t_q_idx='+q;
}	
		
</script>

</head>
<body>
	<%@include file="/header.jsp"%>
	<%@include file="/sidemenu.jsp"%>
	<section>
		<div id="content">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">등록된 시험</h2>
						<p class="animated fadeInDown">시험 시간은 오전 10시부터 오후 10시까지 입니다.</p>
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
								<table class="table table-striped table-bordered" width="50%"
									cellspacing="0">
									<thead>
										<tr>
											<th>과목</th>
											<th>과목명</th>
											<th>강사명</th>
											<th>강의실</th>
											<th colspan="2">문제풀기</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty test_list }">
											<tr>
												<td colspan="5" align="center">등록된 시험이 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="test_list" items="${test_list }">
											<tr>
												<c:if test="${test_list.c_t_testnum==1}">
													<td>국어</td>
												</c:if>
												<c:if test="${test_list.c_t_testnum==2}">
													<td>영어</td>
												</c:if>
												<c:if test="${test_list.c_t_testnum==3}">
													<td>수학</td>
												</c:if>
												<c:if test="${test_list.c_t_testnum==4}">
													<td>사회</td>
												</c:if>
												<c:if test="${test_list.c_t_testnum==5}">
													<td>과학</td>
												</c:if>
												<td>${test_list.class_subject }</td>
												<td>${test_list.tea_name }</td>
												<td>${test_list.classroom }호</td>
												<td><input type="button"
													class=" btn btn-raised btn-primary" value="문제풀기"
													onclick="stu_onetest(${test_list.test_idx},${test_list.c_t_q_idx })"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="col-md-6" style="padding-top: 20px;">
									<span>showing 0-10 of 30 items</span>
								</div>
								<div class="col-md-6">
									<ul class="pagination pull-right">
										<li><a href="#" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="active">${test_pageStr }</li>
										<li><a href="#" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span>
										</a></li>
									</ul>
								</div>
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
</html>