<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="gyum_02.mp_qnaManagement.model.mp_QnaDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/bootstrap.min.css">
<!-- plugins --> 
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/asset/css/plugins/animate.min.css"/>
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- qnac: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_qna_management/mp_qna_content.css"/>
<script>
<%
	ArrayList<mp_QnaDTO> list = (ArrayList<mp_QnaDTO>)request.getAttribute("list");
	ArrayList<String> list_qna_writedate = new ArrayList<String>();
	for(int i=0; i<list.size(); i++){
		Date qna_writedate = list.get(i).getQna_writedate();
		list_qna_writedate.add((qna_writedate.getYear()+1900)+"-"+
			(qna_writedate.getMonth()+1)+"-"+qna_writedate.getDate());
	}
	request.setAttribute("list_qna_writedate", list_qna_writedate);
%>
</script>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
	<div id="content" class="article-v1">
		<form action="mp_qna_reWrite_form.do">
			<input type="hidden" name="qna_idx" value="${list[0].qna_idx }">
			<input type="hidden" name="q_k_kind" value="${list[0].q_k_kind }">
			<input type="hidden" name="qna_writer" value="${list[0].qna_writer }">
			<input type="hidden" name="qna_subject" value="${list[0].qna_subject }">
			<input type="hidden" name="qna_content" value="${list[0].qna_content }">
		<div class="div_content_w_s_w">
			<div class="div_content_q_k_kind">${list[0].q_k_kind}</div>
			<div class="div_content_qna_writer">${list[0].qna_writer }</div>
			<div class="div_content_qna_writedate">${list_qna_writedate[0]}</div>
		</div>
		<div class="div_content">
			<div class="div_content_qna_subject">${list[0].qna_subject }</div>
			<div class="div_content_qna_content">${list[0].qna_content }</div>
		</div>
			<div class="div_buttons">
	<input class="form-control" type="button" value="글 삭제" 
	 onclick="confirm('정말 삭제하시겠습니까?')?location.href='mp_qna_delete.do?qna_idx=${list[0].qna_idx}&qna_row=1':'';">
	<input class="form-control" type="submit" value="답글 작성" id="input_write">
			</div>
			<table class="table_reple_content">
				<c:forEach var="i" begin="1" end="${fn:length(list)-1}" step="1">
					<tr class="tr_reple_content_${list[i].qna_reply}">
						<td class="td_reple_qna_writer">${list[i].qna_writer }</td>
						<td class="td_reple_qna_subject_content">
							<div class="div_reple_qna_subject_content">
								<div class="div_reple_qna_subject">
									${list[i].qna_subject }</div>
				<div class="div_reple_qna_content">${list[i].qna_content }</div>
							</div>
						</td>
						<td class="td_reple_qna_writedate">
							<div class="div_reple_qna_writedate">
								${list_qna_writedate[i] }</div>
							<div class="div_reple_delete_button">
<input class="form-control" type="button" value="글 삭제" 
 onclick="confirm('정말 삭제하시겠습니까?')?location.href='mp_qna_delete.do?qna_idx=${list[i].qna_idx}&qna_row=${i+1}':'';">
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
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