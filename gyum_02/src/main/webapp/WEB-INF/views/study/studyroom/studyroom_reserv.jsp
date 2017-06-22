<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

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


<meta name="viewport" content="width=device-width, initial-scale=1">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button{
	-webkit-appearance:none;
	margin:0;
}
</style>
</head>
<script>
var strDateSetting = function (date) {
	var date_str = new Date(date);
	return date_str.getFullYear()+"년 " +
		((date_str.getMonth()+1)>=10?(date_str.getMonth()+1):("0"+(date_str.getMonth()+1)))+
		"월 "+(date_str.getDate()>=10?date_str.getDate():("0"+date_str.getDate()))+"일";
} 

var strDateSetting2 = function (date) {
	var date_str = new Date(date);
	return date_str.getFullYear()+"" +
		((date_str.getMonth()+1)>=10?(date_str.getMonth()+1):("0"+(date_str.getMonth()+1)))+
		""+(date_str.getDate()>=10?date_str.getDate():("0"+date_str.getDate()));
}
var today = new Date();
var H = today.getHours();

function date_get(){
	
	var date_select=document.getElementById('date');
	for(var i=0;i<5;i++){		
		var op=document.createElement('option');
		op.value=strDateSetting2(today);
		op.text=strDateSetting(today);
		date_select.options.add(op);
		today.setDate(today.getDate()+1);		
	}
	var time_div=document.getElementById('time_0');
	for(var j=1;j<14;j++){		
		var studyroom_time_div=make_time_list();
		time_div.appendChild(studyroom_time_div);
	}	
	resergv_get();
	today = new Date();
}
var z=1;
function make_time_list(time_div){
	var timediv=document.createElement('div');
	timediv.setAttribute('id','time_'+z);	
	timediv.innerHTML='<table cellspacing="0" ><tr><td height=50  width="100" align="center"> '+(z+8)+':00 </td></tr></table>';
	z++;
	timediv.comment=time_div;
	timediv.className="time_div";
	return timediv;
}

var y=0;
function resergv_get(){
	document.getElementById('r_1').innerHTML="";
	document.getElementById('r_2').innerHTML="";
	document.getElementById('r_3').innerHTML="";
	document.getElementById('r_4').innerHTML="";
	document.getElementById('r_5').innerHTML="";
	document.getElementById('r_6').innerHTML="";
	document.getElementById('r_7').innerHTML="";
	document.getElementById('r_8').innerHTML="";
	
	var studyroom_reserv_date=document.getElementById("date").value;
	var params="studyroom_reserv_date="+studyroom_reserv_date;
	$.ajax({
		type : "GET",
		url : "studyroom_reserv_list.do",
		data:params,
		success:function(data){
			var rList = new Array("a", "b", "c", "d","e","f","g","h");		
			var rlist_1=document.getElementById('r_1');
			var rlist_2=document.getElementById('r_2');
			var rlist_3=document.getElementById('r_3');
			var rlist_4=document.getElementById('r_4');
			var rlist_5=document.getElementById('r_5');
			var rlist_6=document.getElementById('r_6');
			var rlist_7=document.getElementById('r_7');
			var rlist_8=document.getElementById('r_8');
			var t_hour=8;
			var i=0;
			var t_date=document.getElementById("date").value;
			
			
			for(var k=0;k<104;k++){				
				t_hour++;
				if(t_hour>21){					
					t_hour=9;
				}
				var to_date=strDateSetting2(today);
				var  impossible=0;			
				if(to_date==t_date){
					 impossible=1;
				}
				
				
				var room_check=(parseInt(k/13)+1);
				var room_name=eval("rList["+(room_check-1)+"]");				
				var rlist=eval("data.list["+i+"]");			
				if(i<data.list.length&&rlist.studyroom_reserv_hour==t_hour&&room_name==rlist.studyroom_name){												
						var studyroom_time_div=make_studyroom_list(rlist);
						var rl=eval("rlist_"+room_check);
						rl.appendChild(studyroom_time_div);
						i++;													
				}else{		
					if(impossible==1&&t_hour<(H+1)){
						var empty=make_studyroom_list("예약 불가");
					}else{
						var empty=make_empty(t_hour,room_name);
					}	
						var rl=eval("rlist_"+room_check);
						rl.appendChild(empty);
					
				}
			}
			i=0;					
			
		}
 	});	
}
function make_studyroom_list(rlist){
	var stroomdiv=document.createElement('div');
	stroomdiv.setAttribute('id','time_'+z);	
	stroomdiv.innerHTML='<table cellspacing="0"><tr><td height=50  width="100" align="center" style="color:red"> 예약 불가 </td></tr></table>';
	y++;
	stroomdiv.comment=rlist;
	stroomdiv.className="reserv_div";
	return stroomdiv;
	
}

