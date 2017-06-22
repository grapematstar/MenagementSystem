<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js" 
   integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
   crossorigin="anonymous"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/mediaelementplayer.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<script>
function showmsg(){
	if('${msg}'!=''){
		window.alert('${msg}');
		location.href='my_student_class_eval.do';
	}
	var cp = 1;
	if('${cp}'!=''){
		cp = '${cp}';
	}
	document.getElementById('btn'+cp).className = 'btn active';
}
</script>
<style>
#my_student_class_eval_table{
	width: 800px;
}
</style>
</head>
<body onload="showmsg()" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel "style="width: 830px;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">강의평가</h3>
        <p class="animated fadeInDown">
		          강의목록 <span class="fa-angle-right fa"></span> 강의평가
        </p>
    </div>
  </div>
</div>
<div class="panel "style="width: 830px;margin-top: 20px;">
  <div class="panel-body">
<table id="my_student_class_eval_table" class="table table-striped table-bordered dataTable no-footer">
	<thead>
		<tr>
			<th>과목</th>
			<th>강의</th>
			<th>강사</th>
			<th>강의평가</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${my_evalList }">
		<tr>
			<td>${list.subject_num }</td>
			<td>${list.class_subject }</td>
			<td>${list.teacher }</td>
			<td>
			<c:if test="${empty list.evalstate }">
				<input type="button" value="평가하기" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="javascript:evalpage('my_class_eval_question.do','${list.class_idx}','none')">
			</c:if>
			<c:if test="${list.evalstate=='set'}">
				<input type="button" value="확정하기" class="btn btn-danger" data-toggle="modal" data-target="#myModal" onclick="javascript:evalpage('my_class_eval_question.do','${list.class_idx}','fix')">
			</c:if>
			<c:if test="${list.evalstate=='done'}">
				<input type="button" value="내용보기" class="btn btn-default" onclick="javascript:evalpage('my_class_eval_done.do','${list.class_idx }','none')" data-toggle="modal" data-target="#myModal">
			</c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4" style="text-align: right;">${page }</td>
		</tr>
	</tfoot>
</table>
</div></div>
	<!-- MODAL PART -->
	<div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
	  <!-- Modal -->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" 
	          data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">강의평가</h4>
	        </div>
	        <div class="modal-body" id="modalBody">
			
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" 
	          data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
</div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function evalpage(addr, class_idx, fix){
   var params=new Object();
   params.class_idx = class_idx;
   params.fix = fix;
   $.ajax({
      type: "POST",
      url: addr,
      data: params,
      success: function(args){
         $("#modalBody").html(args);
      },
      error:function(e){
         $("body").html(e.responseText);
      }
   });
}
</script>
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