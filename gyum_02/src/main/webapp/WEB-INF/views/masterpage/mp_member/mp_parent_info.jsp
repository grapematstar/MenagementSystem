<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학부모정보</title>
 <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Miminium</title>

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
  <style>
    th{
  	 text-align: center;
  	 width: 200px;
  }
  td{
  	text-align:left;
  }
  </style>
</head>
<body id="mimin" class="dashboard">
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
				회원관리 <span class="fa-angle-right fa"></span>회원조회 <span class="fa-angle-right fa"></span>학부모정보 및 수정
			</p>
		</div>
	</div>
</div>
<hr>
<form name="mp_parent_info" action="mp_parent_update.do">
	<table width=950>
	<c:if test="${empty parentInfo}">학생정보가 없습니다.</c:if>
	<c:forEach var="info" items="${parentInfo}">
	<tr><th colspan=2><h2 align="center">${info.par_name}님의 회원정보</h2></th></tr>
		<tr>
			<th>학부모번호</th><td><input type="hidden" name="par_idx" value="${info.par_idx}">${info.par_idx}</td>
		</tr>
		<tr>
			<th>ID</th><td><input type="hidden" name="par_id" value="${info.par_id}">${info.par_id}</td>
		</tr>
		<tr>
			<th>PWD</th><td><input type="text" name="par_pwd" value="${info.par_pwd}"></td>
		</tr>
		<tr>
			<th>가입날짜</th><td>${info.par_in_date}</td>
		</tr>
		<tr>
			<th>질문번호</th><td><input type="text" name="pwd_q_idx" value="${info.pwd_q_idx}" size="1"></td>
		</tr>
		<tr>
			<th>비밀번호질문답</th><td><input type="text" name="par_pwd_a" value="${info.par_pwd_a}"></td>
		</tr>
		<tr>
			<th>이름</th><td><input type="text" name="par_name" value="${info.par_name}"></td>
		</tr>
		<tr>
			<th>연락처</th><td><input type="text" name="par_tel" value="${info.par_tel}" size="10"></td>
		</tr>
		<tr>
			<th>전자우편</th><td><input type="text" name="par_email" value="${info.par_email}"></td>
		</tr>
	</c:forEach>
		<tr>
			<th colspan="8" align="center">
				<input type="submit" value="수정" class="btn btn-primary">
			</th>
		</tr>
	</table>
</form>
</section>
</div>
</div>
</body>
</html>