function make_empty(t_hour,num){
	var stroomdiv=document.createElement('div');
	stroomdiv.setAttribute('id','time_'+t_hour+'_'+num);	
	stroomdiv.innerHTML='<table cellspacing="0" ><tr><td height=50  width="100" align="center"><button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="reserv('+t_hour+',\''+num+'\')">예약하기</button></td></tr></table>';	
	stroomdiv.comment=t_hour+"_"+num;
	stroomdiv.className="reserv_div";
	y++;
	return stroomdiv;
}
var reserv_hour=0;
var reserv_num="";
function reserv(hour,num){
	reserv_hour=hour;
	reserv_num=num;	
}
function reserv_go(){	
	var logincheck="${sessionScope.id}";
	if(logincheck==""){
		alert('로그인이 필요 합니다.');	
		return false;
	}	
	var studyroom_reserv_date=document.getElementById("date").value;
	var studyroom_reserv_hour=reserv_hour;
	var studyroom_name=reserv_num;
	var studyroom_tel=document.getElementById("studyroom_tel").value;
	var studyroom_note=document.getElementById("studyroom_note").value;
	var	studyroom_usetime=document.getElementById("studyroom_usetime").value;
	var params="studyroom_reserv_date="+encodeURIComponent(studyroom_reserv_date)+"&studyroom_reserv_hour="+encodeURIComponent(studyroom_reserv_hour)+"&studyroom_name="+encodeURIComponent(studyroom_name)+"&studyroom_tel="+encodeURIComponent(studyroom_tel)+"&studyroom_note="+encodeURIComponent(studyroom_note)+"&studyroom_usetime="+encodeURIComponent(studyroom_usetime);	
	if(studyroom_tel.substring(0,3)!="010"){	
		alert("전화번호를 정확히 입력하세요");
		return false;	
	}
	$.ajax({
		type : "GET",
		url : "studyroom_reserv.do",
		data : params, 
		error:function (e){
				alert(e.responseText); //요게 뜬거 
			},
		success:function(data){
			if(data.msg!=null){
				alert(data.msg);				
			}		
			document.getElementById('r_1').innerHTML="";
			document.getElementById('r_2').innerHTML="";
			document.getElementById('r_3').innerHTML="";
			document.getElementById('r_4').innerHTML="";
			document.getElementById('r_5').innerHTML="";
			document.getElementById('r_6').innerHTML="";
			document.getElementById('r_7').innerHTML="";
			document.getElementById('r_8').innerHTML="";
			resergv_get();
		}
	});

	}

</script>
<style>
td{
	padding: 0;
}
td,tr{
	width:97px;
	border :1px solid #f4f4f4 !important
}
</style>
<body id="mimin" class="dashboard" onload="date_get()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">

<div class="panel" style="margin-top:20px;width:880px;">
	<div class="panel-body">

<div style="margin: 0px auto;"><select id="date" onchange="resergv_get()"></select>&nbsp;&nbsp;&nbsp; *예약 취소는 마이페이지에서 1시간 전까지만 가능 합니다.</div>
<table>
<tr>
	<td width="100" align="center"></td>
	<td width="100" align="center">4인룸 A</td>
	<td width="100" align="center">4인룸 B</td>
	<td width="100" align="center">4인룸 C</td>
	<td width="100" align="center">4인룸 D</td>
	<td width="100" align="center">6인룸 E</td>
	<td width="100" align="center">6인룸 F</td>
	<td width="100" align="center">8인룸 G</td>
	<td width="100" align="center">8인룸 H</td>
</tr>
<tr>
	<td ><div id="time_0"></div></td>
	<td><div id="r_1"></div></td>
	<td><div id="r_2"></div></td>
	<td><div id="r_3"></div></td>
	<td><div id="r_4"></div></td>
	<td><div id="r_5"></div></td>
	<td><div id="r_6"></div></td>
	<td><div id="r_7"></div></td>
	<td><div id="r_8"></div></td>
</tr>
</table>




  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">스터디룸 예약</h4>
        </div>
       <form name="studyroom" class="cmxform" id="signupForm">
        <div class="modal-body" style="height: 350px;">             
			<div id="reserv_date"></div>				
					
			 <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
	              <input type="text" class="form-text mask-phone" id="studyroom_tel" name="studyroom_tel" size=25 required>
	              <span class="bar"></span>
	              <label>연락처</label>
	         </div> 
			<div style="float: left;width: 100px;margin-left: 30px;">
			사용시간 <select id="studyroom_usetime"><option value=1>1</option><option value=2>2</option><option value=3>3</option><option value=4>4</option></select>시간
			</div>
			<div style="width:570px; float: left;">
	       		 <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
				    <textarea wrap="hard" class="summernote" rows="5" role="100" cols="76"  id="studyroom_note" name="studyroom_note" style="resize: none;" placeholder="전달 사항" required="required">전달 사항 </textarea>   
				 </div>
	       </div>	
			
							
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" onclick="reserv_go()">예약하기</button>
        </div>
      </form>
      </div>      
    </div>
  </div>
  
  </div></div></div></div>
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
 <script type="text/javascript">
 $(document).ready(function(){	   
          $('.summernote').summernote({
            height: 150
          });
 
    $("#signupForm").validate({
      errorElement: "em",
      errorPlacement: function(error, element) {
        $(element.parent("div").addClass("form-animate-error"));
        error.appendTo(element.parent("div"));
      },
      success: function(label) {
        $(label.parent("div").removeClass("form-animate-error"));
      },
      rules: {       
        studyroom_tel: {
          required: true,
          minlength: 11          
        },
        studyroom_note: "required",     
        
      },
      messages: {
    	  studyroom_tel: "Please enter your tel"        
      }
    });
    $('.mask-phone').mask('00000000000');
 });
 </script>
</body>
</html>