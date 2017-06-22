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
var z=0;
function get_req_list(){
	document.getElementById('req_recivlist').innerHTML="";	
	$.ajax({
		type : "GET",
		url : "study_req_recivlist.do",	
		error:function (e){
			alert("불러오는데 실패하였습니다.");
		},
		success:function(data){			
			var listdiv=document.getElementById('req_recivlist');		
			for(var i=0;i<data.listmap.length;i++){
				var reql=eval("data.listmap["+i+"]");
				var study_reqlist_div=makestudy_req_list(reql,data);
				listdiv.appendChild(study_reqlist_div);
				document.getElementById('req_id_'+i).style.display="none";	
			}				
					
		}
	});
}
function makestudy_req_list(reql,data){
	var reqldiv=document.createElement('div');
	reqldiv.setAttribute('id','reql_'+z);	
	reqldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tr><td width="600" align="center">'+reql.sub+'</td><td width="200" align="center"> <button class="btn btn-primary"  onclick="study_recruit_del('+reql.rcidx+')" >삭제</button>  <button class="btn btn-primary"  onclick="study_recruit_close('+reql.rcidx+')" >마감</button></td><td width=50> <a onclick="show('+z+')">▼</a></td></tr></table>';
	var req_id_ldiv=document.createElement('div');
	req_id_ldiv.setAttribute('id','req_id_'+z);
	var id_l=eval("data.info_["+z+"]");
	for(var j=0;j<id_l.length;j++){	
		var idl=eval("id_l["+j+"]");
		req_id_ldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tr><td width="200" style="padding-left:30px;"><h3>'+idl.stu_id+'</h3></td><td style="padding-top:20px; width:100px;">'+idl.stu_name+'</td><td width="300"></td><td width=250 align="center"><button class="btn btn-defualt"  onclick="recruit_accept(\''+idl.stu_id+'\','+reql.rcidx+')" >수락</button> <button class="btn btn-defualt" style="margin-right:48px;"  onclick="recruit_cancel(\''+idl.stu_id+'\','+reql.rcidx+')" >거절</button></td></tr></table>'+
		'<table cellspacing="0" border=0><tr><td width="250" align="center">스터지 총 진행'+idl.study_info_alltime+'번</td><td width="150" align="center">완료 '+idl.study_info_comple+'번</td><td width="150" align="center">진행중 '+idl.study_info_playing+'번</td><td width="150" align="center">추방 '+idl.study_info_deportnum+'번</td><td width="150" align="center">하차 '+(idl.study_info_alltime-idl.study_info_deportnum-idl.study_info_playing-idl.study_info_comple)+'번</td></tr></table>';
		
	}
	reqldiv.appendChild(req_id_ldiv);
	z++;
	alert(z);
	reqldiv.comment=reql;
	reqldiv.className="reql";
	return reqldiv;
}
function show(index){
	var show_div=document.getElementById('req_id_'+index);
	if(show_div.style.display=="none"){
		show_div.style.display="inherit";
	}else{
		show_div.style.display="none";
	}
}
function study_recruit_del(recruitidx){
	alert(recruitidx);
	
	$.ajax({
		type:"get",url:"study_recruit_del.do",data:"study_recruitidx="+recruitidx,
		success:function(data){
			get_req_list();
 		}
	});
	
}
/*situ를0으로*/
function study_recruit_close(recruitidx){
	alert(recruitidx);
	$.ajax({
		type:"get",url:"study_recruit_close.do",data:"study_recruitidx="+recruitidx,
		success:function(data){
			get_req_list();
		}
	});
}
function recruit_accept(stu_id,rcidx){
	alert(stu_id+"/"+rcidx);
	$.ajax({
		type:"get",url:"recruit_accept.do",data:"stu_id="+stu_id+"&study_recruitidx="+rcidx,
		success:function(data){
			alert(data.msg);
			get_req_list();
		}
	});
}
function recruit_cancel(stu_id,rcidx){
	alert(stu_id+"/"+rcidx);
	$.ajax({
		type:"get",url:"recruit_cancle.do",data:"stu_id="+stu_id+"&study_recruitidx="+rcidx,
		success:function(data){
			alert(data.msg);
			get_req_list();
		}
	});
}
</script>
<style>
h3{
	margin:5px;
}
</style>
</head>
<body onload="get_req_list()" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">

<div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">스터디</h3>
                <p class="animated fadeInDown">
                  	신청 받은 내역
                </p>
            </div>
          </div>
    </div>      


<div class="panel" style="width:880px;margin-top: 20px;">
          <div class="panel-body">
			<div id="req_recivlist"></div>


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
