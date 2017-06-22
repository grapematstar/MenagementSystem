<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="asset/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
</head>
<body>
	<div class="row">
		<c:set var="dto" value="${dto}" />
		<table width="100%">
			<thead>
				<tr>
					<th>작성날짜</th>
					<td>${dto.string_writedate}</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>${dto.c_f_b_writer}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.c_f_b_subject}</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2"><pre>${dto.c_f_b_content}</pre></td>
				</tr>
			</tbody>
		</table>
					<div class="col-md-12">
				<div class="col-md-12" align="center">
					<textarea name="c_f_b_r_content" id="c_f_b_r_content" cols="115" rows="4" required="required" width="100%"></textarea>
				</div>
				<div class="col-md-9"></div>
				<div class="col-md-3">
					<input type="button" value="댓글달기" class="btn btn-primary" id="cc_submitFreeBBSReply" onclick="cc_submitFreeBBSReply(${dto.c_f_b_idx})" style="width:100%;height:100%;">
				</div>
			</div>
		<div style="text-align:left;">
		<c:if test="${sessionScope.id==dto.c_f_b_writer}">
		${forModify}
		</c:if>
		</div>
		<!-- 작성자 전용: if 아이디 일치여부 확인을 통해 등록 -->
	</div>
	<hr>
	<!-- Reply Part -->
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-12">
				<c:forEach var="replyList" items="${replyList}">
					<div class="col-md-4">${replyList.c_f_b_r_writer}</div><div class="col-md-2"></div><div class="col-md-6">[${replyList.string_writedate}]</div>
					              <div class="panel chart-title" style="border-left:4px solid #1ab394;height:50px;">
                    <h5 style="color:#1ab394;">
                        <span id="sparkline2">${replyList.c_f_b_r_content}</span> 
                    </h5>
                  </div>
				</c:forEach>
			</div>
		</div>
					<div id="right-menu">
				<div id="right-menu-user" class="tab-pane fade in active">
					<div class="user col-md-12" tabindex="5003"
						style="overflow: hidden; outline: none;">
						<div class="col-md-1"></div>
						<div class="col-md-11" id="right-side-body"> </div>
					</div>
				</div>
			</div>
	</div>
<script>
function freeBBSDelete(c_f_b_idx){
	if(confirm("정말 삭제하시겠습니까?"))location.href=location.href='cc_submitFreeBBSDelete.do?c_f_b_idx='+c_f_b_idx;
}
function ajaxupdate(c_f_b_idx){
	var params=new Object();
	params.c_f_b_idx=c_f_b_idx;
	$.ajax({
		type:"POST",
		data:params,
		url: "cc_gotoFreeBBSUpdate.do",
		success:function(data){
			$("#modalBody").html(data);
		}
	});
}
</script>
</body>
</html>