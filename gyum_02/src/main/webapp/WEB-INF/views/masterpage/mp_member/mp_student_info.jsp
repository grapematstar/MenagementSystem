<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생정보</title>
</head>
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/handsontable.full.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <link rel="shortcut icon" href="asset/img/logomi.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  #suganglist_div,#sub_class_list_div{
  	overflow: auto;  	
  	position: relative;
  }
  td{
  	padding: 3px !important;
  }
  </style>
<script>
var stu_idx=${stu_idx};
var class_idx2=-1;
var sugang_idx=-1;
var subindex=0;
function getinfo(){
	var params="stu_idx="+${stu_idx};
	$.ajax({
		type : "GET",
		url : "mp_student_info.do",	
		data: params,
		success:function(data){						
					document.getElementById("infoname").innerHTML="<h3 style='margin-left:360px;'>"+data.studentInfo.stu_name+" 회원정보 </h3> <input style='position: relative; bottom:30px; left:630px;' type='button' class='btn btn-default' onclick='stu_info_modi()' value='개인 정보 수정'>";
					var infodiv=document.getElementById('info2');		
					var si=data.studentInfo;
					var stuinfodiv=makestuinfolist(si);
					infodiv.appendChild(stuinfodiv);
					subindex=1;
					sublist(1);					
		}
	});		
}

function makestuinfolist(si){
	var sdiv=document.createElement('div');
	sdiv.setAttribute('id','stuinfo');	
	sdiv.innerHTML='<table width=750 ><tr><td align="center" width=108" height=33>학생번호</td><td align="center" width=158">'+si.stu_idx+'</td><td align="center" width=108">ID</td><td align="center" width=159>'+si.stu_id+'</td><td align="center" width=108">가입날짜</td><td align="center" width=133">'+si.stu_in_date+'</td></tr>'+
					'<tr><td align="center" width=100" height=33>연락처</td><td align="center" width=100"><input type="text" id="stu_tel" size=18 value="'+si.stu_tel+'"></td><td align="center" width=100">생년월일</td><td align="center" width=100">'+si.stu_birth+'</td><td align="center" width=100">학교</td><td align="center" width=100"><input type="text" id="stu_school" size=10 value="'+si.stu_school+'"></td></tr>'+
					'<tr><td align="center" width=100" height=33>e-mail</td><td align="center" width=100"><input type="text" id="stu_email" size=18 value="'+si.stu_email+'"></td><td align="center" width=100">학부모 번호 </td><td align="center" width=100"><input type="text" id="par_idx" size=10 value="'+si.par_idx+'"></td><td align="center" width=100">학년</td><td align="center" width=100"><input type="text" id="stu_grade" size=3 value="'+si.stu_grade+'">학년</td></tr></table>';
	return sdiv;						
}
var check=0;
function sublist(index){
	check=0;
	subindex=index;
	var subdiv=document.getElementById('suganglist_div');
	subdiv.innerHTML="";
	var params="stu_idx="+stu_idx+"&subject_num="+index;
	$.ajax({
		type : "GET",
		url : "mp_student_class_info.do",	
		data: params,
		success:function(data){	
			for(var i=0;i<data.classList.length;i++){
				var si=eval("data.classList["+i+"]");
				var suganglistdiv=makesuganglist(si);
				subdiv.appendChild(suganglistdiv);				
			}	
			classlist(index);
		}
	});		
}
function makesuganglist(si){
	var sldiv=document.createElement('div');
	sldiv.setAttribute('id','sugang_list');
	sldiv.innerHTML='<table><tr><td align="center"  width="150"><a id="su_'+check+'" onclick="getsugangidx('+si.class_idx+','+check+')">'+si.class_subject+'</a></td><td align="center"  width="100">'+si.class_day+' / '+si.class_time+'교시 </td><td align="center" width="150">'+si.class_startdate+'~'+si.class_enddate+'</td></tr></table>';
	check++;
	return sldiv;
}
var che=0;
function classlist(index){
	che=0;
	var sub_div=document.getElementById('sub_class_list_div');
	sub_div.innerHTML="";
	var params="subject_num="+index;
	$.ajax({
		type : "GET",
		url : "mp_academy_class_info.do",	
		data: params,
		success:function(data){					
			for(var i=0;i<data.subClass.length;i++){
				var si=eval("data.subClass["+i+"]");
				var sublistdiv=makesublist(si);				
				sub_div.appendChild(sublistdiv);				
			}
		}
	});		
}
function makesublist(si){
	
	var subldiv=document.createElement('div');
	subldiv.setAttribute('id','sub_class_list');
	subldiv.innerHTML='<a id="cl_'+che+'" onclick="getclassidx('+si.class_idx+','+che+')">'+si.class_subject+'</a>';	
	che++;
	return subldiv;
}
function getclassidx(index,ch){
	class_idx2=index;
	eval("document.getElementById('cl_"+ch+"')").style.color="red";	
	for(var k=0;k<che;k++){
		if(k!=ch){ 
			eval("document.getElementById('cl_"+k+"')").style.color="#58666e";
		}
	}
	for(var k=0;k<check;k++){
		eval("document.getElementById('su_"+k+"')").style.color="#58666e";
		
	}
}
function getsugangidx(index,ch){
	sugang_idx=index;
	eval("document.getElementById('su_"+ch+"')").style.color="red";
	for(var k=0;k<check;k++){
		if(k!=ch){ 
			eval("document.getElementById('su_"+k+"')").style.color="#58666e";
		}
	}
	for(var k=0;k<che;k++){
		eval("document.getElementById('cl_"+k+"')").style.color="#58666e";
	}
}
function sugangadd(){
	if(class_idx2>-1){
		var params="class_idx="+class_idx2+"&stu_idx="+stu_idx;
		$.ajax({
			type : "GET",
			url : "mp_student_class_add.do",	
			data: params,
			success:function(data){			
				if(data.msg!=null){
					alert(data.msg);
				}else{
					var sub_div=document.getElementById('suganglist_div');
					var si=data.classadd;
					var suganglistdiv=makesuganglist(si);
					sub_div.appendChild(suganglistdiv);								
				}
				class_idx2=-1;
			}
		});	
	}
}
function sugangdel(){
	if(sugang_idx>-1){
		var params="class_idx="+sugang_idx+"&stu_idx="+stu_idx;
		$.ajax({
			type : "GET",
			url : "mp_student_class_del.do",	
			data: params,
			success:function(data){		
				sublist(subindex);
				sugang_idx=-1;
			}
		});	
	}
}
function stu_info_modi(){
	var stu_tel=document.getElementById("stu_tel").value;
	var stu_email=document.getElementById("stu_email").value;
	var par_idx=document.getElementById("par_idx").value;
	var stu_school=document.getElementById("stu_school").value;
	var stu_grade=document.getElementById("stu_grade").value;	
	var params="stu_idx="+stu_idx+"&stu_tel="+encodeURIComponent(stu_tel)+"&stu_email="+encodeURIComponent(stu_email)+"&par_idx="+par_idx+"&stu_school="+encodeURIComponent(stu_school)+"&stu_grade="+stu_grade;
	$.ajax({
		type : "GET",
		url : "mp_student_info_update.do",	
		data: params,
		success:function(data){		
			alert('수정완료!!!!!!');
		}
	});	
}
</script>
<body onload="getinfo()" id="mimin" class="dashboard">
<%@include file="/header.jsp" %>  
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
<div id="content" class="article-v1">
<section>
<div class="panel box-shadow-none content-header">
	<div class="panel-body">
		<div class="col-md-12">
			<h3 class="animated fadeInLeft">회원관리</h3>
			<p class="animated fadeInDown">
				회원관리 <span class="fa-angle-right fa"></span>회원조회 <span class="fa-angle-right fa"></span>수강생정보 및 수정
			</p>
		</div>
	</div>
