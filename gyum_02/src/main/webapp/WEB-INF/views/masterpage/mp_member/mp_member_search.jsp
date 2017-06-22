<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 조회</title>
 <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/handsontable.full.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->
  <link rel="shortcut icon" href="asset/img/logomi.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
/*검색할 대상 셀렉트박스 눌렀을 때*/
function whowho(){
   var who=document.getElementById("who").value;
   if(who=="student"){
      document.getElementById("name").placeholder="회원 명 입력";
      document.getElementById("subjectDiv").style.display="inherit";
      subsub();
   }else if(who=="teacher"){
      document.getElementById("name").placeholder="회원 명 입력";
      document.getElementById("subjectDiv").style.display="inherit";
      subsub();
   }else if(who=="parent"){
      document.getElementById("name").placeholder="자녀 명 입력";
      document.getElementById("subjectDiv").style.display="none";
      document.getElementById("classDiv").style.display="none";
   }else if(who=="noone"){
      alert('경고 : 대상을 선택해주세요!');
      return false;
   }
}
/*과목 셀렉트박스 눌렀을 때*/
function subsub(){
   var subject_num=$("#subject_num option:selected").val();
   if(subject_num==0){
      document.getElementById("classDiv").style.display="none";
   }else{
      document.getElementById("classDiv").style.display="inherit";
   }
   $.ajax({
      type:"get",url:"mp_member_search_subsub.do",data:"subject_num="+subject_num,
      success:function(data){
         var class_idx=document.getElementById("class_idx");
         class_idx.innerHTML="강의<select id='class_idx'></select>";
         for(var i=0; i<data.classList.length; i++){
            var Class=eval("data.classList["+i+"]");
            var mkClass=mkOption(Class);
            class_idx.appendChild(mkClass);
         }
      }
   })
}
/*강의 셀렉트박스 안에 옵션 만들기*/
function mkOption(Class){
   var mkop=document.createElement("option");
   mkop.setAttribute("value",Class.class_idx);
   mkop.innerHTML=Class.class_subject;
   return mkop;
}
/*검색버튼 눌렀을 때*/
function searching(cp){   
   document.getElementById('listdiv_panel').style.display="inherit";
   var who = document.getElementById("who").value;
   if(who=="noone"){alert("대상을 선택해주세요"); return false;}
   var name = document.getElementById("name").value;
   var class_idx = document.getElementById("class_idx").value;
   if(who=="parent")class_idx=0;
   var subject_num = document.getElementById("subject_num").value;
   var params="";
   if(cp!=null){
      params="who="+who+"&name="+name+"&class_idx="+class_idx+"&subject_num="+subject_num+"&cp="+cp;
   }else{
      params="who="+who+"&name="+name+"&class_idx="+class_idx+"&subject_num="+subject_num+"&cp=1";
   }
   $.ajax({
      type:"get",url:"mp_member_search_searching.do",data:params,
      success:function(data){
         if(data.emptymsg!=null){
            alert(data.emptymsg);
            location.reload();
         }else{
            var listDiv=document.getElementById("listDiv");
            listDiv.innerHTML="<table id='ml' cellspacing='0' class='table-striped table-bordered dataTable no-footer'><tr><td style='width:100px !important;'>번호</td><td style='width:150px !important;'>아이디</td><td style='width:150px !important;'>이름</td><td style='width:150px !important;'>연락처</td><td style='width:200px !important;'>이메일</td><td style='width:150px !important;'>가입날짜</td><td style='width:100px !important;'>변경 </td></tr></table>";
            var check = eval("data.checkmsg");
            
            if(data.list.length>0){
	            for(var i=0; i<data.list.length; i++){
	               var member = eval("data.list["+i+"]"); 
	               var mklist = mkList(member,check);
	               listDiv.appendChild(mklist);
	            }
	            listDiv.innerHTML+="<table id='ml' cellspacing='0' class='table-striped table-bordered dataTable no-footer' ><tr><td colspan=7  style='width:1000px;align:center;'>"+data.page+"</td></tr></table>";
            }else{
            	listDiv.innerHTML+="<table id='ml' cellspacing='0' class='table-striped table-bordered dataTable no-footer' ><tr><td colspan=7  style='width:1000px;align:center;'>검색결과 없음</td></tr></table>";
            	listDiv.innerHTML+="<table id='ml' cellspacing='0' class='table-striped table-bordered dataTable no-footer' ><tr><td colspan=7  style='width:1000px;align:center;'>"+data.page+"</td></tr></table>";
            }
         }
      }
   })
}
/*리스트 만들기*/
function mkList(member,check){
   var memlist = document.createElement("div");
   
   if(check=="student"){
      memlist.innerHTML="<table id='ml' cellspacing='0' class='table-striped table-bordered dataTable no-footer'><tr><td style='width:100px !important;'>"+member.stu_idx+"</td><td style='width:150px !important;'>"+member.stu_id+"</td><td style='width:150px !important;'>"+member.stu_name+"</td><td style='width:150px !important;'>"+member.stu_tel+"</td><td style='width:200px !important;'>"+member.stu_email+"</td><td style='width:150px !important;'>"+member.stu_in_date+"</td><td style='width:100px !important;'><input type='button' class='btn btn-default' style='padding-left:5px;padding-right:5px;font-size: 8px;' value='정보보기' onclick='info_go(\"stu_idx\","+member.stu_idx+")'><!--<input type='button' style='padding-left:5px;padding-right:5x;' class='btn btn-default' value='삭제' onclick='location.href=\"mp_student_delete.do?stu_idx="+member.stu_idx+"\"'>--></td></tr></table>";
   }else if(check=="teacher"){
      memlist.innerHTML="<table id='ml' cellspacing='0' class='table-striped table-bordered dataTable no-footer'><tr><td style='width:100px !important;'>"+member.tea_idx+"</td><td style='width:150px !important;'>"+member.tea_id+"</td><td style='width:150px !important;'>"+member.tea_name+"</td><td style='width:150px !important;'>"+member.tea_tel+"</td><td style='width:200px !important;'>"+member.tea_email+"</td><td style='width:150px !important;'>"+member.tea_in_date+"</td><td style='width:100px !important;'><input type='button' class='btn btn-default' style='padding-left:5px;padding-right:5px;font-size: 8px;' value='정보보기' onclick='info_go(\"tea_idx\","+member.tea_idx+")'><!--<input type='button' style='padding-left:5px;padding-right:5px;' class='btn btn-default' value='삭제' onclick='location.href=\"mp_teacher_delete.do?tea_idx="+member.tea_idx+"\"'>--></td></tr></table>";
   }else if(check=="parent"){
      memlist.innerHTML="<table id='ml' cellspacing='0' class='table-striped table-bordered dataTable no-footer'><tr><td style='width:100px !important;'>"+member.par_idx+"</td><td style='width:150px !important;'>"+member.par_id+"</td><td style='width:150px !important;'>"+member.par_name+"</td><td style='width:150px !important;'>"+member.par_tel+"</td><td style='width:200px !important;'>"+member.par_email+"</td><td style='width:150px !important;'>"+member.par_in_date+"</td><td style='width:100px !important;'><input type='button' class='btn btn-default' style='padding-left:5px;padding-right:5px;font-size: 8px;' value='정보보기' onclick='info_go(\"par_idx\","+member.par_idx+")'><!--<input type='button' style='padding-left:5px;padding-right:5px;' class='btn btn-default' value='삭제' onclick='location.href=\"mp_parent_delete.do?par_idx="+member.par_idx+"\"'>--></td></tr></table>";
   }
   return memlist;
}
function info_go(idxname,idx){
   document.getElementById('who').value="noone";
   document.getElementById('name').value="";
   if(idxname=="par_idx"){
      location.href="mp_parent_info.do?"+idxname+"="+idx;   
   }else if(idxname=="stu_idx"){      
      location.href="mp_student_infogo.do?"+idxname+"="+idx;
   }else{
      location.href="mp_teacher_info.do?"+idxname+"="+idx;
   }
   
}
/*회원추가*/
function memberAdd(num){
   var stu_name=document.f1.stu_name.value;
   var stu_tel=document.f1.stu_tel.value;
   var stu_email=document.f1.stu_email.value;
   var stu_school=document.f1.stu_school.value;
   var stu_grade=document.f1.stu_grade.value;
   var par_idx=document.f1.par_idx.value;
   
   var tea_name=document.f2.tea_name.value;
   var tea_tel=document.f2.tea_tel.value;
   var tea_email=document.f2.tea_email.value;
   var subject_num=document.f2.subject_num.value;
   
   var par_name=document.f3.par_name.value;
   var par_tel=document.f3.par_tel.value;
   var par_email=document.f3.par_email.value;
   
   var params="";
   if(num==1){
      params="stu_name="+stu_name+"&stu_tel="+stu_tel+"&stu_email="+stu_email+"&stu_school="+stu_school+"&stu_grade="+stu_grade+"&par_idx="+par_idx;
   }else if(num==2){
      params="tea_name="+tea_name+"&tea_tel="+tea_tel+"&tea_email="+tea_email+"&subject_num="+subject_num;      
   }else{
      params="par_name="+par_name+"&par_tel="+par_tel+"&par_email="+par_email;
   }
   $.ajax({
      type:"get",url:"mp_member_msg.do",data:params,
      success:function(data){
         alert(data.msg);
         location.reload();
      }
   })
}
</script>
<style>
#ml{
   width: 1000px;
}
td{
   width:90px;
   padding: 3px !important;
}
th{
   width:800px;
   border: 0 !important;
}
.form-group{
   margin-bottom: 0px !important;
}
</style>
</head>
<body id="mimin" class="dashboard" style="width: 1300px;">
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
            회원관리<span class="fa-angle-right fa"></span>회원조회 및 추가
         </p>
      </div>
   </div>
