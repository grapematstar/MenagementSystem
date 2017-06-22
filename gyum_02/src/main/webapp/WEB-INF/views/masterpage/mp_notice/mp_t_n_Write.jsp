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
    <title>공지작성</title>
 
    <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css"/>

	<link href="asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="asset/img/logomi.png">

<style>
	#inwhole{
		width: 90%;
		float: left;
	}
	form#t_nWriteform {
	    width: 85%;
	    float: right;
	}
	div#btngroup {
	    margin-left: 20px;
	    margin-right: 20px;
	    margin-bottom: 20px;
	}
	#t_n_subject{
		width: 640px;
	    height: 30px;
	    float: right;
	    margin-right: 2%;
	}
	#subdiv{
		 padding-left: 20px;
	}
	#writediv{
		width: 700px;
		margin-top: -9px;
		padding-bottom: 20px;
	}
	.col-md-12.col-sm-12.col-xs-12 {
	    margin-top: 10px;
	}
</style>
</head>
<body id="mimin" class="dashboard" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
<div id="content" class="article-v1">
	<section id="whole">
		<section id="inwhole">
			<form name="t_nWriteform" id="t_nWriteform" action="t_n_Write.do" method="post">
				<div id="nobtn">
					<div id="btngroup" class="btn-group" role="group">
				    	<button class="btn  dropdown-toggle" aria-expanded="true" aria-haspopup="true" type="button" data-toggle="dropdown">
				    		강사공지
				    		<span class="fa fa-angle-down"></span>
				    	</button>
				      	<ul class="dropdown-menu">
				        	<li><a href="noticeWrite.do?sel=notice_">일반공지</a></li>
				        	<li><a href="noticeWrite.do?sel=t_n_">강사공지</a></li>
				      	</ul>
				    </div>
			    </div>
				<input type="hidden" id="t_n_idx" value="${dto.t_n_idx}">
				<table id="tab">
					<tr>
						<td align="center"><span>제목</span></td>
						<td><input type="text" id="t_n_subject" name="t_n_subject" value="${dto.t_n_subject}"></td>
					</tr>
					<tr>
						<td colspan="2" id="edittool">
							<span id="writediv" class="col-md-12 col-sm-12 col-xs-12 mail-reply">
				            	<textarea class="summernote" name="t_n_content" id="t_n_content">${dto.t_n_content}</textarea>
				                <span class="col-md-12 col-sm-12 col-xs-12 ">
				                	<input type="button" value="취소" class="btn btn-default pull-right" onclick="backtotheindex()"/>
				                    <input id="okbtn" type="submit" value="저장" class="btn btn-danger pull-right"/>
				                </span>
				            </span>
			            </td>
					</tr>
				</table>
			</form>
		</section>
	</section>
	</div>
	</div>
</body>
<!-- start: Javascript -->
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/jquery.ui.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
   
    
    <!-- plugins -->
    <script src="asset/js/plugins/icheck.min.js"></script>
    <script src="asset/js/plugins/summernote.min.js"></script>
    <script src="asset/js/plugins/moment.min.js"></script>
    <script src="asset/js/plugins/jquery.nicescroll.js"></script>


    <!-- custom -->
   <script src="asset/js/main.js"></script>
   <script type="text/javascript">
        $(document).ready(function(){
            $('input').iCheck({
              checkboxClass: 'icheckbox_flat-red',
              radioClass: 'iradio_flat-red'
            });

             $('.summernote').summernote({
                height: 300
              });
                 $('.mail-wrapper').find('.mail-left').css('height', $('.mail-wrapper').innerHeight());

        });
     </script>
     <script>
     	function backtotheindex() {
     		location.href="t_n_go.do"
     	}
     	
     </script>
     
     <script>
     if(${!empty dto.t_n_idx}){
 		var a = document.getElementById('t_nWriteform');
 		document.all.t_n_idx.setAttribute('name', 't_n_idx')
 		a.setAttribute('action', 't_n_Update.do')
 		var b = document.getElementById('okbtn');
 		console.log(b.value);
 		b.setAttribute('value', '수정');
 		console.log(b.value);
 		var s1 = document.all.nobtn;
 		s1.innerHTML = '<a href="t_nDel.do?idx=${dto.t_n_idx}&sel=t_n_">삭제하기</a>';
 	}
     </script>
</html>