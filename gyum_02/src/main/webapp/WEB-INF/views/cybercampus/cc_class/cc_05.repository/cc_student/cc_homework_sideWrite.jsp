<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이버캠퍼스-학생:과제물제출::</title>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="resources/js/jquery.form.js"></script>
<script src="resources/js/jquery.MultiFile.js"></script>
<script src="resources/js/jQuery.MultiFile.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
</head>
<body>
<hr>
<c:set var="list" value="${list}"/>
<c:if test="${empty list}">
<div>아직 이 과제에 대한 과제물을 제출하지 않았어요!</div>
</c:if>
<c:if test="${!empty list}">
<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
<div style="font-size:9px">
<a href="#" data-toggle="tooltip" title="${list.get(i).c_h_s_content}">
[${studentName}]
${list.get(i).stu_id}<br>
${list.get(i).string_chswritedate}
</a>
<a href="javascript:deleteStudentHomeworkDB(${list.get(i).c_h_s_idx})"><span class="icons icon-close"></span></a>
</div>
<c:forEach var="filelist" items="${forFilelist.get(i)}">
<div>
<input type="hidden" id="c_s_idx" value="${filelist.c_s_idx}"/>
<c:url var="downloadFile" value="cc_downloadHomeworkFile.do">
	<c:param name="c_s_idx" value="${filelist.c_s_idx}"/>
</c:url>
<a href="${downloadFile}" name="file"><i class="fa fa-file-text-o"></i> ${filelist.c_s_orifilename}</a></div>
</c:forEach>
<hr>
</c:forEach>
</c:if>

<hr>
<form name="multiform" id="multiform" action="cc_submitStudentHomeworkWrite.do" method="post" enctype="multipart/form-data">
<div>
<ul>
	<li>남김말<br>
	<textarea rows="3" cols="17" id="c_h_s_content" name="c_h_s_content"></textarea>
	</li>
</ul>
</div>
<input type="hidden" id="c_h_t_idx" name="c_h_t_idx" value="${c_h_t_idx}">
<div><input type="file" id="homeworkUpload" name="homeworkUpload[]" multiple></div>
<div id="homeList" style="border:2px solid #c9c9c9;min-height:50px;font-size:8px;"></div> 
<input type="submit" id="btnSubmit" class="btn btn-default" value="제출"/><br/>
</form>
<script>
$(document).ready(function(){
    $('#multiform #homeworkUpload').MultiFile({
        max: 3,
        maxfile: 10240, 
        maxsize: 30240, 
        STRING: { 
            remove : "x",
            duplicate : "$file 은 이미 선택된 파일입니다.", 
            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
            selected:'$file 을 선택했습니다.', 
            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
        },
        list:"#homeList"
    });
});
</script>

<script>
var downGroupCnt =0;
$(function(){
    $('#multiform').ajaxForm({
       cache: false,
       /* dataType:"json", */
       beforeSubmit: function (data, frm, opt) {
           return true;
       },
       success: function(data, statusText){
    	   if(data.msg!=null){
    		   alert(data.msg);
    		   return false;
    	   }
           alert("과제물이 등록되었습니다.");
           console.log(data);
           replaceView();
       },
       error: function(e){
           alert("알 수 없는 이유로 인해 과제물 제출에 실패했습니다.");
           console.log(e);
       }                               
    });
});

function deleteStudentHomeworkDB(c_h_s_idx){
	if(!(confirm("정말 삭제하시겠습니까?")))return false;
	var params=new Object();
	params.c_h_s_idx=c_h_s_idx;
	$.ajax({
		type:"POST",
		url:"cc_deleteStudentHomeworkDB.do",
		data:params,
		success:function(data){
			alert(data.msg);
			replaceView();
		},
		error:function(e){
			alert("알 수 없는 이유로 삭제에 실패했습니다.");
			console.log(e.responseText);
		}
	});
}

function replaceView(){
	var params=new Object();
	params.c_h_t_idx=$("#c_h_t_idx").val();
	$.ajax({
		type:"GET",
		url:"cc_callHomeworkSideWrite.do",
		data:params,
		success:function(args){
			$("#successContent").html(args);
		}
	})
}
</script>


</body>
</html>