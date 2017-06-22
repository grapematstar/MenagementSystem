<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/bootstrap.min.css">
<!-- plugins --> 
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/plugins/animate.min.css"/>
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css --> 
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- qnaw: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_qna_management/mp_qna_reWriteForm.css"/>
<title>Insert title here</title>
<%
	String userId = "admin";
%>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
	<div id="content" class="article-v1">
		<form action="mp_qna_reWrite.do" class="form_qna_content">
			<input type="hidden" name="qna_idx" value="${dto.qna_idx }">
			<input type="hidden" name="q_k_kind" value="${dto.q_k_kind }">
			<input type="hidden" name="qna_writer" value="<%=userId%>">
			<!-- 
			<input type="hidden" name="qna_writedate" value="${dto.qna_writedate }">
			 -->
			<ul class="ul_qna_content">
				<li class="li_qna_subject_original">원본 제목 : ${dto.qna_subject }</li>
				<li class="li_qna_subject">
	제목 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="qna_subject" value="re>>${dto.qna_subject }">
				</li>
				<li class="li_qna_content">
					<textarea name="qna_content" rows="30" 
					 cols="30">re>> ${dto.qna_content }</textarea>
				</li>
			</ul>
			<div class="div_buttons">
				<input type="submit" value="저장" class="form-control">
				<input type="button" value="취소" class="form-control" 
				 onclick="location.href='mp_qna_content.do?qna_idx=${dto.qna_idx}'">
			</div>
		</form>
	</div>
</div>
<script src="/gyum_02/asset/js/jquery.min.js"></script>
<script src="/gyum_02/asset/js/jquery.ui.min.js"></script>
<script src="/gyum_02/asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="/gyum_02/asset/js/plugins/moment.min.js"></script>
<script src="/gyum_02/asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="/gyum_02/asset/js/main.js"></script>
</body>
</html>
