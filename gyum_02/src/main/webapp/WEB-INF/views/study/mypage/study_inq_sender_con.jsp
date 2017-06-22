<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

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

<meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#recive_list,#add{
	width: 800px;
}
#inq_{
	text-align: right;
}
#inq{
	text-align: left;
}

</style>
<script>
function inq_recive_list(){
	var study_idx=${inqdto.study_idx};
	var study_recruitidx=${inqdto.study_recruitidx};
	var study_inq_reciver="${inqdto.study_inq_reciver}";
	var study_inq_sender="${inqdto.study_inq_sender}";
	var params="study_idx="+study_idx+"&study_recruitidx="+study_recruitidx+"&study_inq_reciver="+encodeURIComponent(study_inq_reciver)+"&study_inq_sender="+encodeURIComponent(study_inq_sender);
	alert(params);
	$.ajax({
		type : "GET",
		url : "inq_con.do",
		data:params,
		success:function(data){	
			var infodiv=document.getElementById('another_info');			
			var info_id=data.infodto;
			info_makediv=info(info_id);
			infodiv.appendChild(info_makediv);
			var listdiv=document.getElementById('recive_list');					
			for(var i=0;i<data.inqlist.length;i++){
				var inql=eval("data.inqlist["+i+"]");				
				var inq_div=makestudy_inq_list(inql);				
				listdiv.appendChild(inq_div);
			}				
		}
 	});	
}


function info(ml){	
	var mldiv=document.createElement('div');
	mldiv.setAttribute('id','info');
	mldiv.innerHTML='<div class="col-md-12"><h3 class="animated fadeInLeft">'+ml.stu_id+'</h3>'+
		'<p class="animated fadeInDown">스터지 총 진행'+ml.study_info_alltime+'번 &nbsp;  &nbsp;  &nbsp;  &nbsp; 완료 '+ml.study_info_comple+'번 &nbsp;  &nbsp;  &nbsp; 진행중 '+ml.study_info_playing+'번 &nbsp;  &nbsp;  &nbsp; 추방 '+ml.study_info_deportnum+'번 &nbsp;  &nbsp; </p></div> ';				
	
	mldiv.comment=ml;
	mldiv.className="ml";
	return mldiv;
}


var i=0;
function makestudy_inq_list(inql){	
	var inqldiv=document.createElement('div');
	if(inql.stu_id=="${sessionScope.id}"){		
		inqldiv.setAttribute('id','inq_');
		inqldiv.innerHTML='<table cellspacing=0 width=850><td style="min-width:100px;"></td><td width="10" style="text-align:right;padding-bottom:0px;"></td><td style="min-width:10px;text-align:right !important;">'+inql.study_inq_readcheck+'<span class="inq" style="text-align:right;">'+inql.study_inq_content+'</span></td></tr></table>';	
	}else{
		inqldiv.setAttribute('id','inq');
		inqldiv.innerHTML='<table cellspacing="0" width=833><tr><td width="600" align="left"><span class="req_">'+inql.study_inq_content+'</span></td><td width=233></td></tr></table>';		
	}		
	i++;
	inqldiv.comment=inql;
	inqldiv.className="inql";
	return inqldiv;
}
function inq_yadd(){
	var study_inq_content="";
	var study_inq_c=document.getElementById('study_inq_content').value;
	if(study_inq_c.length<86){
		study_inq_content=study_inq_c;
	}else{		
		for(var u=85;u<study_inq_c.length;u+=85){
			study_inq_content+=study_inq_c.substring(0,u)+"<br>"+study_inq_content.substring(u);
		}
	}
	var study_idx=${inqdto.study_idx};
	var study_recruitidx=${inqdto.study_recruitidx};
	var study_inq_reciver="${inqdto.study_inq_reciver}";
	var study_inq_sender="${inqdto.study_inq_sender}";
	var params="study_idx="+study_idx+"&study_recruitidx="+study_recruitidx+"&study_inq_reciver="+encodeURIComponent(study_inq_reciver)+"&study_inq_sender="+encodeURIComponent(study_inq_sender)+"&study_inq_content="+encodeURIComponent(study_inq_content);
	$.ajax({
		type : "GET",
		url : "inq_answer.do",
		data:params,
		success:function(data){
			document.getElementById('study_inq_content').value="";
			document.getElementById('recive_list').innerHTML="";
			document.getElementById('another_info').innerHTML="";
			inq_recive_list();							
		}
 	});	
}
</script>
<style>

pre{
	margin-bottom:10px;
}
td{
	border-bottom: 0px !important;
	padding: 0px;
	padding-bottom:10px;	
	padding-top:10px;
}

.inq{
	min-width:10px;
	height: 100%;
	padding: 5px;
	background-color:  #ccffff;
	
	/* color:white; */
}
.req_{
padding: 5px;
	background-color: white;
}
</style>
</head>
<body onload="inq_recive_list()" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">

<div class="panel" style="width:880px;">
	<div class="panel-body">
		<div id="another_info"></div>
	</div>
</div>     


<div class="panel" style="width:880px;margin-top: 20px;">
	<div class="panel-body" >
		<div id="recive_list" style="max-height:600px;overflow: auto; width: 850px;background-color: #f9f9f9;"></div>
	</div>
</div>

<div class="panel" style="width:880px;">
	<div class="panel-body" >
	
		<div style="margin-left: 30px; float: left;" >
		     <textarea  rows="3" cols="100"  id="study_inq_content" style="resize: none;"></textarea></div>   
			 <div style="margin-left: 20px; float: left;" >
			 <input type="button" onclick="inq_yadd()" class="btn btn-primary" value="등록">
	       </div>
	</div>
</div>
</div></div>
<script src="asset/js/jquery.min.js"></script> 
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>

<script src="asset/js/plugins/summernote.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>

<script src="asset/js/plugins/jquery.mask.min.js"></script>

<script src="asset/js/plugins/nouislider.min.js"></script>
<!-- custom -->
 <script src="asset/js/main.js"></script>
</body>
</html>