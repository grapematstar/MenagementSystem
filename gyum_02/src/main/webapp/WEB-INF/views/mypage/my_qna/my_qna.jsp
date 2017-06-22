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
<script>
	function stu_WriteForm() {
		location.href = 'qna_WriteForm.do';
	}
</script>
</head>
<body id="mimin" class="dashboard" style="width: 1200px;">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
			<div class="panel " >
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">Q&A 게시판</h2>
						<p class="animated fadeInDown">관리자에게 건의사항 문의하세요.</p>
					</div>
				</div>
			</div>
			<div class="panel " style="margin-top: 20px;" >
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
									<thead>
										<tr>
											<th width="150" align="center">번호</th>
											<th width="150" align="center">제목</th>
											<th width="150" align="center">작성자</th>
											<th width="150" align="center">작성날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty qna_list}">
											<tr>
												<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="qna_list" items="${qna_list}">
											<tr>
												<td align="center">${qna_list.qna_idx}</td>
												<td align="center"><a
													href="qna_Content.do?idx=${qna_list.qna_idx}">${qna_list.qna_subject}</a></td>
												<td align="center">${qna_list.qna_writer}</td>
												<td align="center">${qna_list.qna_writedate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="col-md-6">
									<ul class="pagination pull-right">
										<li><a href="#" aria-label="Previous"> <span
												aria-hidden="true">&laquo;</span>
										</a></li>
										<li class="active">${qna_pageStr }</li>
										<li><a href="#" aria-label="Next"> <span
												aria-hidden="true">&raquo;</span>
										</a></li>
										<li>
										<input type="button" class=" btn btn-raised btn-primary" value="글쓰기"
			onclick='stu_WriteForm()'>
										</li>
									</ul>
								</div>
							</div>
			
			</div></div>
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