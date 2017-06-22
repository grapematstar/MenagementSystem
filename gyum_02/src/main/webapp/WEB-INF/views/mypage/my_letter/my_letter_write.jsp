<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
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
<style>
textarea{
	width: 100%;
}
input[type='text']{
	width: 100%;
	height: 20px;
}
</style>
</head>
<body>
<br>
<div style="width:170px; height:50px; text-align: center;">
<img src="/gyum_02/img/letter.png" width="30">&nbsp;<b style="font-size: 18px;">LETTER BOX</b>
</div>
<form action="my_letter_send.do">
<table class="table table-hover">
	<tr>
		<td width="70">받는이</td>
		<td style="text-align:left;">${sendee }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="letter_subject" maxlength="80"></td>
	</tr>
	<tr>
		<td colspan="2"><textarea class="form-control" name="letter_content" maxlength="1500"></textarea></td>
	</tr>
	<tfoot>
		<tr>
			<td style="text-align:left;"><a href="open_letter_box.do" class="btn btn-default">목록</a></td>
			<td style="text-align:right;"><input type="submit" class="btn btn-primary" value="보내기"></td>
		</tr>
	</tfoot>
</table>
<input type="hidden" name="letter_sendee" value="${sendee }">
</form>
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
</html>