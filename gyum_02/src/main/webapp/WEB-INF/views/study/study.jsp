<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>academy</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/nouislider.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/select2.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/ionrangeslider/ion.rangeSlider.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/ionrangeslider/ion.rangeSlider.skinFlat.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/bootstrap-material-datetimepicker.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="asset/img/logomi.png">
 <style>
 h3{
 	margin-top: 10px;
 }
.pp{
	margin:15px 0 6px 0;
}
 </style>
 <script>
 var logincheck="${sessionScope.id}"; 
 if(logincheck==""){
	 location.href="index.do";
 }
 </script> 
</head>
<body id="mimin" class="dashboard" style="width:1200px; ">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">

<div class="panel" style="width:880px;">	
	<div class="panel-body">
	  <div class="col-md-12">
	      <h3 class="animated fadeInLeft">스터디</h3>
	      <p class="animated fadeInDown">
	        	"${study.study_subject}"
	      </p>
	  </div>
    </div>
</div>
    
<div class="panel" style="width:430px; margin-top: 20px; float: left; height: 283px;">	
	<div class="panel-body">
	  <div class="col-md-12" >
	  	<h4 class="animated fadeInLeft" style="float: left;width: 350px;">공지사항</h4><a  href="studybbsgo.do?study_bbsref=0"><p class="animated fadeInDown pp" >더보기</p></a>
	      <table id="notice" style="display: block;">
	      <thead>
	      	<tr>
	      		<th width="200">제목</th><th width="100">작성자</th><th width="100">날짜</th>
	      	</tr>
	      	</thead>
	      	<tbody>
	      	<c:if test="${empty noticelist }"> 
	      		<tr><td>　</td></tr>
	      		<tr><td>　</td></tr>
	      		<tr><td colspan=3>등록된 게시물이 없습니다.</td></tr>
	      		<tr><td>　</td></tr>
	      		<tr><td>　</td></tr>
      		</c:if>
	      	
      	 	<c:forEach var="noti" items="${noticelist }" begin="0" step="1" end="4">	      	
	      	<tr><td><a href="study_bbscontentgo.do?study_bbsidx=${noti.study_bbsidx}">${noti.study_bbssubject}</a></td><td>${noti.stu_name }</td><td>${noti.study_bbswritedate}</td></tr>	      	
	      	</c:forEach>
	      	</tbody>
	      </table>
	  </div>
    </div>
</div>    
    
<div class="panel" style="width:430px; margin-left:20px; margin-top:20px; float: left; height: 283px;">	
	<div class="panel-body">
	  <div class="col-md-12">
	   <h4 class="animated fadeInLeft" style="float: left;width: 350px;">일정</h4><a href="study_schedule.do"><p class="animated fadeInDown pp" >더보기</p></a>
	      <table id="schedule">
	      	<tr>
	      		<th width="100">내용</th><th width="100">시작 날짜</th><th width="100">종료 날짜</th><th width="100">작성자</th>
	      	</tr>
	      	<c:if test="${empty schlist }">
	      		<tr><td>　</td></tr>
	      		<tr><td>　</td></tr>
	      		<tr><td colspan=4>등록된 게시물이 없습니다.</td></tr>
	      		<tr><td>　</td></tr>
	      		<tr><td>　</td></tr>
      		</c:if>
	      	<c:forEach var="sch" items="${schlist }" begin="0" step="1" end="4">	      	
	      	<tr><td>${sch.event_name}</td><td>${sch.start_date}</td><td>${sch.end_date}</td><td>${sch.stu_name }</td></tr>	      	
	      	</c:forEach>
	      	
	      </table>
	  </div>
    </div>
</div>      
    
<div class="panel" style="width:430px; margin-top: 20px; float: left; height: 283px;">	
	<div class="panel-body">
	  <div class="col-md-12">
	   	<h4 class="animated fadeInLeft" style="float: left;width: 350px;">투표 게시판</h4><a href="studyvotebbsgo.do"><p class="animated fadeInDown pp" >더보기</p></a>
	      <table id="vote">
	      	<tr>
	      		<th width="200">제목</th><th width="100">작성자</th><th width="100">날짜</th>
	      	</tr>
	      	<c:if test="${empty votebbslist }">	
	      		<tr><td>　</td></tr>
	      		<tr><td>　</td></tr>
	      		<tr><td colspan=3>등록된 게시물이 없습니다.</td></tr>
	      		<tr><td>　</td></tr>
	      		<tr><td>　</td></tr>
      		</c:if>
      			<c:forEach var="vlist" items="${votebbslist }" begin="0" step="1" end="4">	      	
	      	<tr><td><a href="studybbsvotecontent.do?study_votebbsidx=${vlist.study_votebbsidx}">${vlist.study_votebbssubject}</a></td><td>${vlist.stu_name}</td><td>${vlist.study_votebbswritedate }</td></tr>	      	
	      	</c:forEach>
	      </table>
	  </div>
    </div>
</div>    
    
<div class="panel" style="width:430px; margin-left:20px; margin-top:20px;float: left; height: 283px;">	
	<div class="panel-body">
	  <div class="col-md-12">
	  	<h4 class="animated fadeInLeft" style="float: left;width: 350px;">자료 게시판</h4><a href="studydatabbsgo.do"><p class="animated fadeInDown pp" >더보기</p></a>
	      <table id="databbs">
	      	<tr>
	      		<th width="200">제목</th><th width="100">작성자</th><th width="100">날짜</th>
	      	</tr>
	      	<c:if test="${empty databbslist }">	
	      		<tr><td>　</td></tr>
	      		<tr><td>　</td></tr>
	      		<tr><td colspan=3>등록된 게시물이 없습니다.</td></tr>
	      		<tr><td>　</td></tr>
	      		<tr><td>　</td></tr>
      		</c:if>
      		<c:forEach var="dlist" items="${databbslist }" begin="0" step="1" end="4">	      	
	      	<tr><td><a href="study_filebbsContent.do?study_filebbsidx=${dlist.study_filebbsidx}">${dlist.study_filebbssubject}</a></td><td>${dlist.stu_name}</td><td>${dlist.study_filebbswritedate }</td></tr>	      	
	      	</c:forEach>
	      </table>
	  </div>
    </div>
</div>       
    
    
    
    
    
    
    
    
    
    
    

</div>
</div>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/summernote.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>
<script src="asset/js/plugins/ion.rangeSlider.min.js"></script>
<script src="asset/js/plugins/bootstrap-material-datetimepicker.js"></script>
<script src="asset/js/plugins/jquery.mask.min.js"></script>
<script src="asset/js/plugins/select2.full.min.js"></script>
<script src="asset/js/plugins/nouislider.min.js"></script>
<!-- custom -->
 <script src="asset/js/main.js"></script>
</body>
</html>