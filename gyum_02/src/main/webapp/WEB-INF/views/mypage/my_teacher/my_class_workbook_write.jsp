<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	function submitON(){
	var c_t_testnum = document.getElementById('c_t_testnum').value;
	if(c_t_testnum==0){
		alert("빈칸이 있으므로 다시 입력해 주시기 바랍니다.");
		location.href="class_workbookForm.do?class_idx="+${param.class_idx};
	}else{
	var c_t_testnum = document.getElementById("c_t_testnum");
	var val = c_t_testnum.options[c_t_testnum.selectedIndex].value;
	
	var formID = document.getElementById('submitWorkbookWrite');
	formID.submit();
	}
	}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<%@include file="/mypage_sidemenu.jsp"%>
	<section>
		<div id="content">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">온라인 시험 작성</h2>
						<p class="animated fadeInDown">자신의 강의 시험을 등록하는 곳입니다.</p>
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
								<form name="workbook_write" id="submitWorkbookWrite"action="class_workbook_write.do">
									<table class="table table-striped table-bordered" width="100%"
										cellspacing="0">
										<tr>
											<th>강의번호</th>
											<td><input type="text" name="class_idx"
												value="${param.class_idx }" readonly></td>
										</tr>
										<tr>
											<th>온라인강의번호</th>
											<td><input type="text" name="club_idx"
												value="${param.class_idx }" readonly></td>
										</tr>
										<tr>
											<th>시험종류</th>
											<td><select name="c_t_testnum" id="c_t_testnum">
													<option value="0">중간/기말</option>
													<option value="1">중간고사</option>											
													<option value="2">기말고사</option>
											</select></td>
										</tr>
										<tr>
											<td colspan="2" align="center"><input type="button"
												class=" btn btn-raised btn-primary" value="문제집 등록" onclick="submitON()">&nbsp;<input
												type="reset" class=" btn btn-raised btn-primary"
												value="다시작성"></td>
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
</body>
</html>