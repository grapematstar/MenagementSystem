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
<script>
function submitON(){
var qna_subject = document.getElementById('qna_subject').value;	
var qna_content = document.getElementById('qna_content').value;	
var q_k_idx = document.getElementById('q_k_idx').value;	
if(qna_subject==null||qna_content==null||q_k_idx==0){
	 alert("빈칸이 있으므로 다시 입력해 주시기 바랍니다.");
	 location.href='qna_WriteForm.do';
}else{
	var q_k_idx = document.getElementById("q_k_idx");
	var val = q_k_idx.options[q_k_idx.selectedIndex].value;
	
	var formID = document.getElementById('qna_Write');

	formID.submit();
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
						<h2 class="animated fadeInLeft">게시글 작성</h2>
						<p class="animated fadeInDown">게시글 작성하는 곳입니다.</p>
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
<form name="qna_Write" id="qna_Write" action="qna_Write.do">
<table class="table table-striped table-bordered" width="100%"
									cellspacing="0"> 
		<c:set var="dto" value="${list }"></c:set>
		<c:if test="${'student' eq usergrade }">
	<tr>
		<th>작성자</th>
		<td>
			<input type="text"name="qna_writer" value="${dto.get(0).stu_name}" readonly>
		</td>
	</tr>
	</c:if>
	<c:if test="${'parent' eq usergrade }">
	<tr>
		<th>작성자</th>
		<td>	
			<input type="text" name="qna_writer" value=${dto.get(0).par_name } readonly>	
		</td>
	</tr>
	</c:if>
	<c:if test="${'teacher' eq usergrade }">

	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="qna_writer" value=${dto.get(0).tea_name } readonly>
		</td>
	</tr>
	</c:if>
	<tr>
		<th>질문</th>
			<td colspan="6" >
				<select name="q_k_idx" id="q_k_idx">
					<option value=0>Q&A 질문 종류</option>
					<option value=1>온라인</option>
					<option value=2>오프라인</option>			
				</select>
			</td>
		</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><input type="text" id="qna_subject" name="qna_subject"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3">
			<textarea row="10" cols="45" id="qna_content" name="qna_content"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center"><input type="button" class=" btn btn-raised btn-primary" value="글쓰기" onclick="submitON()"></td>	
	</tr>
</table>
</form>
</div>
</div>
</div>
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