</div>

<div class="panel box-shadow-none content-header" style="margin-top: 20px;">
<div class="panel-body">
   <input type="button" class="btn btn-default" data-toggle='modal' data-target='#myModal' value="수강생추가" >
   <input type="button" class="btn btn-default" data-toggle='modal' data-target='#myModal2' value="강사추가" >
   <input type="button" class="btn btn-default" data-toggle='modal' data-target='#myModal3' value="학부모추가" >

</div></div>
<div class="panel box-shadow-none content-header" style="margin-top: 20px;">
<div class="panel-body">
   <div style="float: left; margin-bottom: 30px;">
      <p>대상</p><select class="form-control" id="who" onchange="whowho()"><option value="noone">-선택-</option><option value="student">수강생</option><option value="teacher">강사</option><option value="parent">학부모</option></select>
      <input type="text" id="name" class="form-control" placeholder="회원 명 입력">&nbsp;&nbsp;<input type="button" class="btn btn-primary" style="margin-bottom:2px;" onclick="searching(1)" value="조회">
   </div>
   <div id="subjectDiv" style="display: none; float: left; padding-left:20px;"><p>과목</p><select class="form-control" id="subject_num" onchange="subsub()"><option value=0>전체</option><option value=1>국어</option><option value=2>영어</option><option value=3>수학</option><option value=4>사회</option><option value=5>과학</option></select></div>
   <div id="classDiv" style="display: none;  float: left; padding-left:20px;"><p>강의</p><select class="form-control" id="class_idx"></select></div>
