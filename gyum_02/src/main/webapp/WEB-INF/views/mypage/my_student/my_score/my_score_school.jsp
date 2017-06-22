<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<!-- Bootstrap -->
<link href="gentelella/bootstrap.min.css" rel="stylesheet">
<!-- Custom Theme Style -->
<!-- jQuery -->
<script src="gentelella/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="gentelella/bootstrap.min.js"></script>
<!-- Chart.js -->
<script src="gentelella/Chart.min.js"></script>
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

</head>
<script>
function first(){
	var f=document.getElementById("mybarChart");
	new Chart(f,{type:"bar",data:{labels:["spring", "fall"],
		datasets:[{label:"국어",backgroundColor:"#FFE08C",data:['${springscore.kor}', '${fallscore.kor}']},
			{label:"영어",backgroundColor:"#D1B2FF",data:['${springscore.eng}','${fallscore.eng}']},
			{label:"수학",backgroundColor:"#FFB2D9",data:['${springscore.math}','${fallscore.math}']},
			{label:"사회",backgroundColor:"#B7F0B1",data:['${springscore.ss}','${fallscore.ss}']},
			{label:"과학",backgroundColor:"#B2EBF4",data:['${springscore.sci}','${fallscore.sci}']}]},
		options:{scales:{yAxes:[{ticks:{beginAtZero:!0}}]}}
		})
	document.getElementById('scoreyear').value = '${selectyear}';
	
	var f=document.getElementById("lineChart");
	new Chart(f,{type:"line",data:{labels:["${schAllMap.s3}","${schAllMap.f3}","${schAllMap.s2}","${schAllMap.f2}","${schAllMap.s1}","${schAllMap.f1}"],
			datasets:[{label:"국어",backgroundColor:"rgba(220, 220, 220, 0)",
			borderColor:"rgba(255, 224, 140, 1)",pointBorderColor:"rgba(255, 224, 140, 1)",
			pointBackgroundColor:"rgba(255, 224, 140, 0.7)",pointHoverBackgroundColor:"#fff",
			pointHoverBorderColor:"rgba(220,220,220,1)",pointBorderWidth:1,data:['${schAllMap.s3kor}','${schAllMap.f3kor}','${schAllMap.s2kor}','${schAllMap.f2kor}','${schAllMap.s1kor}','${schAllMap.f1kor}']},
					{label:"영어",backgroundColor:"rgba(220, 220, 220, 0)",
			borderColor:"rgba(209, 178, 255, 1)",pointBorderColor:"rgba(209, 178, 255, 1)",
			pointBackgroundColor:"rgba(209, 178, 255, 0.70)",pointHoverBackgroundColor:"#fff",
			pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:['${schAllMap.s3eng}','${schAllMap.f3eng}','${schAllMap.s2eng}','${schAllMap.f2eng}','${schAllMap.s1eng}','${schAllMap.f1eng}']},
					{label:"수학",backgroundColor:"rgba(220, 220, 220, 0)",
			borderColor:"rgba(255, 178, 217, 1)",pointBorderColor:"rgba(255, 178, 217, 1)",
			pointBackgroundColor:"rgba(255, 178, 217, 0.70)",pointHoverBackgroundColor:"#fff",
			pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:['${schAllMap.s3math}','${schAllMap.f3math}','${schAllMap.s2math}','${schAllMap.f2math}','${schAllMap.s1math}','${schAllMap.f1math}']},
					{label:"사회",backgroundColor:"rgba(220, 220, 220, 0)",
			borderColor:"rgba(183, 240, 177, 1)",pointBorderColor:"rgba(183, 240, 177, 1)",
			pointBackgroundColor:"rgba(183, 240, 177, 0.70)",pointHoverBackgroundColor:"#fff",
			pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:['${schAllMap.s3ss}','${schAllMap.f3ss}','${schAllMap.s2ss}','${schAllMap.f2ss}','${schAllMap.s1ss}','${schAllMap.f1ss}']},
					{label:"과학",backgroundColor:"rgba(220, 220, 220, 0)",
			borderColor:"rgba(178, 235, 244, 1)",pointBorderColor:"rgba(178, 235, 244, 1)",
			pointBackgroundColor:"rgba(178, 235, 244, 0.70)",pointHoverBackgroundColor:"#fff",
			pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:['${schAllMap.s3sci}','${schAllMap.f3sci}','${schAllMap.s2sci}','${schAllMap.f2sci}','${schAllMap.s1sci}','${schAllMap.f1sci}']}
			]}
		})
	
}
function changeyear(){
	var year = document.getElementById('scoreyear').value;
	if('${stu_idx}'==''){
		location.href='my_student_score_school.do?year='+year;
	}else{
		location.href='my_parent_score_school.do?year='+year+'&stu_idx=${stu_idx}';
	}
}
</script>
<body id="body" onload="first()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel" style="width: 880px;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">개인성적조회</h3>
        <p class="animated fadeInDown">
		          개인성적조회 <span class="fa-angle-right fa"></span> 학교성적추이
        </p>
    </div>
  </div>
