<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

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

<script>
var i=0
var cp=1;
function votelist(cpi){
	document.getElementById('vote_listdiv').innerHTML="";	
	   if(cpi!=null){
		      cp=cpi
		   }
		   var params="cp="+cp;
	   
	$.ajax({
			type : "GET",
			url : "getvoteList.do",	
			  data:params,
			success:function(data){						
				var listdiv=document.getElementById('vote_listdiv');					
				for(var i=0;i<data.votebbslist.length;i++){
					var vl=eval("data.votebbslist["+i+"]");
					var votediv=makevotelist(vl,i);
					listdiv.appendChild(votediv);
				}			
				document.getElementById('page').innerHTML=data.page;
			}
	 });		 
}
function makevotelist(vl,c){			
	var vldiv=document.createElement('tr');
	vldiv.setAttribute('id','vl_'+c);
	vldiv.innerHTML='<table cellspacing="0" border=1><tr><td width="100" align="center">'+vl.study_votebbsref+'</td><td width="400" align="center"><a onclick="votecontentgo('+vl.study_votebbsidx+')">'+vl.study_votebbssubject+'</a></td><td width="100" align="center">'+vl.stu_id+'</td><td width="100" align="center">'+vl.study_votebbswritedate+'</td></tr></table>';	
	vldiv.comment=vl;
	vldiv.className="vl";
	return vldiv;
}

var votenumcheck=0;
function newvote_add(){
	if(votenumcheck==8){
		alert('더 이상 추가 할 수 없습니다.');
		return false;
	}
	var newvotebbsdiv=document.getElementById("newvote");					
		var newvotediv=makenewvoteadd();
		newvotebbsdiv.appendChild(newvotediv);
		votenumcheck++;
		
}	

var i=2;
function makenewvoteadd(){
	var nbdiv=document.createElement('div');
	nbdiv.setAttribute('id','nb'+i);
	var numid="nb"+i;	
	nbdiv.innerHTML='<input class="form-control info" size=60 type="text" id="voteconlist'+i+'" name="voteconlist['+i+'].study_votecontent"><input style="margin-left:20px;"  type="button" class=" btn btn-outline btn-primary" onclick="inputdel('+i+')" value="지우기">';
	i++;
	/* nbdiv.comment=nb; */
	nbdiv.className="nb";
	return nbdiv;
}
function inputdel(b){	
	var inputvalue=eval("document.getElementById('voteconlist"+b+"')");
	inputvalue.value="";	
	var inputdiv=eval("document.getElementById('nb"+b+"')");
	inputdiv.style.display="none";	
}

function votebbs_add(){	
	var vote_sub=document.getElementById('study_votebbssubject').value;
	var vote_con=document.getElementById('study_votebbscontent').value;
	var stu_id=document.getElementById('stu_id').value;
	if(stu_id==""||vote_sub==""||vote_con==""){
		return false;
	}
	var params="vote_sub="+encodeURIComponent(vote_sub)+"&vote_con="+encodeURIComponent(vote_con)+"&stu_id="+encodeURIComponent(stu_id)+"&";
	
	for(j=0;j<i;j++){
	  	var iv=eval("document.getElementById('voteconlist"+j+"')");
	  	var ivalue=iv.value;
		params+="voteconlist["+j+"].study_votecontent="+encodeURIComponent(ivalue); 
		if((j+1)==i){
			
		}else{
			params+="&";	
		} 
	}
	console.log('params : '+params);
	$.ajax({
		type : "GET",
		url : "study_bbsvote_add.do",
		data : params, 
		error:function (e){
			alert(e.responseText);
		},
		success:function(data){	
			if(data.msg!=null){
				alert(data.msg);
				i=0;		
				document.getElementById("newvote").innerHTML="";
				votelist();
			}
		}
	});
	
}
function votecontentgo(votebbsidx){	
		location.href="studybbsvotecontent.do?study_votebbsidx="+votebbsidx;	
}	
</script>
<style>
.form-control,.btn-round {
	margin-top:5px;
}
.btn-outline{
	line-height: 0.7;
}

.pagination{
	margin-top: 10px !important;
	margin-bottom: 10px !important;
}
.btn{
margin-top: 10px !important;
	margin-bottom: 10px !important;	
}

</style>
</head>
<body id="mimin" class="dashboard" onload="votelist()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">

  
  <div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">투표 게시판</h3>      
                  <p class="animated fadeInDown">
	        	study <span class="fa-angle-right fa"></span> votebbs
	    		 </p>         
            </div>
          </div>
</div>
<div class="panel" style="margin-top:20px;width:880px;">
	<div class="panel-body">
		<table class="table table-striped table-bordered dataTable no-footer" id="vote_listdiv">
			<thead>
			<tr>		
			<th class="sorting_asc" width="100" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="150" align="center">생성자</th><th width="150" align="center" class="sorting_asc">날짜</th>
			</tr>
			</thead>
		</table>	   
		 <div style="width:850px;">
			 <table >
		 	<tr>		                                                                                                             
				<th class="sorting_asc" width="700" align="center" id="page"></th><th width="150" align="center" class="sorting_asc"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">투표 게시글 등록</button></th>
			</tr>  
			</table>
	    </div>
	</div>
	</div>  

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">투표 게시판</h4>
        </div>
      <form class="cmxform" id="signupForm">
        <div class="modal-body" style="min-height:480px;"> 
        <input type="hidden" id="stu_id" value="${sessionScope.id }">      
			
			
			
			<div class="form-group form-animate-text" style="width:350px; float: left;height: 66px;margin-right: 10px;">
              <input type="text" class="form-text" id="study_votebbssubject" name="study_votebbssubject" size=33 required>
              <span class="bar"></span>
              <label>제목</label>
         </div> 
			
	
		<div style="width:570px; float: left;">
      		 <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
		    <textarea class="summernote" rows="5" role="100" cols="76"  id="study_votebbscontent" name="study_votebbscontent" style="resize: none;"  required></textarea>   
		 </div>
      </div>	
			
			<div style="float: left;width: 570px;margin-top: 5px;">
			투표 내용<br>
			<input class="form-control success" type="text" id="voteconlist0" name="voteconlist[0].study_votecontent" size=60 required="required"><br>
			<input class="form-control success" type="text" id="voteconlist1" name="voteconlist[1].study_votecontent" size=60 required="required">
			</div>
			<div id="newvote" ></div>			
				<input type="button" class=" btn btn-round btn-primary" onclick="newvote_add()" value="추가하기" style="float: left;">
     		 </div>
        <div class="modal-footer" style="height: 100px;">
         <button class="btn btn-default" onclick="votebbs_add()" >게시글 등록</button>
      
        </div>
      </form>
      </div>
      
    </div>
  </div>
</div>

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
    	  study_filebbssubject: "required",
    	  voteconlist1:  "required",
    	  voteconlist0:  "required",
    	  study_votebbscontent: "required",
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