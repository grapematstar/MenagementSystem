<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
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

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>	
	var i=0
	var cp=1;	
function studybbslist(cpi){
	   if(cpi!=null){
		      cp=cpi
		   }
		   var params="cp="+cp;
	 $.ajax({
			type : "GET",
			url : "studybbsList.do",
			data:params,
			success:function(data){						
				var bbsname=document.getElementById('bbsnamediv');
				bbsname.innerHTML="<h4>"+data.study_bbsname+"</h4>";				
				var listdiv=document.getElementById('studybbs_list');					
				for(var i=0;i<data.study_bbslist.length;i++){
					var sbl=eval("data.study_bbslist["+i+"]");
					var studydiv=makestudybbslist(sbl);
					listdiv.appendChild(studydiv);						
				}				
				if(data.study_bbslist.length==0){
					var nolistdiv=document.createElement('tr');
					nolistdiv.innerHTML="<td colspan=4>등록된 글이 없습니다.</td>";
					listdiv.appendChild(nolistdiv);
				}
				document.getElementById('page').innerHTML=data.page;
			}
	 });	

}
	
	
function makestudybbslist(sbl){	
	var sbldiv=document.createElement('tr');
	sbldiv.setAttribute('id','sb'+i);
	sbldiv.innerHTML='<td width="100" align="center">'+sbl.study_bbssunbun+'</td><td width="450" align="center"><a onclick="href=\'study_bbscontentgo.do?study_bbsidx='+sbl.study_bbsidx+'\'">'+sbl.study_bbssubject+'</a></td><td width="150" align="center">'+sbl.stu_name+'</td><td width="150" align="center">'+sbl.study_bbswritedate+'</td>';
	i++;
	sbldiv.comment=sbl;
	sbldiv.className="sbl";
	return sbldiv;
}		
function studybbs_add(){
	var study_subject=document.studybbsadd.studybbs_subject.value;
	if(study_subject==""){
		return false;
	}
	var stu_id=document.studybbsadd.stu_id.value;		
	var study_content=document.studybbsadd.studybbs_content.value;
	var params="stu_id="+encodeURIComponent(stu_id)+"&"+"study_bbssubject="+encodeURIComponent(study_subject)+"&"+"study_bbscontent="+encodeURIComponent(study_content);
	alert(params)
	$.ajax({
		type : "GET",
		url : "study_bbsadd.do",
		data : params, 
		error:function (e){
			alert(e.responseText);
		},
		success:function(data){		
			i=0;		
			document.studybbsadd.studybbs_subject.value="";
			document.studybbsadd.studybbs_content.value="";
			document.getElementById("studybbs_list").innerHTML="";
			studybbslist();
		}
	});
	
}	
</script>
<style>
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
<body id="mimin" class="dashboard" onload="studybbslist()" style="width:1200px;" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">


<div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft"><div id="bbsnamediv"></div></h3>    
                 <p class="animated fadeInDown">
                  	study <span class="fa-angle-right fa"></span> bbs
                </p>           
            </div>
          </div>
    </div>  


<div class="panel" style="margin-top:20px;width:880px;">
	<div class="panel-body">
		<table class="table table-striped table-bordered dataTable no-footer" id="studybbs_list">
			<thead>
			<tr>		
			<th class="sorting_asc" width="100" align="center">번호</th><th class="sorting_asc" width="450" align="center">제목</th><th class="sorting_asc" width="150" align="center">생성자</th><th width="150" align="center" class="sorting_asc">날짜</th>
			</tr>
			</thead>
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
 
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">게시판 등록</h4>
        </div>
      
       <form class="cmxform" id="signupForm" method="get" action="" name="studybbsadd">

        <div class="modal-body" style="height: 450px;"> 
       
       
        <input type="hidden" name="stu_id" value="${sessionScope.id }">      
			
			<div class="form-group form-animate-text" style="width:300px; float: left;height: 66px;">
              <input type="text" class="form-text" id="studybbs_subject" name="studybbs_subject" size=27 required>
              <span class="bar"></span>
              <label>제 목 </label>
         </div>    
						
         <div style="width:570px; float: left;">
               <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
              <textarea class="summernote" rows="10" role="100" cols="76"  name="studybbs_content" style="resize: none;">스터디 소개</textarea>   
         	  </div>
          </div>   			
		
        </div>
        <div class="modal-footer">
          <button class="btn btn-default" onclick="studybbs_add()">등록</button>
        </div>
      </form>
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
            height: 250
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
    	  studybbs_subject: "required",
    	  studybbs_content: "required",
    
      },
      messages: {
    	  studybbs_subject: "Please enter study_name",     
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