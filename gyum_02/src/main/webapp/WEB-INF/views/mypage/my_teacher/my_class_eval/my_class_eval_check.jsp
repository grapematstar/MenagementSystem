<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<style>
#my_teacher_class_eval_table thead th{
	text-align: center;
}
</style>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel "style="width:930px;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">강의목록</h3>
        <p class="animated fadeInDown">
		          강의목록 <span class="fa-angle-right fa"></span> 강의평가 결과조회
        </p>
    </div>
  </div>
</div>
<div class="panel "style="width:930px;margin-top: 20px;">
  <div class="panel-body">
<table id="my_teacher_class_eval_table" class="table table-striped table-bordered dataTable no-footer" style="width:900px;">
	<thead>
		<tr>
			<th>기간</th>
			<th>제목</th>
			<th>요일</th>
			<th>시간</th>
			<th>총학생수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${myClassList }">
			<tr>
				<td align="center">${list.period }</td>
				<td style="text-align:left;"><a onclick="evalPage('${list.class_idx}')" data-toggle="modal" data-target="#myModal">${list.subject }</a></td>
				<td>${list.day }</td>
				<td>${list.time }</td>
				<td>${list.studentNum }</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" style="text-align:right;">${page }</td>
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
	          <h4 class="modal-title">강의평가내역</h4>
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

	<!-- MODAL PART -->
	<div class="modal fade" id="myModalContent" role="dialog">
      <div class="modal-dialog">
	  <!-- Modal -->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" 
	          data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">강의평가내역</h4>
	        </div>
	        <div class="modal-body" id="modalBodyContent">
			
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" 
	          data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function evalPage(class_idx){
   var params=new Object();
   params.class_idx = class_idx;
   $.ajax({
      type: "POST",
      url: "my_tea_class_eval_list.do",
      data: params,
      success: function(args){
    	 var data = args.evalList;
    	 var modaldata = '';
    	 for(var i = 0; i < data.length; i++){
    		 modaldata += (i+1)+'번 <a onclick="evalShow('+data[i].class_idx+','+data[i].stu_idx+')" data-toggle="modal" data-target="#myModalContent">강의평가</a> 	평균:'+data[i].avg+'<br>';
    	 }
    	 modaldata += '<b>총 평균 : '+args.allAvg+'</b>';
    	 if(data.length==0){
    		 modaldata = '등록된 강의평가가 없습니다';
    	 }
         $("#modalBody").html(modaldata);
      },
      error:function(e){
         $("body").html(e.responseText);
      }
   });
}
function evalShow(class_idx, stu_idx){
	var params=new Object();
	   params.class_idx = class_idx;
	   params.stu_idx = stu_idx;
	   $.ajax({
	      type: "POST",
	      url: "my_tea_class_eval_content.do",
	      data: params,
	      success: function(args){
	    	 if(args.msg==null||args.msg==''){	    		 
		         $("#modalBodyContent").html(args);
	    	 }else{
	    		 alert(args.msg);
	    	 }
	      },
	      error:function(e){
	         $("body").html(e.responseText);
	      }
	   });
}
</script>
<div style="height:100px;"></div>
</div>
</div>
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