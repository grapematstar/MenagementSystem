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
</head>
<body id="mimin" class="dashboard" style="width: 1200px;">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
			<div class="panel">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">게시판 글작성</h2>
						<p class="animated fadeInDown">게시판 글 작성하는 곳입니다.</p>
					</div>
				</div>
			</div>
			
					<div class="panel" style="margin-top: 20px;">
						<div class="panel-body">				
							<div class="responsive-table">
	<c:set var="list" value="${list }"/>
	<form name="stu_qna_Update" action="qna_Update.do">
		<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
			<tr>
				<th align="center">번호</th>
				<td align="center"><input type="text" name ="qna_idx" value="${list.qna_idx }"></td>
				<th align="center">날짜</th>
				<td align="center"><input type="text" value="${list.qna_writedate }" readonly></td>
			</tr>
			<tr>
				<th align="center">제목</th>
				<td align="center"><input type="text" name="qna_subject" value="${list.qna_subject }"></td>
				<th align="center">작성자</th>
				<td align="center"><input type="text" value="${list.qna_writer }" readonly></td>
			</tr>
			<tr>
				<td colspan="4" align="left" valign="top"><Textarea rows="15" cols="120" name="qna_content">${list.qna_content }</Textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" class="btn btn-primary" value="수정하기">
					<input type="button" class="btn btn-primary" value="뒤로가기" onclick="javascript:location.href='qna.do'">
				</td>
			</tr>
	</table>
</form>
	<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
		<c:if test="${empty re_list }">
		<tr>
			<td colspan="4" align="center">등록된 댓글이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="re_list" items="${re_list }">
		<tr>
			<th align="center">작성자</th>
			<td align="center">${re_list.qna_writer }</td>
			<th align="center">작성날짜</th>
			<td align="center">${re_list.qna_writedate }</td>
		</tr>
		<tr>
			<th align="center">댓글</th>
			<td colspan="3" align="center">${re_list.qna_content}</td>
		</tr>
		</c:forEach>
	</table>
<form name="re_qna_Write" action="qna_reWrire.do">
	<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" name="qna_writer" value="${sessionScope.name}" readonly>
				<input type="hidden" name="qna_idx" value="${list.qna_idx}">
				<td rowspan="2"><input type="submit" class="btn btn-primary" value="작성"></td>
			</td>
		</tr>
		<tr>
			<th>댓글</th>
			<td><input type="text" name="qna_content" size=100></td>
		</tr>
	</table>
</form>
</div>
</div>
</div>
</div>


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