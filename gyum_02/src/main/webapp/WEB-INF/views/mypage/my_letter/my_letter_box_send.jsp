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
<script>
var noreadlist = new Array();
window.onload = function(){
	if('${msg}'!=''){
		window.alert('${msg}');
		self.close();
		return;
	}	
}
function showLetter(letter_idx){
	location.href='my_send_letter_show_content.do?letter_idx='+letter_idx;
}
</script>
</head>
<body>
<br>
<div style="width:170px; height:50px; text-align: center;">
<a href="open_letter_box.do"><img src="/gyum_02/img/letter.png" width="30"></a>&nbsp;<b style="font-size: 18px;">LETTER BOX</b>
</div>
<table class="table table-hover">
<c:forEach var="list" items="${letterList }">
	<tr>
		<td style="text-align:left;">&nbsp;&nbsp;<a id="${list.letter_idx }" onclick="showLetter('${list.letter_idx}')">${list.letter_subject }</a></td>
		<td>${list.letter_sendee }</td>
		<td>${list.letter_senddate }</td>
	</tr>
</c:forEach>
	<tfoot>
		<tr>
			<td colspan="3">${page }</td>
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