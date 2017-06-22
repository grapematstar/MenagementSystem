<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
var stu_id;
//리스트내역 가져와주는 ajax
var cp=1;
function filebbslist(cpi){
	
	document.getElementById("filelist_div").innerHTML="";
	   if(cpi!=null){
		      cp=cpi
		   }
		   var params="cp="+cp;
	$.ajax({
		type:"GET",url:"study_filebbsList.do",
		  data:params,
		success:function(data){
			var filelist_div=document.getElementById("filelist_div");
			for(var i=0; i<data.list.length; i++){
				var fl=eval("data.list["+i+"]");
				var new_filelist_div=makefilelist(fl,i);
				filelist_div.appendChild(new_filelist_div);
			}
			document.getElementById('page').innerHTML=data.page;
		}
	})
}
//가져온 내역 화면에 출력해주는 함수
function makefilelist(fl,i){
	var new_div=document.createElement("tr");
	new_div.setAttribute("id","fl_"+i);
	new_div.innerHTML='<table cellspacing="0" border=1><tr><td width="100" align="center">'+fl.study_filebbsidx+'</td>'+
						'<td width="400" align="center"><a onclick="filebbscontent('+fl.study_filebbsidx+')">'+fl.study_filebbssubject+'</a></td><td width="100" align="center">'+fl.stu_id+'</td><td width="150" align="center">'+fl.study_filebbswritedate+'</td></tr></table>';
	return new_div;
}
//파일업로드 버튼함수
function fileupload(){
	var s_f_filename=document.getElementById("s_f_filename").value;
	if(s_f_filename!=null){
		document.getElementById("filename").innerHTML=s_f_filename;
	}
}
//글 내용보기
function filebbscontent(study_filebbsidx){
	location.href="study_filebbsContent.do?study_filebbsidx="+study_filebbsidx;
}
</script>
<style>
.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control{
	background-color: #f9f9f9;
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

<body id="mimin" class="dashboard" onload="filebbslist()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">
  
  <div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">자료 게시판</h3>      
                  <p class="animated fadeInDown">
	        	study <span class="fa-angle-right fa"></span> databbs
	    		 </p>         
            </div>
          </div>
	</div>


<div class="panel" style="margin-top:20px;width:880px;">
	<div class="panel-body">
		<table class="table table-striped table-bordered dataTable no-footer" id="filelist_div">
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

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
         <div class="modal-content">
        	 <div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
         		 <h4 class="modal-title">자료 게시판</h4>
        	</div>
        	
        
        	
        	<form class="cmxform" id="signupForm"  name="fileUploadMulti" action="study_filebbs.do" method="post" enctype="multipart/form-data">
			<div class="modal-body" style="height: 350px;"> 
			
			<input type="hidden" id="stu_id" name="stu_id" value="${sessionScope.id }">		
			
		
			
			
          <div class="form-group form-animate-text" style="width:350px; float: left;height: 66px;margin-right: 10px;">
              <input type="text" class="form-text" id="study_filebbssubject" name="study_filebbssubject" size=33 required>
              <span class="bar"></span>
              <label>제목</label>
         </div> 
			
			
			<div class="input-group fileupload-v1" style="width: 200px;">
                           <input id="s_f_filename"  class="fileupload-v1-file hidden"  type="file" name="upload" multiple="multiple" >
                            <input type="text" class="form-control fileupload-v1-path" placeholder="File Path..." disabled>
                            <span class="input-group-btn">
                              <button class="btn fileupload-v1-btn" type="button"><i class="fa fa-folder"></i> 파일 선택</button>
                            </span>
                          </div>
			
			
		
				<div style="width:570px; float: left;">
	       		 <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
				    <textarea class="summernote" rows="5" role="100" cols="76"  id="study_filebbscontent" name="study_filebbscontent" style="resize: none;"  required></textarea>   
				 </div>
	       </div>	
		</div>
			<div class="modal-footer">
        	  <button class="btn btn-default" >게시글 등록</button>
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
    	  s_f_filename:  "required",
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