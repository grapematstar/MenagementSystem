<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
	margin-left : 145px;
}
#pwd2{
	float : left;
	margin-left: 30px;
}
#pwd_qna_write{
	margin-right: 300px;
}
#email-3{
	float: left;
}
#email-4{
 	float: left;
}
</style>
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
function compare(){
	var pwd = document.getElementById("pwd1").value;
	var pwdCheck = document.getElementById("pwd2").value;
	if(pwdCheck == ""){
		document.getElementById("pwdCheckText").innerHTML == "";
	}else if(pwd != pwdCheck){
		document.getElementById("pwdCheckText").innerHTML = "<b><font color=gray size=2pt>불일치</font></b>"
	}else{
		document.getElementById("pwdCheckText").innerHTML = "<b><font color=gray size=2pt>일치</font></b>"
	}
}
function idCheck(){
	var params = new Object();
	params.par_id=document.getElementById("par_id").value;
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
    if( !idReg.test( $("input[name=par_id]").val() ) ) {
        alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
        return;
    }
	$.ajax({
		type:"GET",
		url:"idCheck2.do",
		data:params,
		success:function(data){
			alert(data.msg);
			if(data.par_id==""){
				$('#par_id').val(data.par_id);
			}
		}
	});
}

var pwd_q_idx = document.getElementById("pwd_q_idx");
var val = pwd_q_idx.options[pwd_q_idx.selectedIndex].value;

</script>
<script>
function emailCheck(){
	var email = document.getElementById("email-3").value;
	window.open("emailAuth.do?email="+email,"new","width=500,height=500");
}
</script>
</head>
<body id="mimin" class="dashboard" onload="doOnLoad()">
<%@include file="/header.jsp" %>	
	 	 <div id="content">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading"></div>
                    <div class="panel-body">
                        <form id="example1" name="stu_write" action="parentWrite.do">
                            <h3>Account</h3>
                            <fieldset>
                                <legend>Account Information</legend>
                                <label for="userName-2">아이디</label><br>
                                <input id="par_id" name="par_id" type="text" class="required" value="${par_id}">
                                <input type="button" value="중복 확인" onclick="idCheck()"><br>
                                <label for="surname-2">이름</label>
                                <input id="surname-2" name="par_name" type="text" class="required">
                                <label for="password-2" id="par_pwd_q">비밀 번호</label>
                                <label for="password-2" id="par_q">비밀 번호 확인</label><br>
                                <input id="pwd1" name="par_pwd" type="password" class="required">                          
                                <input id="pwd2" name="par_pwd" type="password" onkeyup="compare()" class="required">
                                <label id="pwdCheckText"></label><br>    
                            </fieldset>                       
                            <h3>Profile</h3>
                            <fieldset>
                                <legend>Profile Information</legend>   
                                <label for="userName-2" id="pwd_qna_write">질문</label><br>
								<select name="pwd_q_idx" id="pwd_q_idx" class="required">
								<option value="0">비밀번호 찾기 질문</option>
								<option value="1">너의 이름은?</option>
								<option value="2">너의 보물은?</option>
								<option value="3">너의 나이는?</option>
								</select><br>
								<label for="userName-2">비밀번호 찾기 답</label>
								<input name="par_pwd_a" type="text" class="required">     
                                <label for="email-2">Email</label>
                                <input id="email-3" name="par_email" type="text" class="required email"><input type="button" id="email-4" class=" btn btn-raised btn-primary" value="이메일 인증" onclick="emailCheck()"><label id="label_email"></label><br/><br/>
                               	<label for="tel-2">전화번호</label>
                                <input type="number" name="par_tel">
                            </fieldset>
                            <h3>Warning</h3>
                            <fieldset>
                                <legend>해당 정보로 가입 하시겠습니까?</legend>
                         
                                <p>가입하실려면 다음을 눌러주세요.</p>
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
            if (newIndex === 2 && $("#label_email").text() != '인증완료')
            {
            	alert("email 인증을 하셔야 넘어갑니다.")
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
            if (currentIndex === 2 && $("#label_email").text() == '인증완료')
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
		</form>
	</div>
	<script>
var myCalendar;      
function doOnLoad(){     
   myCalendar1 = new dhtmlXCalendarObject("cal_1");
   myCalendar1.attachEvent("onShow", function(){
      
   });      
   myCalendar1.attachEvent("onHide", function(){});   
}
</script>
</body>
</html>