</div>
<div class="panel"  style="width: 880px;margin-top: 20px;">
  <div class="panel-body">
<c:if test="${!empty subjectList }">
<div style="float:left;">
<input type="button" class="btn btn-primary" value="학교성적입력" data-toggle="modal" 
data-target="#myModal">
<input type="button" class="btn btn-primary" value="학교성적수정" data-toggle="modal" 
data-target="#myModalModi">
</div></div></div>
<div class="panel" style="width: 880px;margin-top: 20px;">
<div class="panel-body">
</c:if>

 <div class="col-md-6 col-sm-7 col-xs-15">
   <div class="x_panel">
     <div class="x_title">
       <h5>학교 성적 추이</h5>
		<select id="scoreyear" onchange="changeyear()">
		<c:forEach var="year" items="${year }">
			<option value="${year }">${year }</option>
		</c:forEach>
		</select>
       <div class="clearfix"></div>
     </div>
     <div class="x_content">
       <canvas id="mybarChart" style="width: 600px important;"></canvas>
     </div>
   </div>
 </div>
</div></div>
<div class="panel" style="width:880px; margin-top: 20px;">
  <div class="panel-body">
 <div class="col-md-6 col-sm-7 col-xs-15">
   <div class="x_panel">
     <div class="x_title">
       <h5>3년 학교 성적 추이</h5>
       <div class="clearfix"></div>
     </div>
     <div class="x_content">
       <canvas id="lineChart"></canvas>
     </div>
   </div>
 </div>
</div></div>
<!-- MODAL PART -->
<div class="modal fade" id="myModal" role="dialog">
   <div class="modal-dialog">
	<!-- Modal -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" 
        data-dismiss="modal">&times;</button>
        <h4 class="modal-title">학교성적입력</h4>
      </div>
      <div class="modal-body" id="modalBody">
			과목 : 
			<select id="iss_subject">
			<c:forEach var="list" items="${subjectList }">			
				<option value="${list.subject_num }">${list.subject_name }</option>
			</c:forEach>
			</select>
			연도 : 
			<select id="iss_year">
			<c:forEach var="list" items="${year }">
				<option value="${list }">${list }</option>
			</c:forEach>
			</select>
			학기 :
			<select id="iss_term">
				<option value="1">1학기</option>
				<option value="2">2학기</option>
			</select>
			결과 : 
			<select id="iss_result">
			<c:forEach var="result" begin="0" end="100" step="1">
				<option value="${result }">${result }</option>
			</c:forEach>
			</select>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" 
      	data-dismiss="modal" onclick="inputSchoolScore()">Save</button>
        <button type="button" class="btn btn-default" 
        data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
function inputSchoolScore(){
	
	var params=new Object();
	params.subject_num = document.getElementById('iss_subject').value;
	params.s_s_s_year = document.getElementById('iss_year').value;
	params.s_s_s_term = document.getElementById('iss_term').value;
	params.s_s_s_result = document.getElementById('iss_result').value;
	   $.ajax({
	      type: "POST",
	      url: "my_score_School_inputScore.do",
	      data: params,
	      success: function(args){
	    	 alert(args.msg);
	    	 location.reload();
	      },
	      error:function(e){
	         $("body").html(e.responseText);
	      }
	   });
}
</script>

<!-- MODAL PART -->
<div class="modal fade" id="myModalModi" role="dialog">
   <div class="modal-dialog">
	<!-- Modal -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" 
        data-dismiss="modal">&times;</button>
        <h4 class="modal-title">학교성적수정</h4>
      </div>
      <div class="modal-body" id="modalBody">
			과목 : 
			<select id="issm_subject">
			<c:forEach var="list" items="${subjectList }">			
				<option value="${list.subject_num }">${list.subject_name }</option>
			</c:forEach>
			</select>
			연도 : 
			<select id="issm_year">
			<c:forEach var="list" items="${year }">
				<option value="${list }">${list }</option>
			</c:forEach>
			</select>
			학기 :
			<select id="issm_term">
				<option value="1">1학기</option>
				<option value="2">2학기</option>
			</select>
			결과 : 
			<select id="issm_result">
			<c:forEach var="result" begin="0" end="100" step="1">
				<option value="${result }">${result }</option>
			</c:forEach>
			</select>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" 
      	data-dismiss="modal" onclick="inputSchoolScoreModi()">Modify</button>
        <button type="button" class="btn btn-default" 
        data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
function inputSchoolScoreModi(){
	
	var params=new Object();
	params.subject_num = document.getElementById('issm_subject').value;
	params.s_s_s_year = document.getElementById('issm_year').value;
	params.s_s_s_term = document.getElementById('issm_term').value;
	params.s_s_s_result = document.getElementById('issm_result').value;
	   $.ajax({
	      type: "POST",
	      url: "my_score_School_inputScoreModi.do",
	      data: params,
	      success: function(args){
	    	 alert(args.msg);
	    	 location.reload();
	      },
	      error:function(e){
	         $("body").html(e.responseText);
	      }
	   });
}
</script>
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