</div>
</div>
<div class="panel" id="listdiv_panel" style=" float:left; display: block;display: none;">
<div class="panel-body">
<div id="listDiv"></div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">수강생추가</h4>
      </div>
      <form name="f1" class="cmxform" id="signupForm">
      <div class="modal-body"> 
      
      <table cellspacing=0 class='table-striped table-bordered dataTable no-footer'>
      <tr>
         <th>            
                <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px; margin-top: 10px;">
                    <input type="text" class="form-text" id="validate_stu_name" name="stu_name" size=25 required>
                    <span class="bar"></span>
                    <label>이름</label>
               </div> 
         </th>
      </tr>
      <tr>
         <th>
             <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
                    <input type="text" class="form-text mask-phone" id="validate_stu_tel" name="stu_tel" size=25 required>
                    <span class="bar"></span>
                    <label>연락처</label>
               </div> 
         </th>
      </tr>
      <tr>
         <th>
             <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
                    <input type="text" class="form-text" id="validate_stu_email" name="stu_email" size=25 required>
                    <span class="bar"></span>
                    <label>이메일</label>
               </div>            
         </th>
      </tr>
      <tr>
         <th>
            <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
                    <input type="text" class="form-text" id="validate_stu_school" name="stu_school" size=25 required>
                    <span class="bar"></span>
                    <label>학교</label>
               </div>
               <div class="form-group form-animate-text" style=" margin-left:30px; width:100px; float: left;height: 66px;">
                    <input type="text" class="form-text mask-stu_grade" id="validate_stu_grade" name="stu_grade" size=5 required>
                    <span class="bar"></span>
                    <label>학년</label>
               </div>                  
         </th>
      </tr>      
      <tr>
         <th>
            <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
                    <input type="text" class="form-text mask-par_idx" id="validate_par_idx" name="par_idx" size=25 required>
                    <span class="bar"></span>
                    <label>학부모 번호</label>
               </div>
         
         </th>
      </tr>
      </table>
      
      </div>
      <div class="modal-footer">
        <button onclick="memberAdd(1)" class="btn btn-primary" >추가</button>
      </div>
      </form>   
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal2" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">강사추가</h4>
      </div>
         <form name="f2" class="cmxform" id="signupForm">
      <div class="modal-body">    
      <table cellspacing=0 class='table-striped table-bordered dataTable no-footer'>
      <tr>
         <th>            
                <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px; margin-top: 10px;">
                    <input type="text" class="form-text" id="validate_tea_name" name="tea_name" size=25 required>
                    <span class="bar"></span>
                    <label>이름</label>
               </div> 
               <div style="float: left; width: 100px; margin-top: 10px;">
               담당과목 &nbsp; &nbsp; &nbsp;      
            <select name="subject_num">
               <option value="1">국어</option>
               <option value="2">영어</option>
               <option value="3">수학</option>
               <option value="4">사회</option>
               <option value="5">과학</option>
            </select>
            </div>
         </th>
      </tr>
      <tr>
         <th>
             <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
                    <input type="text" class="form-text mask-phone" id="validate_tea_tel" name="tea_tel" size=25 required>
                    <span class="bar"></span>
                    <label>연락처</label>
               </div> 
         </th>
      </tr>
      <tr>
         <th>
             <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
                    <input type="text" class="form-text" id="validate_tea_enail" name="tea_email" size=25 required>
                    <span class="bar"></span>
                    <label>이메일</label>
               </div>            
         </th>
      </tr>
      <tr>
         <th>
         </th>
      </tr>
      </table>
      
      </div>
      <div class="modal-footer">
        <button onclick="memberAdd(2)"  class="btn btn-primary" >추가</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal3" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">학부모추가</h4>
      </div>
    
      <form name="f3"class="cmxform" id="signupForm">
      <div class="modal-body">    
      <table cellspacing=0 class='table-striped table-bordered dataTable no-footer'>
      <tr>
         <th>            
                <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px; margin-top: 10px;">
                    <input type="text" class="form-text" id="validate_stu_name" name="par_name" size=25 required>
                    <span class="bar"></span>
                    <label>이름</label>
               </div> 
         </th>
      </tr>
      <tr>
         <th>
             <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
                    <input type="text" class="form-text mask-phone" id="validate_stu_tel" name="par_tel" size=25 required>
                    <span class="bar"></span>
                    <label>연락처</label>
               </div> 
         </th>
      </tr>
      <tr>
         <th>
             <div class="form-group form-animate-text" style=" margin-left:30px; width:300px; float: left;height: 66px;">
                    <input type="text" class="form-text" id="validate_stu_enail" name="par_email" size=25 required>
                    <span class="bar"></span>
                    <label>이메일</label>
               </div>            
         </th>
      </tr>
      </table>
      
      </div>
      <div class="modal-footer">
        <button onclick="memberAdd(3)"  class="btn btn-primary" >추가</button>
      </div>
      </form>
    </div>
  </div>
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
<script src="asset/js/plugins/jquery.validate.min.js"></script>
<script src="asset/js/plugins/jquery.mask.min.js"></script>
<script src="asset/js/plugins/nouislider.min.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script> 
<script type="text/javascript">
 $(document).ready(function(){      
 
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
        stu_name: "required",
        tea_name: "required",
        stu_tel: {
          required: true,
          minlength: 13          
        },
        validate_tea_tel: {
            required: true,
            minlength: 13          
          },
       stu_email: {
             required: true,
              email: true          
        },
       tea_email: {
           required: true,
            email: true          
       },
       par_email: {
            required: true,
             email: true          
        },
        
      },
      messages: {
       stu_name: "Please enter your stu_name",             
        tea_name: "Please enter your tea_name",
        stu_email: "Please enter a valid email address",
        tea_email: "Please enter a valid email address",        
      }
    });
    $('.mask-phone').mask('000-0000-0000');
    $('.mask-stu_grade').mask('0');
    $('.mask-par_idx').mask('00000000000');
  }); 
 </script>
</body>
</html>