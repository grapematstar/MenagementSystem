<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="description" content="Miminium Admin Template v.1">
	<meta name="author" content="Isna Nur Azis">
	<meta name="keyword" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css"/>

	<link href="asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="asset/img/logomi.png">
<title>자유게시판/${dto.f_b_subject}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#reok").click(function() {
			console.log("reok누름");
			var replysave = new Object();
			replysave.f_b_idx = ${dto.f_b_idx};
			replysave.f_b_writer = $("#replyid").val();
			replysave.f_b_subject = "reply";
			replysave.f_b_content = $("#reply").val();
			replysave.f_b_reply = 1;
			replysave.f_b_sunbun = ${dto.f_b_idx};
			console.log("리플세이브성공");
			$.ajax({
				type:"POST",
				url:"freebbsWrite.do",
				data:replysave,
				success:function(args) {
					$("body").html(args);
				}
			});
		});
	});
		
		function delok(idx, cidx) {
			var replydel = new Object();
			replydel.idx = idx;
			replydel.cidx = cidx;
			
			$.ajax({
				type:"POST",
				url:"freebbsRepDel.do",
				data: replydel,
				success:function(args) {
					$("body").html(args);
				}
			})
		}
</script>
<style>
	#inwhole{
		width: 90%;
    		float: left;
	}
	#freebbswriter{
		float: right;
    	margin-right: 16%;
    	margin-top: 20px;
	}
	#contenttable{
		width: 70%;
		height: 70%;
		margin: 40px auto;
		border:0px;
	}
	
	#contenttable th{
		border-color: #e2e2e2;
	}
	#backtr{
		text-align: center;
		border-color: #e2e2e2;
	}
	#reply{
		width: 400px;
    	height: 30px;
    	margin-right: 20px;
	}
	#rep-writedate{
		font-size: 10px;
   	 	margin-left: 20px;
	}
	#rep-del{
		margin-left: 10px;
		font-size: 10px;
	}
	#rep-writer{
		float: left;
		margin-left : 20px;
		margin-right : 34px;
	}
	#rep-del-a{
		cursor: pointer;
	}
	td{
		text-align: left
	}
	#center{
		text-align: center;
	}
	table.table-striped.table-bordered.dataTable.no-footer {
    width: 85%;
    margin: 7%;
    margin-top: 3%;
}
</style>
</head>
<body id="mimin" class="dashboard" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">
	<section id="whole">
	<section id="inwhole">
		<c:if test="${dto.f_b_writer==id}">
			<span id="freebbswriter">
				<a href="freebbsUpdate.do?idx=${dto.f_b_idx}">수정하기</a>|<a href="freebbsDel.do?idx=${dto.f_b_idx}">삭제하기</a>
			</span>
		</c:if>
		<table id="contenttable" border=1 width="450" cellspacing="0"  class="table-striped table-bordered dataTable no-footer">
			<tr>
				<th>번호</th>
				<td id="center">${dto.f_b_idx}</td>
				<th>작성자</th>
				<td id="writerid">${dto.f_b_writer}</td>
				<th>날짜</th>
				<td>${dto.f_b_writedate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5">${dto.f_b_subject} [${dto.f_b_readnum}]</td>
			</tr>
			<tr height="150">
				<td colspan="6">${dto.f_b_content}</td>
			</tr>
			<tr id="backtr">
				<td colspan="6" id="center">
					<c:if test="${pageMove.size()>1}">
						<span id="pre"><a href="freebbsContent.do?idx=${pageMove.get(1).f_b_idx}">이전글</a></span>
						<a href="freebbsList.do">목록으로</a>
						<span id="next"><a href="freebbsContent.do?idx=${pageMove.get(0).f_b_idx}">다음글</a></span>
					</c:if>
					<c:if test="${pageMove.size()<2}">
						<c:if test="${pageMove.get(0).f_b_idx < dto.f_b_idx}">
							<span id="pre"><a href="freebbsContent.do?idx=${pageMove.get(0).f_b_idx}">이전글</a></span>
							<a href="freebbsList.do">목록으로</a>
							<span id="next"></span>
						</c:if>
						<c:if test="${pageMove.get(0).f_b_idx > dto.f_b_idx}">
							<span id="pre"></span>
							<a href="freebbsList.do">목록으로</a>
							<span id="next"><a href="freebbsContent.do?idx=${pageMove.get(0).f_b_idx}">다음글</a></span>
						</c:if>
					</c:if>
				</td>
 			</tr>
			<tr>
				<c:if test="${!empty id}">
					<input type="hidden" id="replyid" value="${id}">
					<td colspan="6" id="center">
						<input type="text" id="reply">
						<input type="button" id="reok" value="등록">
					</td>
				</c:if>
				<c:if test="${empty id}">
					<td colspan="6" id="center">로그인 후에 이용해 주세요.</td>
				</c:if>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="6" id="center">등록 된 댓글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="replylist" items="${list}">
				<tr>
					<td colspan="6" id="replytd">
						<span id="rep-writer"><b>${replylist.f_b_writer}</b></span>
							${replylist.f_b_content}
						<span id="rep-writedate"> - ${replylist.f_b_writedate}</span>
						<span id="rep-del">
							<c:if test="${replylist.f_b_writer==id}">
								<a id="rep-del-a" onclick="delok(${replylist.f_b_idx}, ${dto.f_b_idx})">
									삭제하기
								</a>
							</c:if>
						</span>
					</td>
				</tr>
			</c:forEach>
			<tfoot>
				<tr>
					<td colspan="6" id="center">${page}</td>
				</tr>
			</tfoot>
		</table>
		</section>
	</section>
	</div></div>
</body>
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

</html>