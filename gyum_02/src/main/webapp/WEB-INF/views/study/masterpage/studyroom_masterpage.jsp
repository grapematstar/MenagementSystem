<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 관리</title>
 <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/handsontable.full.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->
  <link rel="shortcut icon" href="asset/img/logomi.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
/*모든목록 불러오기*/
function getStudyroomList(cp){
	var params="";
	if(cp!=null){
		params="cp="+cp;
	}else{
		params="cp=1";
	}
	$.ajax({
		type:"get",url:"getStudyroomList.do",data:params,
		success:function(data){
			var listDiv = document.getElementById("listDiv");
			listDiv.innerHTML="";
			for(var i=0; i<data.allList.length; i++){
				var all = eval('data.allList['+i+']');
				var mklist = mkmk(all);
				listDiv.appendChild(mklist);
			}
			document.getElementById('page').innerHTML=data.page;
		}
	})
}
/*리스트 만들기*/
function mkmk(all){
	var mk=document.createElement("tr");
	mk.innerHTML='<td width=70>'+all.studyroom_idx+'</td><td width=50>'+all.studyroom_name+'</td><td width=100>'+all.studyroom_id+'</td><td width=120>'+all.studyroom_reserv_date+'</td><td width=50>'+all.studyroom_reserv_hour+'</td><td width=50>'+all.studyroom_usetime+'</td><td width=120>'+all.studyroom_writedate+'</td><td width=226>'+all.studyroom_note+'</td><td width=64><input type="button" class="btn btn-primary" style="margin-bottom:2px;" onclick="garbage('+all.studyroom_idx+')" value="취소"</td>';
	return mk;
}
/*스터디룸 삭제*/
function garbage(idx){
	$.ajax({
		type:"get",url:"garbage.do",data:"studyroom_idx="+idx,
		success:function(data){
			alert(data.msg);
			location.reload();
		}	
	})
}
/*검색으로 목록내오기*/
function srIDsearch(cp){
	var sr_id = document.getElementById("studyroom_id").value;
	var params="";
	if(cp!=null){
		params="cp="+cp+"&studyroom_id="+sr_id;
	}else{
		params="cp=1&studyroom_id="+sr_id;
	}
	$.ajax({
		type:"get",url:"srIDsearch.do",data:params,
		success:function(data){
			var listDiv = document.getElementById("listDiv");
			listDiv.innerHTML="";
			for(var i=0; i<data.IdList.length; i++){
				var IdList = eval('data.IdList['+i+']');
				var mklist = mkmk(IdList);
				listDiv.appendChild(mklist);
			}
			document.getElementById('page').innerHTML=data.page;
		}
	})
	
}
</script>
<style>
.btn{
	padding-left: 8px;
	padding-right: 8px;
}

</style>
</head>
<body onload="getStudyroomList(1)"  id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel" style="width:880px;">	
	<div class="panel-body">
	<div class="col-md-12" style="float: left;">
                <h5 class="animated fadeInLeft">스터디룸  예약 리스트</h5>              
     </div>
<div style="margin-left: 30px; float: left;"><input type="text" id="studyroom_id"><input type="button" class="btn btn-primary" onclick="srIDsearch(1)" value="스터디룸 id검색" style="margin-left: 10px;"></div>


</div></div>

<div class="panel" style="margin-top:20px;width:880px;">
	<div class="panel-body">
		<table class="table table-striped table-bordered dataTable no-footer" >
			<thead>
			<tr>		
			<th class="sorting_asc" width="70" align="center">번호</th><th class="sorting_asc" width="50" align="center">룸</th><th class="sorting_asc" width="100" align="center">아이디</th><th width="120" align="center" class="sorting_asc">날짜</th><th width="50" align="center" class="sorting_asc">시간</th><th width="50" align="center" class="sorting_asc">사용시간</th><th width="120" align="center" class="sorting_asc">예약한시간</th><th width="290" align="center" class="sorting_asc">비고</th>
			</tr>
			</thead>
		</table>	   
		<table id="listDiv" class="table table-striped table-bordered dataTable no-footer">
		
		</table>
		
		 <div style="width:850px;">
			 <table >
		 	<tr>		                                                                                                             
				<th class="sorting_asc" width="700" align="center" id="page"></th><th width="150" align="center" class="sorting_asc"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">게시글 등록</button></th>
			</tr>  
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
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script> 
</body>
</html>