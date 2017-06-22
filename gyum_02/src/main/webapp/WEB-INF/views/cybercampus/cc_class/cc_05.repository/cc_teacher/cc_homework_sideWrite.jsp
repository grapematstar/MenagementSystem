<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이버캠퍼스-학생:과제물제출::</title>
</head>
<body>
<hr>
<c:set var="list" value="${list}"/>
<c:if test="${empty list}">
<div>아직 아무도 이 과제에 대한 과제물을 제출하지 않았어요!</div>
</c:if>
<c:if test="${!empty list}">
<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
<div>
<a href="#" data-toggle="tooltip" title="${list.get(i).c_h_s_content}">
[${list.get(i).stu_name}]
${list.get(i).stu_id}<br>
${list.get(i).string_chswritedate}
</a>
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

<input type="hidden" id="c_h_t_idx" name="c_h_t_idx" value="${c_h_t_idx}">
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


function replaceView(){
	var params=new Object();
	params.c_h_t_idx=$("#c_h_t_idx").val();
	$.ajax({
		type:"GET",
		url:"cc_callHomeworkSideWrite.do",
		data:params,
		success:function(args){
			$("#sidebarForStudent").html(args);
		}
	})
}
</script>


</body>
</html>