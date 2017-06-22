<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<div class="tab-content">
	<div id="right-menu-user" class="tab-pane fade in active">
		<div class="search col-md-12">
			<div style="align:center;">[후기를 남겨주세요]</div>
<form id="cc_submitEpilogueContent" name="cc_submitEpilogueContent" action="cc_submitEpilogueWrite.do" method="POST">
<textarea name="c_r_content" id="submitEpilogueContent"></textarea>
<input type="submit" class="btn btn-primary" value="작성">
</form>
		</div>
		<div class="user col-md-12">
			<ul class="nav nav-list">
				<c:forEach var="list" items="${list}">
				<li>
	<div class="row" data-toggle="tooltip" title="${list.string_writedate}">
	<div class="col-md-12">
	<div class="col-md-6">
			<div class="col-md-12">[${list.c_r_writer}]</div>
			<br>
			<div class="col-md-12"></div>
			<br>
			<div class="col-md-12">
			<div id="epilogueContent${list.c_r_idx}">${list.c_r_content}</div>
			</div>
	</div>
	<div class="col-md-6">
	<c:if test="${list.c_r_writer==sessionScope.id}">
				<input type="button" value="수정" class="btn btn-primary" id="firstUpdate${list.c_r_idx}"
				onclick="txtOn(${list.c_r_idx})">
	<input type="button" value="수정" class="btn btn-primary" id="secondUpdate${list.c_r_idx}"
				onclick="submitEpilogueUpdate(${list.c_r_idx})"
				style="display: none">
	<input type="button" value="삭제" class="btn btn-primary"
				id="submitEpilogueDelete${list.c_r_idx}"
				onclick="submitEpilogueDelete(${list.c_r_idx})"></c:if></div>
		</div>	
		</div>
				</li>
		</c:forEach>
			</ul>
		</div>
	</div>
</div>

<div class="row" style="width:100%;">


<div class="col-md-12">
<div class="col-md-12">

</div>
</div>
</div>
		<div>
			${pageStr}
		</div>
		
		
	<script src="resources/js/jquery.form.js"></script>
<script>
function txtOn(c_r_idx) {
	var controlDIV = document.getElementById('epilogueContent' + c_r_idx);
	var txtareaEl = document.createElement('TEXTAREA');
	txtareaEl.setAttribute('id', 'forUpdateContent' + c_r_idx);
	txtareaEl.value = controlDIV.innerText;
	controlDIV.innerText = "";
	controlDIV.appendChild(txtareaEl);
	$("#firstUpdate" + c_r_idx).css("display", "none");
	$("#secondUpdate" + c_r_idx).css("display", "inline");
}
function submitEpilogueUpdate(c_r_idx) {
	var params = new Object();
	params.c_r_content = document.getElementById('forUpdateContent' + c_r_idx).value;
	params.c_r_idx = c_r_idx;
	$.ajax({
		type : "POST",
		url : "cc_submitEpilogueUpdate.do",
		data : params,
		success : function(args) {
			alert("후기 글 수정에 성공했어요!")
			replaceView();
		},
		error : function(e) {
			alert("후기 글 수정에 실패했어요!")
			$("#successContent").html(e.responseText);
		}
	});
}
function submitEpilogueDelete(c_r_idx) {
	var params = new Object();
	params.c_r_idx = c_r_idx;
	$.ajax({
		type : "POST",
		url : "cc_submitEpilogueDelete.do",
		data : params,
		success : function(args) {
			alert("후기 글 삭제에 성공했어요!")
			replaceView();
		},
		error : function(e) {
			alert("후기 글 삭제에 실패했어요!")
			$("#successContent").html(e.responseText);
		}
	});
}

/* $(document).ready(
		function() {
			var params = new Object();
			$("#submitEpilogueWrite").click(
					function() {
						params.class_idx = 1;
						params.c_r_writer = 'writer';
						params.c_r_subject = 'reply';
						params.c_r_content = document.getElementById('submitEpilogueContent').value;
						$.ajax({
							type : "POST",
							url : "cc_submitEpilogueWrite.do",
							data : params,
							success : function(args) {
								$("body").html(args);
							},
							error : function(e) {
								$("#successContent").html(e.responseText);
							}
						});
					});
		}); */


$(function(){
    $('#cc_submitEpilogueContent').ajaxForm({
    	async:false,
       	cache:false,
		success: function(data, statusText){
           alert("후기 글이 작성되었어요!");
           console.log(data);       
           replaceView();
       },
       error: function(e){
           alert("전산 오류로 인해 후기 글 작성에 실패했어요.ㅠㅡㅠ");
           console.log(e);
       }                               
    });
});
function replaceView(){
	$.ajax({
		type:"GET",
		url:"cc_gotoEpilogueClass.do",
		success:function(data){
			$("#successContent").html(data);
		},
		error:function(e){
			console.log(e.responseText);
		}
	});
}
</script>
</body>
</html>