<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<title>Insert title here</title>
<script>
$(document).ready(function(){		
	if('${msg}'!=''){
		alert('${msg}');
		location.href='my_teacher_class_student_attend_All.do';
	}
	
	document.getElementById('selectYear').value = '${year}';
	document.getElementById('selectMonth').value = '${month}';	
});
function change(){
	 var params=new Object();
	   params.class_idx = '${class_idx}';
	   params.year = document.getElementById('selectYear').value;
	   params.month = document.getElementById('selectMonth').value;
	   $.ajax({
	      type: "POST",
	      url: "my_teacher_student_attend_list.do",
	      data: params,
	      success: function(args){
	         $("body").html(args);
	      },
	      error:function(e){
	         $("body").html(e.responseText);
	      }
	   });
}
function showNote(stu_idx){
	var params=new Object();
	   params.class_idx = '${class_idx}';
	   params.stu_idx = stu_idx;
	   params.yearandmonth = document.getElementById('selectYear').value*10000 + document.getElementById('selectMonth').value*100;
	   $.ajax({
	      type: "POST",
	      url: "my_teacher_attend_individual.do",
	      data: params,
	      success: function(args){
	    	 if(args.msg!=null){
	    		 alert(args.msg);
	    		 location.href='index.do';
	    	 }
	         var data = args.attendList;
	         var modaldata = '';
	         for(var i = 0; i < data.length; i++){
	        	 var attend_note = data[i].attend_note;
	        	 if(attend_note==null||attend_note=='null') attend_note = '';
	        	 modaldata += '<tr><td>'+data[i].attend_date+'</td><td>'+getAttend(data[i].a_a_idx)+'</td><td style="text-align:left;">'+attend_note+'</td></tr>\n';
	         }
	         
	         document.getElementById('modaltbody').innerHTML = modaldata;
	      },
	      error:function(e){
	         $("body").html(e.responseText);
	      }
	   });
}
function getAttend(a_a_idx){
	var attend = 'X';
	switch(a_a_idx){
	case 1: attend = 'O'; break;
	case 2: attend = '△'; break;
	case 3: attend = '□'; break;
	}
	return attend;
}
</script>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel" style="width: 930px;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">강의내역</h3>
        <p class="animated fadeInDown">
		          강의목록 <span class="fa-angle-right fa"></span> 강의내역
        </p>
    </div>
  </div>
</div>

<div class="panel" style="width: 930px;margin-top: 20px;">
  <div class="panel-body">
<select id="selectYear" onchange="change()" >
<c:forEach var="year" items="${yearList }">
	<option value="${year }">${year }</option>
</c:forEach>
</select>
<select id="selectMonth" onchange="change()">
<c:forEach var="month" begin="1" end="12" step="1">
	<option value="${month }">${month }</option>
</c:forEach>
</select>


<table class="table table-striped table-bordered dataTable no-footer" style="width:900px;margin-top: 20px;">
	<thead>
		<tr>
			<th width="150">이름</th>
			<c:forEach var="list" items="${dateList }">
				<th>${list }</th>
			</c:forEach>
			<c:if test="${empty dateList }">
				<th width="750"></th>
			</c:if>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${studentList }">
		<tr>
			<td><a data-toggle="modal" data-target="#myModal" onclick="showNote('${list.stu_idx}')">${list.stu_name }</a></td>
			<c:forEach var="attend" items="${list.attendList }">
				<td>${attend }</td>
			</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
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
	          <h4 class="modal-title">출결관리</h4>
	        </div>
	        <div class="modal-body" id="modalBody">
	        <span id="classandstu"></span>
			<table class="table table-striped table-bordered dataTable no-footer">
				<thead>
					<tr>
						<th>날짜</th>
						<th>출결</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody id="modaltbody">
				</tbody>
			</table>
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