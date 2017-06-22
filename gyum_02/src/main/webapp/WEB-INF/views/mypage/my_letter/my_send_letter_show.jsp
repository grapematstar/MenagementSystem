<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	outline-style: none;
	outline: none;
}
</style>
</head>
<body>
<br>
<div style="width:170px; height:50px; text-align: center;">
<img src="/gyum_02/img/letter.png" width="30">&nbsp;<b style="font-size: 18px;">LETTER BOX</b>
</div>
<table class="table table-hover">
	<tr>
		<td>받는이</td>
		<td>${letter.letter_sendee }</td>
		<td>보낸날짜</td>
		<td>${letter.letter_senddate }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3" style="text-align:left;">${letter.letter_subject }</td>
	</tr>
	<tr>
		<td colspan="4"><pre style="text-align: left; border: none;">${letter.letter_content }</pre></td>
	</tr>
	<tfoot>
		<tr>
			<td style="text-align:left;" colspan="4"><a href="my_send_letterList.do">목록</a></td>
		</tr>
	</tfoot>
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
</html>