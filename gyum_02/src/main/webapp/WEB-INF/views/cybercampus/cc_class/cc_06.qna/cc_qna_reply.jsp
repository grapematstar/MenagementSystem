<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>질의응답</title>
</head>
<body>
<table style="width:100%;">
	<caption>${subject}</caption>
	<thead>
	</thead>
	<tbody>
	<c:if test="${empty list}">
		<tr>
			<td>아직 등록된 답변이 없네요. 문의 내용에 대한 답변을 알고계시면 답변을 달아주시는 건 어떨까요?</td>
		</tr>
	</c:if>
	<c:forEach var="list" items="${list}">
		<tr>
			<td><a href="#" data-toggle="tooltip" title="작성날짜: ${list.string_Awritedate}"><span style="font-weight: normal;">[${list.c_q_a_writer}]</span></a></td>
		</tr>
		<tr>
			<td><div id="c_q_a_content${list.c_q_a_idx}">${list.c_q_a_content}</div></td>
		</tr>
		<c:if test="${list.c_q_a_writer==sessionScope.id}">
		<tr>
			<td>
				<input type="button" class="btn btn-primary" value="수정" id="firstUpdate${list.c_q_a_idx}" onclick="txtOn(${list.c_q_a_idx})">
				<input type="button" class="btn btn-primary" value="수정" id="secondUpdate${list.c_q_a_idx}" onclick="submitQnAReplyUpdate(${list.c_q_a_idx})" style="display:none;">
				<input type="button" class="btn btn-primary" value="삭제" onclick="submitQnAReplyDelete(${list.c_q_a_idx})">
			</td>
		</tr>
		</c:if>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td>${pageStr}</td>
		</tr>
	</tfoot>
</table>
<hr>
<form name="cc_submitQnAReplyWrite" id="cc_submitQnAReplyWrite" action="cc_submitQnAReplyWrite.do" method="POST">
<input type="hidden" name="c_q_q_idx" id="c_q_q_idx" value="${c_q_q_idx}">
<input type="hidden" name="cp" id="cp" value="${cp}">
<textarea name="c_q_a_content" id="c_q_a_content" required="required"></textarea>
<input type="submit" class="btn btn-primary" value="작성"><!-- <input type="button" class="btn btn-default" value="닫기">  -->
</form>
<hr>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script>
function forPaging(c_q_q_idx,cp){
	var params=new Object();
	params.c_q_q_idx=c_q_q_idx;
	params.cp=cp;
	$.ajax({
		type:"GET",
		url:"cc_gotoQnAReply.do",
		data:params,
		success:function(data){
			$("#successContent").html(data);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}

$(function(){
    $('#cc_submitQnAReplyWrite').ajaxForm({
    	async:false,
       	cache:false,
		success: function(data, statusText){
           alert("답변글이 작성되었어요!");
           console.log(data);         
           replaceView();
       },
       error: function(e){
           alert("전산 오류로 인해 답변글 작성에 실패했어요.ㅠㅡㅠ");
           console.log(e);
       }                               
    });
});
function replaceView(){
	var params=new Object();
	params.c_q_q_idx=$("#c_q_q_idx").val();
	$.ajax({
		type:"GET",
		url:"cc_gotoQnAReply.do",
		data:params,
		success:function(data){
			$("#successContent").html(data);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}
function txtOn(c_q_a_idx) {
	var controlDIV = document.getElementById('c_q_a_content' + c_q_a_idx);
	var txtareaEl = document.createElement('TEXTAREA');
	txtareaEl.setAttribute('id', 'forUpdateContent' + c_q_a_idx);
	txtareaEl.value = controlDIV.innerText;
	controlDIV.innerText = "";
	controlDIV.appendChild(txtareaEl);
	$("#firstUpdate" + c_q_a_idx).css("display", "none");
	$("#secondUpdate" + c_q_a_idx).css("display", "inline");
}
function submitQnAReplyUpdate(c_q_a_idx){
	var params=new Object();
	params.c_q_a_idx=c_q_a_idx;
	params.c_q_a_content=$("#forUpdateContent"+c_q_a_idx).val();
	params.c_q_q_idx=$("#c_q_q_idx").val();
	$.ajax({
		type:"POST",
		url:"cc_submitQnAReplyUpdate.do",
		data:params,
		success:function(data){
			$("#successContent").html(data);
			alert("답변 수정에 성공했어요!");
		},
		error:function(e){
			alert("답변 수정에 실패했어요!");
			console.log(e.reponseText);
		}
	});
}
function submitQnAReplyDelete(c_q_a_idx){
	var params=new Object();
	if(!(confirm("답변을 정말 삭제하실거에요?")))return false;
	params.c_q_a_idx=c_q_a_idx;
	params.c_q_q_idx=$("#c_q_q_idx").val();
	$.ajax({
		type:"POST",
		url:"cc_submitQnAReplyDelete.do",
		data:params,
		success:function(data){
			$("#successContent").html(data);
			alert("답변 삭제가 완료되었어요!");
		},
		error:function(e){
			alert("답변 삭제에 실패했어요!");
			console.log(e.responseText);
		}
	});
}

</script>
</body>
</html>