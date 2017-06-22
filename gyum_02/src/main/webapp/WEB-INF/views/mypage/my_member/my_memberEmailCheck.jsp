<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- stylesheet -->
<!-- start: Css -->
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/simple-line-icons.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/mediaelementplayer.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/icheck/skins/flat/red.css" />
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
function check(){
	var form = document.authenform;
	var authNum = ${authNum};
	
	if(!form.authnum.value){
		alert("인증번호를 입력하세요.");
		return false;
	}
	if(form.authnum.value!=authNum){
		alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요.");
		form.authnum.value="";
		return false;
	}
	if(form.authnum.value==authNum){
		alert("인증완료");
		opener.document.getElementById("label_email").innerHTML="인증완료";
		
		self.close();
	}
}
</script>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
		<div id="content">
			<div class="panel box-shadow-none content-header">
				<div class="panel-body">
					<div class="col-md-12">
						<h2 class="animated fadeInLeft">이메일 인증</h2>
						<p class="animated fadeInDown">인증번호 7자리를 입력해주세요.</p>
					</div>
				</div>
			</div>
			<div class="col-md-12 top-20 padding-0">
				<div class="col-md-12">
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
	<form method="post" name="authenform" onSubmit="return check();">
		<table class="table table-striped table-bordered" width="100%"
									cellspacing="0">
			<tr>
				<th align="center">인증 번호</th>
			</tr>
			<tr>
				<td align="center"><input type="text" name="authnum"></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" class="btn btn-info" value="Submit"></td>
			</tr>
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
</body>
</html>