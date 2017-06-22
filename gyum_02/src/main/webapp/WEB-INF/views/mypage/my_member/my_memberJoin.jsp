<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- stylesheet -->
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/mediaelementplayer.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<style type="text/css">
.panel-body{
	top: 300;
    right: 600;
}
table{
	margin-left: 525px;
	margin-top: 260px;
}
body{
	background-color: white;
}
</style>
</head>

<body>
<%@include file="/header.jsp" %>
<div class="panel box-v1">
                                      <div class="panel-heading bg-white border-none">
                                        <div class="col-md-6 col-sm-6 col-xs-6 text-left padding-0">
                                          <h4 class="text-left">Visit</h4>
                                        </div>
                                        </div>
                                        </div>
                                        


<table class="panel-body" width="300">
	<tr>
		<td colspan="3" align="center"><h2>회원 가입 목록</h2></td>
	</tr>
	<tr>
		<td class="col-md-6">
			<input type="button" class=" btn btn-round btn-primary" value="student" onclick="javascript:location.href='my_memberstudent.do'">
		</td>
		<td class="col-md-6">
			<input type="button" class=" btn btn-round btn-primary" value="parent" onclick="javascript:location.href='my_memberparent.do'">
		</td>
		<td class="col-md-6">
			<input type="button" class=" btn btn-round btn-primary" value="teacher" onclick="javascript:location.href='my_memberteacher.do'">
		</td>
	</tr>		
</table>
</body>
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
</html>