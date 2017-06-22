<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- morris.js -->
<script src="gentelella/raphael.min.js"></script>
<script src="gentelella/morris.min.js"></script>
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
	new Chart(f,{type:"bar",data:{labels:["국어", "영어", "수학", "사회", "과학"],
		datasets:[{label:"목표",backgroundColor:"rgba(241, 95, 95, 1)",data:['${goalmap.kor}', '${goalmap.eng}', '${goalmap.math}', '${goalmap.ss}', '${goalmap.sci}']},
			{label:"실제성적",backgroundColor:"rgba(107, 102, 255, 1)",data:['${scoremap.kor}', '${scoremap.eng}', '${scoremap.math}', '${scoremap.ss}', '${scoremap.sci}']}]},
		options:{scales:{yAxes:[{ticks:{beginAtZero:!0}}]}}
		})
	document.getElementById('goalyear').value = '${selectyearterm}';
	
	var f=document.getElementById("lineChart");
	new Chart(f,{type:"line",data:{labels:["${schAllMap.s3}","${schAllMap.f3}","${schAllMap.s2}","${schAllMap.f2}","${schAllMap.s1}","${schAllMap.f1}"],
			datasets:[{label:"목표",backgroundColor:"rgba(220, 220, 220, 0)",
				borderColor:"rgba(255, 0, 0, 0.7)",pointBorderColor:"rgba(255, 0, 0, 0.7)",
				pointBackgroundColor:"rgba(255, 0, 0, 0.7)",pointHoverBackgroundColor:"#fff",
				pointHoverBorderColor:"rgba(220, 220, 220,1)",pointBorderWidth:1,data:['${schAllMap.s3goal}','${schAllMap.f3goal}','${schAllMap.s2goal}','${schAllMap.f2goal}','${schAllMap.s1goal}','${schAllMap.f1goal}']},
						{label:"${subject_name}",backgroundColor:"rgba(220, 220, 220, 0)",
			borderColor:"rgba(0, 0, 255, 0.70)",pointBorderColor:"rgba(0, 0, 255, 0.70)",
			pointBackgroundColor:"rgba(0, 0, 255, 0.70)",pointHoverBackgroundColor:"#fff",
			pointHoverBorderColor:"rgba(151,187,205,1)",pointBorderWidth:1,data:['${schAllMap.s3sub}','${schAllMap.f3sub}','${schAllMap.s2sub}','${schAllMap.f2sub}','${schAllMap.s1sub}','${schAllMap.f1sub}']}		
			]}
		})
	document.getElementById('goalsubject').value = '${subject_name}';
	
}
function change(){
	var year = document.getElementById('goalyear').value.substring(0,4);
	var term = document.getElementById('goalyear').value.substring(5);
	var subject = document.getElementById('goalsubject').value;
	location.href='my_student_score_school_goal.do?year='+year+'&term='+term+'&subject='+subject;
}
</script>
<body id="body" onload="first()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel " style="width: 1000px;">
  <div class="panel-body">
    <div class="col-md-12">
        <h3 class="animated fadeInLeft">개인성적조회</h3>
        <p class="animated fadeInDown">
		          개인성적조회 <span class="fa-angle-right fa"></span> 학교목표성적
        </p>
    </div>
  </div>
</div>
<div class="panel " style="width: 1000px;">
  <div class="panel-body">
<div style="float:left;">
<input type="button" class="btn btn-primary" value="목표성적입력" data-toggle="modal" 
data-target="#myModal">
<input type="button" class="btn btn-primary" value="목표성적수정" data-toggle="modal" 
data-target="#myModalmodi">
</div>
</div></div>
<div class="panel " style="width: 1000px;">
  <div class="panel-body">

 <div class="col-md-6 col-sm-7 col-xs-15">
   <div class="x_panel">
     <div class="x_title">
       <h5>목표성적 & 실제성적</h5>
		<select id="goalyear" onchange="change()">
		<c:forEach var="year" items="${yearList }">
			<option value="${year }02">${year }&nbsp;2학기</option>
			<option value="${year }01">${year }&nbsp;1학기</option>
		</c:forEach>
		</select>
       <div class="clearfix"></div>
     </div>
     <div class="x_content">
       <canvas id="mybarChart"></canvas>
     </div>
   </div>
 </div>
 </div></div>
 <div class="panel " style="width: 1000px;">
  <div class="panel-body">
 <div class="col-md-6 col-sm-7 col-xs-15">
   <div class="x_panel">
     <div class="x_title">
       <h5>3년 목표성적 & 실제성적</h5>
       <select id="goalsubject" onchange="change()">
		<c:forEach var="subject" items="${subject }">
			<option value="${subject }">${subject }</option>
		</c:forEach>
		</select>
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
        <h4 class="modal-title">목표성적입력</h4>
      </div>
      <div class="modal-body" id="modalBody">
			과목 : 
			<select id="isg_subject">
			<c:forEach var="list" items="${subjectList }">			
				<option value="${list.subject_num }">${list.subject_name }</option>
			</c:forEach>
			</select>
			연도 : 
			<select id="isg_year">
			<c:forEach var="list" items="${yearList }">
				<option value="${list }">${list }</option>
			</c:forEach>
			</select>
			학기 :
			<select id="isg_term">
				<option value="1">1학기</option>
				<option value="2">2학기</option>
			</select>
			목표 : 
			<select id="isg_result">
			<c:forEach var="result" begin="0" end="100" step="1">
				<option value="${result }">${result }</option>
			</c:forEach>
			</select>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" 
      	data-dismiss="modal" onclick="inputSchoolGoal()">Save</button>
        <button type="button" class="btn btn-default" 
        data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
function inputSchoolGoal(){
	
	var params=new Object();
	params.subject_num = document.getElementById('isg_subject').value;
	params.s_s_g_year = document.getElementById('isg_year').value;
	params.s_s_g_term = document.getElementById('isg_term').value;
	params.s_s_g_goal = document.getElementById('isg_result').value;
	   $.ajax({
	      type: "POST",
	      url: "my_score_School_inputGoal.do",
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
<div class="modal fade" id="myModalmodi" role="dialog">
   <div class="modal-dialog">
	<!-- Modal -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" 
        data-dismiss="modal">&times;</button>
        <h4 class="modal-title">목표성적수정</h4>
      </div>
      <div class="modal-body" id="modalBody">
			과목 : 
			<select id="isgm_subject">
			<c:forEach var="list" items="${subjectList }">			
				<option value="${list.subject_num }">${list.subject_name }</option>
			</c:forEach>
			</select>
			연도 : 
			<select id="isgm_year">
			<c:forEach var="list" items="${yearList }">
				<option value="${list }">${list }</option>
			</c:forEach>
			</select>
			학기 :
			<select id="isgm_term">
				<option value="1">1학기</option>
				<option value="2">2학기</option>
			</select>
			목표 : 
			<select id="isgm_result">
			<c:forEach var="result" begin="0" end="100" step="1">
				<option value="${result }">${result }</option>
			</c:forEach>
			</select>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" 
      	data-dismiss="modal" onclick="inputSchoolGoalModi()">Modify</button>
        <button type="button" class="btn btn-default" 
        data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
function inputSchoolGoalModi(){
	
	var params=new Object();
	params.subject_num = document.getElementById('isgm_subject').value;
	params.s_s_g_year = document.getElementById('isgm_year').value;
	params.s_s_g_term = document.getElementById('isgm_term').value;
	params.s_s_g_goal = document.getElementById('isgm_result').value;
	   $.ajax({
	      type: "POST",
	      url: "my_score_School_inputGoalModi.do",
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