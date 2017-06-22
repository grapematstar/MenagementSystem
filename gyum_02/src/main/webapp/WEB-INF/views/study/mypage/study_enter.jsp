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
<script>
function get_req_list(){
	$.ajax({
		type : "GET",
		url : "study_my_recruit_list.do",
		
		error:function (e){
			alert("불러오는데 실패하였습니다.");
		},
		success:function(data){	
			var rcs_make_listdiv=document.getElementById('recruit_list');	
			for(var i=0;i<data.rcs_make_list.length;i++){
				var rcs_makel=eval("data.rcs_make_list["+i+"]");
				var study_make_rcslist_div=makestudy_make_rcs_list(rcs_makel);
				rcs_make_listdiv.appendChild(study_make_rcslist_div);
			}
			
			
			var reqlistdiv=document.getElementById('req_list');	
			if(data.rcslist.length<1){
				reqlistdiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer" width=850><tr><td>등록된 스터디가 없습니다.</td></tr></table>';
			}
			for(var i=0;i<data.rcslist.length;i++){
				var rcsl=eval("data.rcslist["+i+"]");
				var study_rcslist_div=makestudy_rcs_list(rcsl);
				reqlistdiv.appendChild(study_rcslist_div);
			}			
			var inglistdiv=document.getElementById('ing');		
			if(data.ing.length<1){
				inglistdiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer" width=850><tr><td>등록된 스터디가 없습니다.</td></tr></table>';
			}
			for(var i=0;i<data.ing.length;i++){
				var ingl=eval("data.ing["+i+"]");
				var study_inglist_div=makestudy_ing_list(ingl);
				inglistdiv.appendChild(study_inglist_div);
			}			
			var closelistdiv=document.getElementById('close');	
			if(data.close.length<1){
				closelistdiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer" width=850><tr><td>등록된 스터디가 없습니다.</td></tr></table>';
			}
			for(var i=0;i<data.close.length;i++){
				var closel=eval("data.close["+i+"]");
				var study_closelist_div=makestudy_ing_list(closel);
				closelistdiv.appendChild(study_closelist_div);
			}
		}
	});
}
var i=0;
var k=0;
function makestudy_rcs_list(rcsl){
	var situ="";
	if(rcsl.study_recruit_situ==0){
		situ="마감";
	}else{
		situ="진행중";
	}
	var rcsldiv=document.createElement('div');
	rcsldiv.setAttribute('id','rcsl_'+i);
	rcsldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tr><td width="50" >'+rcsl.study_recruitidx+'</td><td width="450" style="text-align:left;">'+rcsl.study_recruit_subject+'</td><td width="100" align="center">'+situ+'</td><td width="100" align="center">'+rcsl.stu_id+'</td><td width="150" align="center">'+rcsl.study_recruit_writedate+'<input type="button" class=" btn btn-outline btn-primary" onclick="rcs_cancel('+rcsl.study_recruitidx+')" value="탈퇴"></td></tr></table>';
	k++;
	rcsldiv.comment=rcsl;
	rcsldiv.className="rcsl";
	return rcsldiv;
}
function makestudy_make_rcs_list(rcsl){
	var situ="";
	var rcsldiv=document.createElement('div');
	rcsldiv.setAttribute('id','rcsl_'+i);
	if(rcsl.study_recruit_situ==0){
		situ="마감";
		rcsldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tr><td width="50" >'+rcsl.study_recruitidx+'</td><td width="450" style="text-align:left;">'+rcsl.study_recruit_subject+'</td><td width="100" align="center">'+situ+'</td><td width="100" align="center">'+rcsl.stu_id+'</td><td width="150" align="center">'+rcsl.study_recruit_writedate+'</td></tr></table>';
	}else{
		situ="진행중";
		rcsldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tr><td width="50" >'+rcsl.study_recruitidx+'</td><td width="450" style="text-align:left;">'+rcsl.study_recruit_subject+'</td><td width="100" align="center">'+situ+'</td><td width="100" align="center">'+rcsl.stu_id+'</td><td width="150" align="center">'+rcsl.study_recruit_writedate+'<input type="button" class=" btn btn-outline btn-primary" onclick="rcs_close('+rcsl.study_recruitidx+')" value="마감"></td></tr></table>';
	}
	k++;
	rcsldiv.comment=rcsl;
	rcsldiv.className="rcsl";
	return rcsldiv;
}

