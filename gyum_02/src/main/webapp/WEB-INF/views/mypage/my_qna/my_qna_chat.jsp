<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chat</title>
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
<script type="text/javascript" src="/gyum_02/resources/js/jquery-1.12.1.js"></script>
<script type="text/javascript" src="/gyum_02/resources/js/json2.js"></script>
<script type="text/javascript" src="/gyum_02/resources/js/sockjs-1.0.3.min.js" ></script>
<script type="text/javascript" >
 
    var sock = null;
    var message = {};
    var master = '${master}';
 
    $(document).ready(function(){
    	
    	if(master=='master'){
    		document.getElementById('content').innerHTML += '<input type="button" class="btn btn-danger" onclick="location.href=\'removechat.do\'" value="상담종료">';
    	}
         
        chatSock = new SockJS("http://여기아이피주소:9090/gyum_02/echo-ws");
         
        chatSock.onopen = function() {
             
            message={};
            message.message = "실시간 상담 요청";
            message.type = "all";
            message.to = "all";
            chatSock.send(JSON.stringify(message));
        };
         
        chatSock.onmessage = function(evt) {
            $("#chatMessage").append(evt.data);
            $("#chatMessage").append("<br />");
            $("#chatMessage").scrollTop(99999999);
        };
         
        chatSock.onclose = function() {
            // sock.send("채팅을 종료합니다.");
        }
         
         $("#message").keydown(function (key) {
             if (key.keyCode == 13) {
                $("#sendMessage").click();
             }
          });
         
        $("#sendMessage").click(function() {
            if( $("#message").val() != "") {
                 
                message={};
                message.message = $("#message").val();
                message.type = "all";
                message.to = "all";
                 
                var to = $("#to").val();
                if ( to != "") {
                    message.type = "one";
                    message.to = to;
                }
                 
                chatSock.send(JSON.stringify(message));
                $("#chatMessage").append("나 ▶   " + $("#message").val() + "<br/>");
                $("#chatMessage").scrollTop(99999999);
                 
                $("#message").val("");
            }
        });
    });
</script>
</head>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
<div class="panel" style="width:600px; height:460px;">
    <div id="chatMessage" style="overFlow: auto; max-height: 500px; height: 450px; padding: 10px;"></div>
</div>
    <input type="text" id="message" placeholder="상담 메세지를 입력해주세요"/>
    <input type="hidden" id="to" placeholder="귓속말대상"/>
    <input type="button" id="sendMessage" class="btn btn-primary" value="메시지 전송" />
</div>
</div>
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