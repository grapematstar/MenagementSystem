<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
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
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css"/>

	<link href="asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="asset/img/logomi.png">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
  	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<link rel="stylesheet" type="text/css" href="codebase/fonts/font_roboto/roboto.css"/>
	<link rel="stylesheet" type="text/css" href="codebase/dhtmlxcalendar.css"/>
	<script src="codebase/dhtmlxcalendar.js"></script>
<script>
var i=0
function studylist(cp){
	var params="";
	if(cp!=null){
		params="cp="+cp;
	}else{
		params="cp=1";
	}
	 $.ajax({
			type : "GET",
			url : "studyList.do",		
			data : params,
			success:function(data){						
				var listdiv=document.getElementById('study_list');	
				listdiv.innerHTML="";
				for(var i=0;i<data.list.length;i++){
					var sl=eval("data.list["+i+"]");
					var studydiv=makestudylist(sl);
					listdiv.appendChild(studydiv);
				}	
				document.getElementById('page').innerHTML=data.page;
			}
	 });		 
}
function makestudylist(sl){
	var situ="";
	var checkStr="";
	if(sl.study_situ==0){
		situ="진행중";
		checkStr="종료";
	}else{
		situ="종료";
		checkStr="재개";
	}			
	var sldiv=document.createElement('div');
	sldiv.setAttribute('id','s'+i);
	sldiv.innerHTML='<table cellspacing="0" ><tr><td width="50" align="center">'+sl.study_idx+'</td><td width="450" align="center">'+sl.study_subject+'</td><td width="100" align="center">'+sl.study_id+'</td><td width="150" align="center">'+sl.study_createdate+'</td><td width="100" align="center"><input type="button" class=" btn btn-outline btn-primary" onclick="study_CloseOrStart('+sl.study_idx+','+sl.study_situ+')" value="'+checkStr+'"> <a onclick="contentshow('+i+')">▼</a></td></tr></table>'+
					'<table id="content'+i+'" style="display:none;"><tr><td width="400" align="left" style="padding-left:20px;"> 주제 : '+sl.study_directory+'</td><td width="100" align="center"> 총 '+sl.study_maxnum+' 명 </td><td width="200" align="center"> 종료 날짜 : '+sl.study_lastday+'</td><td>'+situ+'</td></tr><tr><td colspan="4" align="center">'+sl.study_content+'</td></tr></table>';	
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
function study_CloseOrStart(idx,situ){
	$.ajax({
		type:"get",url:"study_CloseOrStart.do",data:"study_idx="+idx+"&study_situ="+situ,
		success:function(data){
			alert(data.msg);
			studylist();
		}
	})
}

/*jsy place*/
function goSearching(cpnum){
	if(cpnum!=null){
		cp=cpnum;
	}else{
		cp=1;
	}
	var radioitem=document.getElementsByName("radioitem");//라디오버튼
	var key=document.getElementById("key").value;//입력값
	var params="";
	if(key==null || key==""){
		alert("검색어를 입력하세요.");
	}
	for(var r=0; r<radioitem.length; r++){
		if(radioitem[r].checked==true){
			if(radioitem[r].value=="title"){
				params="cp="+cp+"&title="+key+"&theme=";
				break;
			}else{
				params="cp="+cp+"&title=&theme="+key;
				break;
			}
		}
	}
	$.ajax({
		type:"get",url:"goSearching.do",data:params,
		success:function(data){
			var listdiv=document.getElementById('study_list');	
			listdiv.innerHTML="";
			if(data.list.length==0){
				alert("검색결과가 없습니다");
				location.reload();
			}else{
				for(var i=0;i<data.list.length;i++){
					var sl=eval("data.list["+i+"]");
					var studydiv=makestudylist(sl);
					listdiv.appendChild(studydiv);
				}		
				document.getElementById('page').innerHTML=data.page;
			}
		}
	})
}

</script>
<style>
 .btn-outline{
 	padding:1px;
 }
</style>  
</head>
<body id="mimin" class="dashboard"  onload="studylist(1)" style="width:1200px;" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">


	<div class="panel" style="margin-top:20px;width:880px;">
	
	<div  style="padding-top: 10px;margin-left: 500px;">
		<select name="radioitem" style="top:2px;position: relative;"><option value="title">제목</option><option value="theme">주제</option></select> 
		<input type="text" id="key"><input type="button" class="btn btn-primary" onclick="goSearching(1)" value="검색"  style="bottom:1px;position: relative;margin-left: 5px;">
	</div>
<div class="panel-body">
<table class="table table-striped table-bordered dataTable no-footer">
			<thead>
			<tr>		
			<th class="sorting_asc" width="50" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="100"  align="center">생성자</th><th class="sorting_asc" width="150" align="center">날짜</th><th width="100" align="center" class="sorting_asc">진행</th>
			</tr>
			</thead>
		</table>
	
	 <div id="study_list" style="width:850px;"></div>


  <div style="width:850px;">
			 <table >
		 	<tr>		                                                                                                             
				<th class="sorting_asc" width="850" align="center" id="page"></th>
			</tr>  
			</table>
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
 <script type="text/javascript">
 $(document).ready(function(){	   
          $('.summernote').summernote({
            height: 150
          });

    $("#signupForm").validate({
      errorElement: "em",
      errorPlacement: function(error, element) {
        $(element.parent("div").addClass("form-animate-error"));
        error.appendTo(element.parent("div"));
      },
      success: function(label) {
        $(label.parent("div").removeClass("form-animate-error"));
      },
      rules: {
        validate_study_name: "required",
     
        validate_directory: {
          required: true,
          minlength: 2          
        },
        validate_maxnum: {
          required: true,
          minlength: 1          
        },
      },
      messages: {
        validate_study_name: "Please enter your study_name",     
        validate_username: {
          required: "Please enter a username",
          minlength: "Your username must consist of at least 2 characters"
        },
        validate_password: {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long"
        },
        validate_confirm_password: {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long",
          equalTo: "Please enter the same password as above"
        },
        validate_email: "Please enter a valid email address",
        validate_agree: "Please accept our policy"
      }
    });
    $('.mask-phone').mask('00');
  }); 
 </script>  
</body>
</html>