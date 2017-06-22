<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
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
<script>
function memdel(aid){		
	var params="stu_id="+encodeURIComponent(aid);
	 $.ajax({
			type : "GET",
			url : "study_memdel.do",	
			data : params, 
			error:function (e){
				alert(e.responseText);
			},
			success:function(data){	
				 document.getElementById("leader_div").innerHTML="";
				 document.getElementById('studymem_list').innerHTML="";
				 studymemlist();				
			}
	 });			
}
var i=0
var leaderok=0;

function studymemlist(){
	 $.ajax({
			type : "GET",
			url : "study_memberchange.do",				
			success:function(data){	
				var leader=data.ldto.study_leader;
				var memlistdiv=document.getElementById('studymem_list');		
				var leaderdiv=document.getElementById('leader_div');	
				var leader_select=document.getElementById('leader_mem');
				for(var i=0;i<data.infolistdto.length;i++){
					var ml=eval("data.infolistdto["+i+"]");
					if(leader==ml.stu_id){
						var leaderlistdiv=leadermakediv(ml);
						leaderdiv.appendChild(leaderlistdiv);
					}else{						
						var memstudydiv=makestudymemlist(ml);
						memlistdiv.appendChild(memstudydiv);
						if(ml.stu_id!=data.ldto.study_seconleader){
							var leader_option=document.createElement('option');
							leader_option.text=ml.stu_id;
							leader_option.value=ml.stu_id;
							leader_select.appendChild(leader_option);
						}
					}
					if(ml.stu_id=="${sessionScope.id}"){
						document.getElementById("leader_change_sel").style.display="inherit";
					}
				}
				
				
				
			}
	 });		 
}
function leadermakediv(ml){
	var mldiv=document.createElement('div');
	mldiv.setAttribute('id','mem'+i);
	mldiv.innerHTML='<table cellspacing="0" width=850><tr><td width="300" style="padding-left:30px;"><h4>'+ml.stu_id+'</h4></td><td style="padding-top:20px;width:200px;">'+ml.stu_name+'</td><td style="height:100%;width:350px;"></td></tr></table>'+
		'<table cellspacing="0" border=0><tr><td width="210" align="center">스터디 총 진행'+ml.study_info_alltime+'번</td><td width="160" align="center">완료 '+ml.study_info_comple+'번</td><td width="160" align="center">진행중 '+ml.study_info_playing+'번</td><td width="160" align="center">추방 '+ml.study_info_deportnum+'번</td><td width="170" align="center">하차'+(ml.study_info_alltime-ml.study_info_comple-ml.study_info_playing-ml.study_info_deportnum)+'</td></tr></table>';				
	i++;
	
	mldiv.comment=ml;
	mldiv.className="ml";
	return mldiv;
}

function makestudymemlist(ml){
	
	var mldiv=document.createElement('div');
	mldiv.setAttribute('id','mem'+i);
	mldiv.innerHTML='<table cellspacing="0"  width=850><tr><td width="300" style="padding-left:30px;"><h3>'+ml.stu_id+'</h3></td><td style="padding-top:20px;width:200px;">'+ml.stu_name+'</td><td style="height:100%;padding-left:350px;width:350px;"></td></tr></table>'+
		'<table cellspacing="0" border=0><tr><td width="210" align="center">스터디 총 진행'+ml.study_info_alltime+'번</td><td width="160" align="center">완료 '+ml.study_info_comple+'번</td><td width="160" align="center">진행중 '+ml.study_info_playing+'번</td><td width="160" align="center">추방 '+ml.study_info_deportnum+'번</td><td width="170" align="center">하차 '+(ml.study_info_alltime-ml.study_info_comple-ml.study_info_playing-ml.study_info_deportnum)+' <input type="button" class="btn btn-default" onclick="memdel(\''+ml.stu_id+'\')" value="추방하기"></td></tr></table>';				
	i++;
	mldiv.comment=ml;
	mldiv.className="ml";
	return mldiv;
}

function memadd(){
	var memadd=document.getElementById("mem_info");
	var memadddiv=document.createElement('div');
	memadddiv.innerHTML='<input type="text" name="stu_id"> '
	memadd.appendChild(memadddiv);
}

