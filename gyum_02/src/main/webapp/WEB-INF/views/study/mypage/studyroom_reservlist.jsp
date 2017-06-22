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
  <title>스터디룸 예약내역</title>

   <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>

      <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css"/>

   <link href="asset/css/style.css" rel="stylesheet">
   <!-- end: Css -->

   <link rel="shortcut icon" href="asset/img/logomi.png">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
   <link rel="stylesheet" type="text/css" href="codebase/fonts/font_roboto/roboto.css"/>
   <link rel="stylesheet" type="text/css" href="codebase/dhtmlxcalendar.css"/>
   <script src="codebase/dhtmlxcalendar.js"></script>
<script>

var strDateSetting2 = function (date) {
   var date_str = new Date(date);
   return date_str.getFullYear()+"" +
      ((date_str.getMonth()+1)>=10?(date_str.getMonth()+1):("0"+(date_str.getMonth()+1)))+
      ""+(date_str.getDate()>=10?date_str.getDate():("0"+date_str.getDate()));
}
var today = new Date();
var H = today.getHours();
var M = today.getMinutes();
var today_s=strDateSetting2(today);
function reserv_list(){   
   $.ajax({
      type : "GET",
      url : "study_room_reserv_list.do",
   
      success:function(data){
         var listdiv=document.getElementById('studyroom_list');               
         for(var i=0;i<data.list.length;i++){
            var sr=eval("data.list["+i+"]");
            var srdiv=makelist(sr);
            listdiv.appendChild(srdiv);
         }
      }
   });
}
var i=0;
function makelist(sr){   
   var sldiv=document.createElement('tr');
   sldiv.setAttribute('id','sr_'+i);   

   var reserv_h=sr.studyroom_reserv_hour*100;
   var now_h=H*100 + Number(M);
  
   if(Number(reserv_h - now_h)>=100 && sr.studyroom_reserv_date>=today_s){
      sldiv.innerHTML='<td width=350 >'+sr.studyroom_note+'</td><td width="150" align="center">'+sr.studyroom_reserv_date+'</td><td width="100" align="center">'+sr.studyroom_reserv_hour+'시 예약 </a></td><td width="100" align="center">'+sr.studyroom_usetime+'시간</td><td width="100" align="center">'+sr.studyroom_writedate+'</td><td width="100" align="center"><a style="color: skyblue;" onclick="reserv_cancel('+sr.studyroom_idx+')">예약 취소 </a></td>';
   }else{
      sldiv.innerHTML='<td width=350 >'+sr.studyroom_note+'</td><td width="150" align="center">'+sr.studyroom_reserv_date+'</td><td width="100" align="center">'+sr.studyroom_reserv_hour+'시 예약 </a></td><td width="100" align="center">'+sr.studyroom_usetime+'시간</td><td width="100" align="center">'+sr.studyroom_writedate+'</td><td width="100" align="center"><p style="color: grey;">불가능</p></td>';
   }
  
   i++;
   sldiv.comment=sr
   sldiv.className="sr";
   return sldiv;
}
function reserv_cancel(index){
   var params="studyroom_idx="+index;
   $.ajax({
      type : "GET",
      url : "studyroom_reserv_cancel.do",
      data:params,
      success:function(data){
         if(data.msg!=null){
            alert(data.msg);
            location.reload();
         }
         document.getElement("studyroom_list").innerHTML="";
         reserv_list();
      }
   });
}
</script>
</head>
<body  id="mimin" class="dashboard" onload="reserv_list()"style="width:1200px;">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">


<div class="panel" style="width:880px;">	
	<div class="panel-body">
		<div class="col-md-12">
                <h3 class="animated fadeInLeft">스터디룸 </h3>
                <p class="animated fadeInDown">
                  	스터디룸 예약 내역
                </p>
            </div>
</div></div>


<div class="panel" style="width:880px; margin-top: 20px;">	
	<div class="panel-body" >

<table cellspacing="0" ><tr><td width=350 >비 고</td><td width="150" align="center">예약한 날짜</td><td width="100" align="center">예약한 시간</a></td><td width="100" align="center">사용 시간</td><td width="100" align="center">예약한 시간</td><td width="100" align="center"> 취소 여부</td></tr><tr><td colspan=6 style="padding: 0px !important;"><div style="max-height:500px; overflow: auto;"><table id="studyroom_list" ></table></div></td></tr></table>

</div></div>
</div>
</div>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>

<script src="asset/js/plugins/summernote.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>

<script src="asset/js/plugins/jquery.mask.min.js"></script>

<script src="asset/js/plugins/nouislider.min.js"></script>
<!-- custom -->
 <script src="asset/js/main.js"></script>

</body>
</html>