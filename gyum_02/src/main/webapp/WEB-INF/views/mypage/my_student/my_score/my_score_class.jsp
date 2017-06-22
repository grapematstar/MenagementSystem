<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js" 
   integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
   crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function showScore(class_idx){
	var params = new Object();
	params.class_idx = class_idx;
	params.childidx = ${stu_idx};
	$.ajax({
		type: "POST",
		url: "my_score_class_showScore.do",
		data: params,
		success: function(args){
			var data = args.stuscoreList;
			var modaldata = '';
			if(data.length==0){
				modaldata = '성적이 입력되지 않았습니다';
			}else{
				for(var i = 0; i < data.length; i++){
					if(i!=0) modaldata += '<br>';
					modaldata += (i+1) + '차시험 | 성적 : <span id="modalresult">'+data[i].s_s_result+'</span> '
									+ '날짜 : <span id="modaldate">'+data[i].s_s_date+'</span>';
				}				
			}
			$("#modalBody").html(modaldata);
		},
		error: function(e){
			$("body").html(e.responseText);
		}
	})
}
</script>
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
#my_score_class_table thead th{
text-align: center;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel " style="width: 880px;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">개인성적조회</h3>
        <p class="animated fadeInDown">
		          개인성적조회 <span class="fa-angle-right fa"></span> 강의별 성적
        </p>
    </div>
  </div>
</div>
<div class="panel " style="width: 880px; margin-top: 20px;">
  <div class="panel-body">
<table id="my_score_class_table" style="width: 800px;" class="table table-striped table-bordered dataTable no-footer">
	<thead>
		<tr>
			<th width="200">기간</th>
			<th>과목</th>
			<th>강의</th>
			<th>강사</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${my_classList }">
		<tr>
			<td align="center">${list.classdate }</td>
			<td>${list.subject_name }</td>
			<td><a data-toggle="modal" data-target="#myModal" onclick="javasciprt:showScore('${list.class_idx }')">${list.class_subject }</a></td>
			<td>${list.teacher }</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4" style="text-align:right;">${page }</td>
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
	          <h4 class="modal-title">성적</h4>
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