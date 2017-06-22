<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사정보확인</title>
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/handsontable.full.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="asset/img/logomi.png">
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function abb(){
	document.mp_teacher_info.subject_num.value=${subject_num};
	
	
}
</script>
</head>
<body onload="abb()" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
<div id="content" class="article-v1">
<section>
<div class="panel box-shadow-none content-header">
	<div class="panel-body">
		<div class="col-md-12">
			<h3 class="animated fadeInLeft">회원관리</h3>
			<p class="animated fadeInDown">
				회원관리 <span class="fa-angle-right fa"></span>회원조회 <span class="fa-angle-right fa"></span>강사정보 및 수정
			</p>
		</div>
	</div>
</div>
<hr>
<form name="mp_teacher_info" action="mp_teacher_update.do">
	<table>
	<c:if test="${empty teacherInfo}">강사정보가 없습니다.</c:if>
	<c:forEach var="info" items="${teacherInfo}">
	<h2 align="center">${info.tea_name} 강사님의 회원정보</h2>
		<tr>
			<th>프로필사진</th>
			<th>강사번호</th><td><input type="hidden" name="tea_idx" value="${info.tea_idx}">${info.tea_idx}</td>
			<th>ID</th><td><input type="text" name="tea_id" value="${info.tea_id}"></td>
			<th>PWD</th><td><input type="text" name="tea_pwd" value="${info.tea_pwd}"></td>
			<th>가입날짜</th><td>${info.tea_in_date}</td>
		</tr>
		<tr>
			<td rowspan="2"><img name="" alt="" src="" width="100" height="140"></td>
			<th>질문번호</th><td><input type="text" name="pwd_q_idx" value="${info.pwd_q_idx}" size="1"></td>
			<th>비밀번호질문답</th><td><input type="text" name="tea_pwd_a" value="${info.tea_pwd_a}"></td>
			<th>생년월일</th><td><input type="text" name="tea_birth" value="${info.tea_birth}"></td>
			<th>이름</th><td><input type="text" name="tea_name" value="${info.tea_name}"></td>
		</tr>
		<tr>
			<th>연락처</th><td><input type="text" name="tea_tel" value="${info.tea_tel}" size="10"></td>
			<th>전자우편</th><td><input type="text" name="tea_email" value="${info.tea_email}"></td>
			<th>담당과목</th>
			<td>
				<select name="subject_num">
					<option value=1>국어</option>
					<option value=2>영어</option>
					<option value=3>수학</option>
					<option value=4>사회</option>
					<option value=5>과학</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="9" align="center">강의 내역 리스트</td>
		</tr>
	</c:forEach>
		<tr>
			<td>번호</td><td>과목</td><td>강의개강일</td><td>강의종료일</td><td>강의명</td><td>강의실</td><td>강의요일</td><td>강의시간</td><td>최대수강생</td>		
		</tr>
	<c:forEach var="c" items="${cl}">
		<tr>
			<td>${c.class_idx }</td><td>${c.subject_num }</td><td>${c.class_startdate }</td><td>${c.class_enddate }</td><td>${c.class_subject}</td><td>${c.classroom }호실</td><td>${c.class_day }</td><td>${c.class_time }교시</td><td>${c.class_max_student }명</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="9" align="center">
				<input type="submit" value="수정" class="btn btn-primary">
			</td>
		</tr>
	</table>
</form>
</section>
</div>
</div>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script> 
</body>
</html>