</div>
<hr>

<div id="infoname" style="heigth:30px;width: 900px;"></div>

<div id="info1" style="width: 122px; overflow:auto;float: left;border:1px solid gray; ">
<table width="120" cellspacing=0>
<tr><td style="width: 120px;" align="center"><div style=" width: 114px;"><img style="height: 118px; width: 114px;" class="img-responsive" alt="프로필" src="asset/img/ldh.JPG" ></div></td></tr>
</table></div>
<div id="info2" style="float: left; ">

</div>



<div id="sugang"  style="float:left; height: 333px;">
<table cellspacing=0>
<tr><td colspan="4" align="center">수강내역 리스트</td></tr>
<tr>	
	<td align="center" width="50">과목</td><td align="center" width="150">강의명 </td><td align="center" width="100">강의 시간</td><td align="center" width="150">수강기간</td>
</tr>
<tr><td><a onclick="sublist(1)">국어</a></td> <td colspan="3" rowspan="6" ><div id="suganglist_div" style="height: 280px;"></div> </td></tr>
<tr><td><a onclick="sublist(2)">영어</a></td></tr>
<tr><td><a onclick="sublist(3)">수학</a></td></tr>
<tr><td><a onclick="sublist(4)">사회</a></td></tr>
<tr><td><a onclick="sublist(5)">과학</a></td></tr>
<tr><td height="168"></td></tr>
</table>
</div>
<div id="menu" style="float: left; width:100px; height: 333px; text-align: center;">
<table cellspacing=0  style=" width:100px;"><tr><td style="padding-top:130px ;padding-left: 10px;"  height= 166 >
<input type="button" class="btn btn-primary" onclick="sugangadd()" value="추가"></td></tr>
<tr><td height= 166 style="padding-left: 10px;"><input type="button" class="btn btn-primary" onclick="sugangdel()" value="제거"></td></tr>
</table>
</div>

<div  style="float: left; text-align: center;width:316px; height: 333px;">
<table cellspacing=0><tr><td align="center" width="316">강의 리스트</td></tr>
<tr><td height="303">
<div id="sub_class_list_div" style="height:303px;"></div>
</td></tr>
</table>
</div>
</section>
</div>
</div>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script> 
</body>
</html>