function makestudy_ing_list(sl){
	var situ="";
	if(sl.study_situ==0){
		situ="진행중";
	}else{
		situ="종료";
	}			
	var sldiv=document.createElement('div');
	sldiv.setAttribute('id','sl_'+i);	                
	sldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tbody><tr class="odd"><td width="50">'+sl.study_idx+'</td><td width="450" style="text-align:left;"><a onclick=" memcheck('+sl.study_idx+')">'+sl.study_subject+'</a></td><td width="100" align="center">'+situ+'</td><td width="100" align="center">'+sl.study_id+'</td><td width="100" align="center">'+sl.study_createdate+'</td><td width="50" align="center"><a onclick="contentshow('+i+')">▼</a></td></tr></table>'+
					'<table id="content'+i+'" style="display:none;" class="table-striped table-bordered dataTable no-footer"><tr><td width="400" align="left" style="padding-left:20px;"> 주제 : '+sl.study_directory+'</td><td width="100" align="center"> 총 '+sl.study_maxnum+' 명 </td><td width="200" align="center"> 종료 날짜 : '+sl.study_lastday+'</td><td>'+situ+'</td></tr><tr><td colspan="4" align="center">'+sl.study_content+'</td></tr></table>';
	i++;
	sldiv.comment=sl;
	sldiv.className="sl";
	return sldiv;
}
function contentshow(num){
	var cs=eval("document.getElementById('content"+num+"')");
	if(cs.style.display=="inherit"){
		cs.style.display="none";	
	}else{
		cs.style.display="inherit";	
	}
}	
function memcheck(idx){
	var params="study_idx="+encodeURIComponent(idx);
	$.ajax({
		type : "GET",
		url : "memcheck.do",
		data : params, 
		error:function (e){
			alert(e.responseText);
		},
		success:function(data){						
			if(data.msg!=null){
				alert(data.msg);
			}else{						
				location.href="study.do?study_idx="+idx;
			}
		}
	
	});
}
function rcs_close(recruitidx){
	var close_check=confirm("마감하고 스터디를 생성하시겠습니까?");
	var params="study_recruitidx="+recruitidx+"&close_check="+close_check;
	$.ajax({
		type : "GET",
		url : "rcs_close.do",
		data : params, 
		error:function (e){
			alert(e.responseText);
		},
		success:function(data){		
			document.getElementById('recruit_list').innerHTML="";	
			document.getElementById('req_list').innerHTML="";	
			document.getElementById('ing').innerHTML="";		
			document.getElementById('close').innerHTML="";	
			get_req_list();
		}
	
	});
}
function rcs_cancel(recruitidx){
	var params="study_recruitidx="+recruitidx;
	$.ajax({
		type : "GET",
		url : "rcs_cancel.do",
		data : params, 
		error:function (e){
			alert(e.responseText);
		},
		success:function(data){		
			document.getElementById('recruit_list').innerHTML="";	
			document.getElementById('req_list').innerHTML="";	
			document.getElementById('ing').innerHTML="";		
			document.getElementById('close').innerHTML="";	
			get_req_list();
		}
	
	});
}
</script>
<style>
	.divscroll{  		
        height: expression( this.scrollHeight > 99 ? "100px" : "auto" );
        max-height: 100px;
        border: 1px solid #666;
        overflow-y: auto;
    }
	.btn-outline{
		padding: 1px;
		
	}
</style>

</head>

<body id="mimin" class="dashboard" onload="get_req_list()" style="width:1200px;" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">

<div class="panel" style="width:880px;">	
	<div class="panel-body">
		<div class="col-md-12" style="float: left;">
                <h5 class="animated fadeInLeft">스터디 모집 생성 내역</h5>              
            </div>
           <div style="float: left;">
            <table class="table table-striped table-bordered dataTable no-footer">
				<thead>
			<tr>		
			<th class="sorting_asc" width="50" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="100"  align="center">진행</th><th class="sorting_asc" width="100" align="center">생성자</th><th width="150" align="center" class="sorting_asc">날짜</th>
			</tr>
			</thead>
			</table>
            </div>   
         <div id="recruit_list" style="max-height: 400px;overflow: auto;float: left;"></div>   
</div></div>


<div class="panel" style="width:880px;margin-top: 20px;">	
	<div class="panel-body">
		<div class="col-md-12" style="float: left;">
                <h5 class="animated fadeInLeft">스터디 모집 참여중</h5>              
            </div>
           <div style="float: left;">
            <table class="table table-striped table-bordered dataTable no-footer">
				<thead>
			<tr>		
			<th class="sorting_asc" width="50" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="100"  align="center">진행</th><th class="sorting_asc" width="100" align="center">생성자</th><th width="150" align="center" class="sorting_asc">날짜</th>
			</tr>
			</thead>
			</table>
            </div>   
         <div id="req_list" style="max-height: 400px;overflow: auto;float: left;"></div>   
</div></div>


<div class="panel" style="width:880px;margin-top: 20px;">	
	<div class="panel-body">
		<div class="col-md-12" style="float: left;">
                <h5 class="animated fadeInLeft">진행중인 스터디</h5>              
            </div>
            <div style="float: left;">
            <table class="table table-striped table-bordered dataTable no-footer">
				<thead>
				<tr>		
				<th class="sorting_asc" width="50" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="100"  align="center">진행</th><th class="sorting_asc" width="100" align="center">생성자</th><th width="150" align="center" class="sorting_asc">날짜</th>
				</tr>
				</thead>
			</table>
            </div>
         <div id="ing" style="max-height: 400px;overflow: auto;float: left;"></div>
</div></div>




<div class="panel" style="width:880px;margin-top: 20px;">	
	<div class="panel-body">
		<div class="col-md-12" style="float: left;">
                <h5 class="animated fadeInLeft">종료된 스터디</h5>              
        </div>
          <div style="float: left;">
            <table class="table table-striped table-bordered dataTable no-footer">
				<thead>
				<tr>		
				<th class="sorting_asc" width="50" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="100"  align="center">진행</th><th class="sorting_asc" width="100" align="center">생성자</th><th width="150" align="center" class="sorting_asc">날짜</th>
				</tr>
				</thead>
			</table>
            </div>
        
         <div id="close" style="max-height: 400px;overflow: auto;float: left;"></div>
</div></div>



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