function mem_search(){
	var stu_id=document.studymem_add.stu_id.value;	
	var params="stu_id="+encodeURIComponent(stu_id);
	 $.ajax({
			type : "GET",
			url : "study_memsearch.do",		
			data : params, 
			success:function(data){		
				if(data.msg!=null){
					alert(data.msg);
				}else{
					var ml=data.stu_info;
					var memadd=document.getElementById("mem_info");
					var memadddiv=document.createElement('div');
					memadddiv.innerHTML='<table cellspacing="0" border=0><tr><td width="200" style="padding-left:30px;"><h3>'+ml.stu_id+'</h3></td><td style="padding-top:20px;">'+ml.stu_name+'</td></tr></table>'+
					'<table cellspacing="0" border=0><tr><td width="160" align="center">스터디 총 진행'+ml.study_info_alltime+'번</td><td width="160" align="center">완료 '+ml.study_info_comple+'번</td><td width="160" align="center">진행중 '+ml.study_info_playing+'번</td><td width="160" align="center">추방 '+ml.study_info_deportnum+'번</td><td width="160" align="center">하차 '+(ml.study_info_alltime-ml.study_info_comple-ml.study_info_playing-ml.study_info_deportnum)+'</td></tr></table>';					
					memadd.appendChild(memadddiv);
				}
							
			}
	 });
}
function study_mem_add(){
	var stu_id=document.studymem_add.stu_id.value;	
	var params="stu_id="+encodeURIComponent(stu_id);
	 $.ajax({
			type : "GET",
			url : "study_memadd.do",		
			data : params, 
			success:function(data){	
				alert(data.msg);
				 document.getElementById("leader_div").innerHTML="";
				 document.getElementById('studymem_list').innerHTML="";
				 studymemlist();
				 document.getElementById("mem_info").innerHTML="";
			}
	 });
	 
}
function leaderchange(index){
	var change_mem="";
	if(index==1){
		change_mem=document.getElementById('leader_mem').value;
	}else{
		change_mem=document.getElementById('secon_mem').value;
	}
	var params="check="+index+"&change_mem="+change_mem;
	alert(params);
	 $.ajax({
			type : "GET",
			url : "study_leaderchange.do",		
			data : params, 
			success:function(data){	
				
			}
	 });
}
</script>
<style>
select{
	margin-right: 10px;
}
.btn-outline{
	padding: 5px;
margin-right: 10px;
}
</style>
</head>

<body id="mimin" class="dashboard" style="width:1200px; " onload="studymemlist()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">


<div class="panel" style="width:880px;">	
	<div class="panel-body">
	  <div class="col-md-12">
	      <h3 class="animated fadeInLeft">스터디</h3>
	      <p class="animated fadeInDown">
	  		설정 > 멤버 변경  
	      </p>
	  </div>
    </div>
</div>

<div class="panel" id="leader_change_sel" style="width:880px; margin-top: 20px;display:none;">	
	<div class="panel-body">

<div > <select id="leader_mem"><option>선택</option></select><button onclick="leaderchange(1)" class=" btn btn-outline btn-primary">조장 변경 </button> <select id="secon_mem"> </select><button onclick="leaderchange(2)"  class="btn btn-outline btn-primary">부조장 변경 </button></div>
	</div>
</div>


<div class="panel" style="width:880px; margin-top: 20px;">	
	<div class="panel-body">
		<div id="leader_div"></div>
	</div>
</div>

<div class="panel" style="width:880px; margin-top: 20px;">	
	<div class="panel-body">
		<div id="studymem_list"></div>
		<button style="margin-left: 700px;margin-top: 10px;" id="memsearch" class="btn btn-primary" data-toggle="modal" data-target="#myModal">멤버 추가 </button>
	</div>
</div>



 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">아이디 검색</h4>
        </div>
       <form name="studymem_add">
        <div class="modal-body">            
		<input type="text" name="stu_id"><button type="button" id="memsearch" class="btn btn-default" onclick="mem_search()">검색</button>
			<div id="mem_info"></div>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" data-dismiss="modal" onclick="study_mem_add()" value="멤버 등록">
        </div>
      </form>
      </div>
      
    </div>
  </div>
</div></div>
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