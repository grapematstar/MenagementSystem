<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta charset="utf-8">
	<meta name="description" content="Miminium Admin Template v.1">
	<meta name="author" content="Isna Nur Azis">
	<meta name="keyword" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Miminium</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="codebase/fonts/font_roboto/roboto.css" />
<link rel="stylesheet" type="text/css"
	href="codebase/dhtmlxcalendar.css" />
<script src="codebase/dhtmlxcalendar.js"></script>

 <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/jquery.steps.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      <style>
.btn ripple-infinite btn-outline btn-primary {
	float: right;
}

#calendar {
	border: 1px solid #dfdfdf;
	font-family: Roboto, Arial, Helvetica;
	font-size: 14px;
	color: #404040;
}
#par_id{
	float: left;
}
#par_pwd_q{
	float: left;
}
#pwd1{
	float : left;
}
#par_q{
	margin-left : 150px;
}
#pwd2{
	float : left;
	margin-left: 30px;
}
#pwd_qna_write{
	margin-right: 800px;
}
</style>
</head>
<body id="mimin" class="dashboard" onload="doOnLoad()" style="width: 1200px;">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
			<div class="panel ">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">회원 정보 수정</h2>
						<p class="animated fadeInDown">회원 정보 수정하는 곳입니다.</p>
					</div>
				</div>
			</div>
			<div class="col-md-12 top-20 padding-0">
		
					<div class="panel">
						<div class="panel-body">
							<div class="col-md-12 padding-0" style="padding-bottom: 20px;">
								<div class="col-md-6" style="padding-left: 10px;"></div>
								<div class="col-md-6">
									<div class="col-lg-12">
										<div class="input-group">
											<div class="input-group-btn"></div>
											<!-- /btn-group -->
										</div>
										<!-- /input-group -->
									</div>
									<!-- /.col-lg-6 -->
								</div>
							</div>
							<div class="responsive-table">
<c:set var="dto" value="${dto}"></c:set>

<form id="example1" name="parent_write" action="par_Update.do">
                            <h3>Account</h3>
                            <fieldset>
                                <legend>Account Information</legend>
                                <label for="surname-2">이름</label>
                                <input id="surname-2" name="par_name" type="text" class="required" value="${dto.par_name }">
                                <label for="password-2" id="par_pwd_q">비밀 번호</label>
                                <label for="password-2" id="par_q">비밀 번호 확인</label><br>
                                <input type="hidden" name="par_id" value="${dto.par_id }">
                                <input id="pwd1" name="par_pwd" type="password" class="required" value="${dto.par_pwd }">                          
                                <input id="pwd2" name="par_pwd" type="password" onkeyup="compare()" class="required" value="${dto.par_pwd }">
                                <label id="pwdCheckText"></label><br>
                                <label for="userName-2" id="pwd_qna_write">질문</label><br>
								<select name="pwd_q_idx" id="pwd_q_idx" class="required">
								<script>
								window.onload=function(){
								document.getElementById('pwd_q_idx').value='${dto.pwd_q_idx}';
								}
								</script>
								<option value="0">비밀번호 찾기 질문</option>
								<option value="1">너의 이름은?</option>
								<option value="2">너의 보물은?</option>
								<option value="3">너의 나이는?</option>
								</select><br>
								<label for="userName-2">비밀번호 찾기 답</label>
								<input name="par_pwd_a" type="text" class="required" value="${dto.par_pwd_a }">       
                            </fieldset>
                            
                            <h3>Profile</h3>
                            <fieldset>
                                <legend>Profile Information</legend>   
                                <label for="email-2">Email</label>
                                <input id="email-2" name="par_email" type="text" class="required email" value="${dto.par_email }">
                               	<label for="tel-2">전화번호</label>
                                <input type="number" name="par_tel" value="${dto.par_tel }">
                            </fieldset>
                            <h3>Warning</h3>
                            <fieldset>
                                <legend>해당 정보로 수정 하시겠습니까?</legend>
                         
                                <p>수정하실려면 다음을 눌러주세요.</p>
                            </fieldset>
                         
                            <h3>Finish</h3>
                            <fieldset>
                                <legend>Terms and Conditions</legend>
                         
                                <input id="acceptTerms-2" name="acceptTerms" type="checkbox" class="required"> <label for="acceptTerms-2">I agree with the Terms and Conditions.</label>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
          </div>
          </div>
          </div>
        
<!-- end: Content -->
				<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>


<!-- plugins -->
<script src="asset/js/plugins/jquery.steps.min.js"></script>
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="asset/js/main.js"></script>
<script type="text/javascript">
  $(document).ready(function(){



    var form = $("#example1").show();
     
    form.steps({
        headerTag: "h3",
        bodyTag: "fieldset",
        transitionEffect: "slideLeft",
        onStepChanging: function (event, currentIndex, newIndex)
        {
            // Allways allow previous action even if the current form is not valid!
            if (currentIndex > newIndex)
            {
                return true;
            }
            // Forbid next action on "Warning" step if the user is to young
            if (newIndex === 3 && Number($("#age-2").val()) < 18)
            {
                return false;
            }
            // Needed in some cases if the user went back (clean up)
            if (currentIndex < newIndex)
            {
                // To remove error styles
                form.find(".body:eq(" + newIndex + ") label.error").remove();
                form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
            }
            form.validate().settings.ignore = ":disabled,:hidden";
            return form.valid();
        },
        onStepChanged: function (event, currentIndex, priorIndex)
        {
            // Used to skip the "Warning" step if the user is old enough.
            if (currentIndex === 2 && Number($("#age-2").val()) >= 18)
            {
                form.steps("next");
            }
            // Used to skip the "Warning" step if the user is old enough and wants to the previous step.
            if (currentIndex === 2 && priorIndex === 3)
            {
                form.steps("previous");
            }
        },
        onFinishing: function (event, currentIndex)
        {
            form.validate().settings.ignore = ":disabled";
            return form.valid();
        },
        onFinished: function (event, currentIndex)
        {

        	var formID=document.getElementById('example1');
        	
        	formID.submit();
        }
    }).validate({
        errorPlacement: function errorPlacement(error, element) { element.before(error); },
        rules: {
            confirm: {
                equalTo: "#password-2"
            }
        }
    });




  });
</script>
<!-- end: Javascript -->
</body>
</html>