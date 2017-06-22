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
		url : "study_req_list.do",	
		error:function (e){
			alert("불러오는데 실패하였습니다.");
		},
		success:function(data){			
			var listdiv=document.getElementById('req_list');					
			for(var i=0;i<data.reqlist.length;i++){
				var reql=eval("data.reqlist["+i+"]");
				var study_reqlist_div=makestudy_req_list(reql);
				listdiv.appendChild(study_reqlist_div);
			}				
		}
	});
}
var i=0;
function makestudy_req_list(reql){
	var reqldiv=document.createElement('tr');
	reqldiv.setAttribute('id','reql_'+i);
	if(reql.situ=="신청중"){
		reqldiv.innerHTML='<td width="500" align="center">'+reql.sub+'</td><td width="150" align="center">'+reql.writer+'</td><td width="100" align="center">'+reql.situ+'</td><td width="100" align="center"><input type="button"   class="btn btn-primary" onclick="req_cancel('+reql.recidx+')" value="신청취소"></td>';
	}else{
		reqldiv.innerHTML='<td width="500" align="center">'+reql.sub+'</td><td width="150" align="center">'+reql.writer+'</td><td width="100" align="center">'+reql.situ+'</td><td width="100" align="center"></td>';
	}			
	i++;
	reqldiv.comment=reql;
	reqldiv.className="reql";
	return reqldiv;
}
function req_cancel(idx){
	var params="study_recruitidx="+idx; 
	$.ajax({
		type : "GET",
		url : "study_req_cancel.do",
		data : params, 
		error:function (e){
			alert("실패하였습니다.");
		},
		success:function(data){			
			document.getElementById("req_list").innerHTML="";		
			get_req_list();
		}
	});
}
</script>
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
                  	스터디 신청 내역
                </p>
            </div>
          </div>
    </div>    

<div class="panel" style="width:880px; margin-top: 20px;">
          <div class="panel-body">
			<table class="table-striped table-bordered dataTable no-footer">
				<tr>
				<td width=500>제 목 </td><td width=150>생성자</td><td width=100>진 행</td><td width=100> 취 소 </td>
				</tr>
			</table>
			<table class="table-striped table-bordered dataTable no-footer" id="req_list" width=850>			
			</table>
			
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