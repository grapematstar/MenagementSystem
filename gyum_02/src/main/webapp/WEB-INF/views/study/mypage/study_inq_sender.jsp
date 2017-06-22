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
var newinq=0;
var z=0;
function inqlist(){
	 $.ajax({
			type : "GET",
			url : "study_inq_sendlist.do",				
			success:function(data){	
				var listdiv=document.getElementById('recive_list');					
				for(var j=0;j<data.inqlist.length;j++){
					var inql=eval("data.inqlist["+j+"]");				
					var inql2=eval("data.inqlist["+(j-1)+"]");
					if(j==0){
						newinq=1;						
					}else if(j>0&&inql.study_sub!=inql2.study_sub){						
						newinq=1;
					}
					var inq_div=makestudy_inq_list(inql);					
					listdiv.appendChild(inq_div);
				}				
			}
	 });		 
}

var k=0;
function makestudy_inq_list(inql){	
	var inqldiv=document.createElement('div');
	 inqldiv.setAttribute('id','inq_'+k);
	if(newinq==1){
		z++
		inqldiv.innerHTML='<table cellspacing="0" class="table-striped table-bordered dataTable no-footer"><tr onclick="inq_con(\''+inql.reciver+'\','+inql.idx+',\''+inql.situ+'\')"><td width="500" align="center">'+inql.study_sub+'</td><td width=150 align="center">주제:'+inql.directory+'</td><td width=150>'+inql.reciver+'</td><td width="100" align="center">'+inql.situ+'</td></tr></table>';	
	}else{
	 	document.getElementById('inq_id'+z).innerHTML+='<table style="padding-bottom:7px;"><tr><td width="150" align="left" style="padding-left:20px;"><a onclick="inq_con(\''+inql.reciver+'\','+inql.idx+',\''+inql.situ+'\')">'+inql.reciver+'</a></td></tr></table>'; 
	}	
	k++
	inqldiv.comment=inql;
	inqldiv.className="inql";
	newinq=0;
	return inqldiv;	
}
function inq_id_show(index){
	var show=eval("document.getElementById('inq_id"+index+"')");
	if(show.style.display=="inherit"){
		show.style.display="none";
	}else{
		show.style.display="inherit";
	}	
}
function inq_con(reciver,idx,situ){
	location.href="inq_con_send_go.do?situ="+encodeURIComponent(situ)+"&idx="+idx+"&reciver="+encodeURIComponent(reciver);
	
}
</script>

</head>
<body onload="inqlist()" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">

<div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">스터디</h3>
                <p class="animated fadeInDown">
                  	문의한 내역
                </p>
            </div>
          </div>
    </div>  
<div class="panel" style="width:880px;margin-top:20px;">
          <div class="panel-body">
			<div id="recive_list" style="max-heigt:600px;overflow: auto;"></div>
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