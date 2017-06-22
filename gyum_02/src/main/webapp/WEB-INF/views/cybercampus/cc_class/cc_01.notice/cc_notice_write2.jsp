<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="description" content="Miminium Admin Template v.1">
<meta name="author" content="Isna Nur Azis">
<meta name="keyword" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script>
<script type="text/javascript">
</script>
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/mediaelementplayer.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<title>사이버캠퍼스</title>
</head>
<body id="mimin" class="dashboard">
<jsp:include page="/header.jsp"/>
<section>
	<div class="container-fluid mimin-wrapper">
		<jsp:include page="/sidemenu.jsp" />
		<div id="content" style="width:96%;">
		<div class="panel">
			<div class="panel-body">
				<div class="col-md-12 col-sm-12" style="float:none;">
					<h3 class="animated fadeInLeft">${sessionScope.class_subject}</h3>
					<p class="animated fadeInDown">
						<a href="cc_gotoCurrentClass.do">사이버캠퍼스</a> <span class="fa-angle-right fa"></span> ${sessionScope.classStatus} <span class="fa-angle-right fa"></span> 
						<a href="cc_gotoClassMainRe.do">${sessionScope.class_subject}</a><hr>
					</p>
				</div>
				<div class="col-md-12 col-sm-12">
				<ul class="nav navbar-nav" style="float:none;">
				<c:if test="${sessionScope.usergrade=='teacher'||sessionScope.usergrade=='master'}">
								<li><a href="cc_gotoTeacherNoticeList.do">강사공지사항</a></li>
							</c:if>
                   <li><a href="cc_gotoNoticeList.do" class="btn btn-outline btn-primary">공지사항</a></li>
                   <li><a href="cc_gotoInfoPlanClass.do" class="">강의정보</a></li>
                   <li><a href="cc_gotoAttendClass.do" class="">출석/성적</a></li>
                   <li><a href="cc_gotoFreeBBSList.do" class="">커뮤니티</a></li>
                   <li><a href="cc_gotoHomeworkList.do" class="">학습자료</a></li>
                   <li><a href="cc_gotoQnAList.do" class="">질의응답</a></li>
                   <li><a href="cc_gotoEpilogueClass.do" class="">강의후기</a></li>
                   <li><a href="cc_gotoMyClassMate.do" class="">수강생보기</a></li>
                </ul></div>
					<div class="col-md-12 col-sm-12">
						<div class="panel">
						<div class="panel-body">
							<div class="col-md-12" style="float:none;">
							<div class="responsive-table">
							       <form name="cc_submitNoticeWrite" action="cc_submitNoticeWrite.do" method="POST">
									<table class="table" style="width:100%;text-align:inherit;">
										<thead>
											<tr>
												<th>
												<div class="col-md-2">글쓴이</div>
												<div class="col-md-3" align="left"><span name="c_n_writer">${sessionScope.id}</span></div>
												</th>
											</tr>
											<tr>
												<th>
												<div class="col-md-2">제목</div>
												<div class="col-md-5" align="left"><input type="text" name="c_n_subject" size="50" required="required"></div>
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="2">
												<div id="writediv" class="col-md-12 col-sm-12 col-xs-12 mail-reply">
                  <textarea class="summernote" name="c_n_content" id="c_n_content"></textarea>
                   <div class="col-md-12 col-sm-12 col-xs-12 ">
                      <input type="button" value="취소" class="btn btn-default pull-right" onclick="backtotheindex()"/>
                       <input type="submit" value="저장" class="btn btn-danger pull-right"/>
                   </div>
               </div>
									</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="">
													<input type="file" name="c_n_files">
													<input type="submit" value="작성">
													<input type="button" value="닫기">
												</td>
											</tr>
										</tfoot>
									</table>
									</form>
									
							</div>
							</div>
						</div>
					</div>
         		</div>
         		</div>
			</div>
		</div>
					<div id="right-menu">
				<div id="right-menu-user" class="tab-pane fade in active">
					<div class="user col-md-12" tabindex="5003"
						style="overflow: hidden; outline: none;">
						<div class="col-md-1"></div>
						<div class="col-md-11" id="right-side-body"> </div>
					</div>
				</div>
			</div>
	</div>
</section>
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
           location.history(-1);
        }
     </script>
</html>