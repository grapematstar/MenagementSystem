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
    <title>자유게시판</title>
 
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
		#f_b_subject{
			width: 86%;
    		height: 30px;
    	   	margin-right: 2%;
    		float: right;
		}
		#subdiv{
			width: 60%;
		    margin-right: 16%;
		    float: right;
		}
		#writediv{
			width: 60%;
    		margin-right: 16%;
    		float: right;
    		padding-bottom: 20px;
		}
		.col-md-12.col-sm-12.col-xs-12 {
		    margin-top: 10px;
		}
		span#je {
		    width: 6%;
		    float: left;
		    margin-top: 1%;
		    margin-left: 1%;
		}
	</style>
</head>
<body id="mimin" class="dashboard" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">
	<section id="whole">
		<section id="inwhole">
			<form name="freebbsWrite" id="freebbsWrite" action="freebbsWrite.do" method="post">
				<span id="subdiv">
					<input type="hidden" id="f_b_writer" name="f_b_writer" value="${id}">
					<input type="hidden" id="f_b_reply" name="f_b_reply" value=0>
					<input type="hidden" id="f_b_sunbun" name="f_b_sunbun" value=0>
					<span id="je">제목 | </span><span id="jetext"><input type="text" id="f_b_subject" name="f_b_subject"></span>
				</span>
				<div id="writediv" class="col-md-12 col-sm-12 col-xs-12 mail-reply">
	            	<textarea class="summernote" name="f_b_content" id="f_b_content"></textarea>
	                <div class="col-md-12 col-sm-12 col-xs-12 ">
	                	<input type="button" value="취소" class="btn btn-default pull-right" onclick="backtotheindex()"/>
	                    <input type="submit" value="저장" class="btn btn-danger pull-right"/>
	                </div>
	            </div>
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
     		location.href="freebbsList.do"
     	}
     </script>
</html>