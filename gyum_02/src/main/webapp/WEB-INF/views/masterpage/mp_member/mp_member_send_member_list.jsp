<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>academy</title>

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

     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
   <link rel="stylesheet" type="text/css" href="codebase/fonts/font_roboto/roboto.css"/>
   <link rel="stylesheet" type="text/css" href="codebase/dhtmlxcalendar.css"/>
   <script src="codebase/dhtmlxcalendar.js"></script>


<script>
/*쪽지쓰는곳으로가는 버튼*/
function choice(){
   var memId=document.getElementsByName("ch");
   var leng=memId.length;
   var checked=0;
   var hihi=document.getElementById("hihi");
   for(var i=0; i<leng; i++){
      console.log(memId[i].checked);
      if(memId[i].checked == true){
         hihi.innerHTML += "<input type='hidden' name='letterdto["+checked+"].letter_sendee' value='"+memId[i].value+"'>";
         checked+=1;
      }
   }
    if(checked == 0){
      alert("선택하신 정보가 없습니다.");
      location.reload();
   }
}
/*과목별*/
function sub(cp,values){
   var s_num=values;
   $.ajax({
      type:"GET",url:"mp_member_letter_list_with_sub.do",data:"s_num="+s_num+"&cp="+cp+"&functionName=sub(",
      success:function(data){
         var memlist=document.getElementById("memlist");
         memlist.innerHTML="<tr align='right'><td colspan=3 style='text-align:right;'><input type='button' class='btn btn-default' data-toggle='modal' data-target='#myModal' value='선택완료' onclick='choice()'></td></tr><tr><th>선택</th><th>회원ID</th><th>회원이름</th></tr>";
   //      for(var i=0; i<data.slist.length; i++){
   //         var student=eval("data.slist["+i+"]");
   //         var makeS=makeslist(student);
   //         memlist.appendChild(makeS);
   //      }
   //      for(var i=0; i<data.tlist.length; i++){
   //         var teacher=eval("data.tlist["+i+"]");
   //         var makeT=maketlist(teacher);
   //         memlist.appendChild(makeT);
   //      }
         for(var i=0; i<data.resultList.length; i++){
            var member=eval("data.resultList["+i+"]");
            
            if(member.stu_id != null){
               var makeS=makeslist(member);
               memlist.appendChild(makeS);
            }
            if(member.tea_id != null){
               var makeT=maketlist(member);
               memlist.appendChild(makeT);
            }
         }
         if(data.msg!=null){
            alert(data.msg);
         }else{
            var tmptr=document.createElement('tr');
            memlist.appendChild(tmptr);
            
            var tmptd=document.createElement('td');   
            tmptd.setAttribute("colspan","3");
            tmptd.setAttribute("align","center");
            tmptd.innerHTML=data.page;
            tmptr.appendChild(tmptd);
            
            s++;
         }
      }
   })   
}
/*강의별*/
function showsel(values){
   var selcheck=values;
   for(var i=1;i<6;i++){
      var sub=eval('document.getElementById("sel'+i+'")');      
      
      if(i==selcheck){            
         sub.style.display="inherit";
      }else{
         sub.style.display="none";
      }
   }   
   clas(1,selcheck);
}
function clas(cp,values){
   var s_num=values;
   var index=0;
   var classIdx=0;

   index = document.getElementById("sel"+s_num).selectedIndex;
   classIdx = document.getElementById("sel"+s_num).options[index].value;
   $.ajax({
      type:"GET",url:"mp_member_letter_list_with_class.do",data:"c_idx="+classIdx+"&cp="+cp+"&functionName=clas(",
      success:function(data){
         var memlist=document.getElementById("memlist");
         memlist.innerHTML="<tr align='right'><td colspan=3 style='text-align:right;'><input type='button' class='btn btn-default' data-toggle='modal' data-target='#myModal' value='선택완료' onclick='choice()'></td></tr><tr><th>선택</th><th>회원ID</th><th>회원이름</th></tr>";
   //      for(var i=0; i<data.slist.length; i++){
   //         var student=eval("data.slist["+i+"]");
   //         var makeS=makeslist(student);
   //         memlist.appendChild(makeS);
   //      }
   //      for(var i=0; i<data.tlist.length; i++){
   //         var teacher=eval("data.tlist["+i+"]");
   //         var makeT=maketlist(teacher);
   //         memlist.appendChild(makeT);
   //      }
         for(var i=0; i<data.resultList.length; i++){
            var member=eval("data.resultList["+i+"]");
            
            if(member.stu_id != null){
               var makeS=makeslist(member);
               memlist.appendChild(makeS);
            }
            if(member.tea_id != null){
               var makeT=maketlist(member);
               memlist.appendChild(makeT);
            }
         }
         if(data.msg!=null){
            alert(data.msg);
         }else{
            var tmptr=document.createElement('tr');
            memlist.appendChild(tmptr);
            
            var tmptd=document.createElement('td');   
            tmptd.setAttribute("colspan","3");
            tmptd.setAttribute("align","center");
            tmptd.innerHTML=data.page;
            tmptr.appendChild(tmptd);
            
            s++;
         }
         
      }
   })
}
/*회원전체*/
function allmem(cp){
   $.ajax({
      type:"GET",url:"mp_member_letter_list.do",data:"key=all&cp="+cp+"&functionName=allmem(",
      success:function(data){
         var memlist=document.getElementById("memlist");
         memlist.innerHTML="<tr align='right'><td colspan=3 style='text-align:right;'><input type='button' class='btn btn-default' data-toggle='modal' data-target='#myModal' value='선택완료' onclick='choice()'></td></tr><tr><th>선택</th><th>회원ID</th><th>회원이름</th></tr>";   
   //      for(var i=0; i<data.slist.length; i++){
   //         var student=eval("data.slist["+i+"]");
   //         var makeS=makeslist(student);
   //         memlist.appendChild(makeS);
   //      }
   //      for(var i=0; i<data.tlist.length; i++){
   //         var teacher=eval("data.tlist["+i+"]");
   //         var makeT=maketlist(teacher);
   //         memlist.appendChild(makeT);
   //      }
         for(var i=0; i<data.resultList.length; i++){
            var member=eval("data.resultList["+i+"]");
            
            if(member.stu_id != null){
               var makeS=makeslist(member);
               memlist.appendChild(makeS);
            }
            if(member.tea_id != null){
               var makeT=maketlist(member);
               memlist.appendChild(makeT);
            }
         }
         if(data.msg!=null){
            alert(data.msg);
         }else{
            var tmptr=document.createElement('tr');
            memlist.appendChild(tmptr);
            
            var tmptd=document.createElement('td');   
            tmptd.setAttribute("colspan","3");
            tmptd.setAttribute("align","center");
            tmptd.innerHTML=data.page;
            tmptr.appendChild(tmptd);
            
            s++;
         }
      }
   })
}
/*강사전체*/
function teamem(cp){

   $.ajax({
      type:"GET",url:"mp_member_letter_list.do",data:"key=tea&cp="+cp+"&functionName=teamem(",
      success:function(data){
         var memlist=document.getElementById("memlist");
         memlist.innerHTML="<tr align='right'><td colspan=3 style='text-align:right;'><input type='button' class='btn btn-default' data-toggle='modal' data-target='#myModal' value='선택완료' onclick='choice()'></td></tr><tr><th>선택</th><th>회원ID</th><th>회원이름</th></tr>";
   //      for(var i=0; i<data.tlist.length; i++){
   //         var teacher=eval("data.tlist["+i+"]");
   //         var makeT=maketlist(teacher);
   //         memlist.appendChild(makeT);
   //      }
         for(var i=0; i<data.resultList.length; i++){
            var member=eval("data.resultList["+i+"]");
            var makeT=maketlist(member);
            memlist.appendChild(makeT);
         }
         if(data.msg!=null){
            alert(data.msg);
         }else{
            var tmptr=document.createElement('tr');
            memlist.appendChild(tmptr);
            
            var tmptd=document.createElement('td');   
            tmptd.setAttribute("colspan","3");
            tmptd.setAttribute("align","center");
            tmptd.innerHTML=data.page;
            tmptr.appendChild(tmptd);
            
            s++;
         }
      }
   })
}
/*수강생전체*/
function stumem(cp){

   $.ajax({
      type:"GET",url:"mp_member_letter_list.do",data:"key=stu&cp="+cp+"&functionName=stumem(",
      success:function(data){
         var memlist=document.getElementById("memlist");
         memlist.innerHTML="<tr><td colspan=3 style='text-align:right;'><input type='button' class='btn btn-default' data-toggle='modal' data-target='#myModal' value='선택완료' onclick='choice()'></td></tr><tr><th>선택</th><th>회원ID</th><th>회원이름</th></tr>";
   //      for(var i=0; i<data.slist.length; i++){
   //         var student=eval("data.slist["+i+"]");
   //         var makeS=makeslist(student);
   //         memlist.appendChild(makeS);
   //      }
         for(var i=0; i<data.resultList.length; i++){
            var member=eval("data.resultList["+i+"]");
            var makeS=makeslist(member);
            memlist.appendChild(makeS);
         }
         if(data.msg!=null){
            alert(data.msg);
         }else{
            var tmptr=document.createElement('tr');
            memlist.appendChild(tmptr);
            
            var tmptd=document.createElement('td');   
            tmptd.setAttribute("colspan","3");
            tmptd.setAttribute("align","center");
            tmptd.innerHTML=data.page;
            tmptr.appendChild(tmptd);
            
            s++;
         }
      }
   })
}
var s=0;
/*수강생리스트만들기*/
function makeslist(student){
   var stulist=document.createElement('tr');
   s++;
   stulist.innerHTML="<td><input type='checkbox' name='ch' value='"+student.stu_id+"'></td><td>"+student.stu_id+"</td><td>"+student.stu_name+"</td>";
   return stulist;
}
/*강사리스트만들기*/
function maketlist(teacher){
   var tealist=document.createElement('tr');
   s++;
   tealist.innerHTML="<td><input type='checkbox' name='ch' value='"+teacher.tea_id+"'></td><td>"+teacher.tea_id+"</td><td>"+teacher.tea_name+"</td>";
   return tealist;
}




var idxlist = new Array();
function letterList(cp){
   var param="";
   if(cp!=null){
      param="cp="+cp;
   }else{
      param="cp=1";
   }
   $.ajax({
      type:"get",url:"mp_letter_list_of_master_onload.do",data:param,
      success:function(data){
         var list_div=document.getElementById("list_div");
         idxlist = data.idxlist;
         list_div.innerHTML='<table cellspacing="0" width="950" class="table-striped table-bordered dataTable no-footer"><tr><th width=400 style="text-align:center;">제목</th><th width=350  style="text-align:center;">수신자</th><th width=150 style="text-align:center;">발송일</th><th width=100 style="text-align:center;">수신확인</th></tr></table>';
         if(data.letterList==null){list_div.innerHTML='보낸쪽지가 없습니다.';}else{
            for(var i=0; i<data.letterList.length; i++){
               var letter=eval('data.letterList['+i+']');
               var mkletter=mkmk(letter);
               list_div.appendChild(mkletter);
            }
            list_div.innerHTML+="<table cellspacing='0' width='950' class='table-striped table-bordered dataTable no-footer' ><tr><td align='center' width=530 colspan=4>"+data.page+"</td></tr></table>";
         }
      }
   })
}
function mkmk(letter){
   var mklet=document.createElement('div');
   var readcheck="읽음";
   var readdate=letter.letter_readdate;
   var senddate=letter.letter_senddate;
 
   if(readdate.substring(0,4)<senddate.substring(0,4)){
      readcheck='읽지않음';
   }

   mklet.innerHTML='<table cellspacing="0" width="950" class="table-striped table-bordered dataTable no-footer"><tr align="center" class="odd"><td text-align="center" width=400><a onclick="goLetterContent('+letter.letter_idx+')" data-toggle="modal" data-target="#myModal2">'+letter.letter_subject+'</a></td><td width=350>'+letter.letter_sendee+'</td><td width=150>'+letter.letter_senddate+'</td><td width=100>'+readcheck+'</td></tr></table>';
   return mklet;
}
function goLetterContent(idx){
   $.ajax({
      type:"get",url:"mp_letter_content.do",data:"letter_idx="+idx,
      success:function(data){
         var bodycon=document.getElementById("bodycon");
         bodycon.innerHTML='제목 :'+data.content.letter_subject+'<br><pre style="font-size: 15px; color: #359cf9;overflow:scroll;height: 300px;">'+data.content.letter_content+'</pre>';
      }
   })
}

</script>
<style>
   li{
      line-height: 55px;
      font-size: 15px;
   }
</style>
</head>
<body id="mimin" class="dashboard" style="width:1200px;">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
<div id="content" class="article-v1">
<section>
<div class="panel box-shadow-none content-header">
   <div class="panel-body">
      <div class="col-md-12">
         <h3 class="animated fadeInLeft">공지관리</h3>
         <p class="animated fadeInDown">
            공지관리 <span class="fa-angle-right fa"></span>쪽지발송 및 내역
         </p>
      </div>
   </div>
</div>
<hr>
   <div role="tabpanel" class="tab-pane fade active in" id="tabs-area-demo" aria-labelledby="tabs1">
      <div class="col-md-12">
         <div class="col-md-6">
            <div class="col-md-12 tabs-area">
                     <ul id="tabs-demo4" class="nav nav-tabs nav-tabs-v3" role="tablist">
                      <li role="presentation" class="active">
                        <a href="#tabs-demo4-area1" id="tabs-demo4-1" role="tab" data-toggle="tab" aria-expanded="true">쪽지보내기</a>
                      </li>
                      <li role="presentation" class="">
                        <a href="#tabs-demo4-area2" onclick="letterList(1)" role="tab" id="tabs-demo4-2" data-toggle="tab" aria-expanded="false">쪽지함</a>
                      </li>
                    </ul>
                    <div id="tabsDemo4Content" class="tab-content tab-content-v3">
                      <div role="tabpanel" class="tab-pane fade active in" id="tabs-demo4-area1" aria-labelledby="tabs-demo4-area1">
                            <form name="letter_form" action="mp_member_sending_notice_letter.do">
                        <div id='hihi'></div>
                        <table cellspacing="0" class="table-striped table-bordered dataTable no-footer">
                           <tr>
                              <td>
                                 <table width=250 height=500>
                                 <tr><td>                                 
                  
                                       <ul class="nav nav-list">                                       
                                       <li class="active ripple"><a class="tree-toggle nav-header" onclick="allmem(1)">
                                          회원전체 </a>
                                       </li>
                                       <li class="ripple"><a class="tree-toggle nav-header" onclick="teamem(1)"> 
                                          강사전체 </a>
                                       </li>
                                       <li class="ripple"><a class="tree-toggle nav-header" onclick="stumem(1)"> 
                                          수강생전체</a>
                                       </li>
                                       <li class="ripple"><a class="tree-toggle nav-header"> 
                                          과목별 <span class="fa-angle-right fa right-arrow text-right"></span>
                                                </a>
                                                   <ul class="nav nav-list tree">
                                                      <li><a onclick="sub(1,1)">국어</a></li>
                                                      <li><a onclick="sub(1,2)">영어</a></li>
                                                      <li><a onclick="sub(1,3)">수학</a></li>
                                                      <li><a onclick="sub(1,4)">사회</a></li>
                                                      <li><a onclick="sub(1,5)">과학</a></li>
                                                   </ul>
                                       </li>
                                       <li class="ripple"><a class="tree-toggle nav-header">
                                          강의별 <span class="fa-angle-right fa right-arrow text-right"></span>
                                                </a>
                                                   <ul class="nav nav-list tree">
                                                      <li><a onclick="showsel(1)">국어</a>
                                                         <select id="sel1" onchange="clas(1,1)" style="display:none;">
                                                            <c:forEach var="l" items="${list}">
                                                            <c:if test="${l.subject_num == 1}">
                                                               <option value="${l.class_idx}">${l.class_subject}</option>
                                                            </c:if>
                                                            </c:forEach>
                                                         </select>                                                      
                                                      </li>
                                                      <li><a onclick="showsel(2)">영어</a>
                                                         <select id="sel2" onchange="clas(1,2)" style="display:none;">
                                                            <c:forEach var="l" items="${list}">
                                                            <c:if test="${l.subject_num == 2}">
                                                               <option value="${l.class_idx}">${l.class_subject}</option>
                                                            </c:if>
                                                            </c:forEach>
                                                         </select>
                                                      </li>
                                                      <li><a onclick="showsel(3)">수학</a>
                                                         <select id="sel3" onchange="clas(1,3)" style="display:none;">
                                                            <c:forEach var="l" items="${list}">
                                                            <c:if test="${l.subject_num == 3}">
                                                               <option value="${l.class_idx}">${l.class_subject}</option>
                                                            </c:if>
                                                            </c:forEach>
                                                         </select>
                                                      </li>
                                                      <li><a onclick="showsel(4)">사회</a>
                                                         <select id="sel4" onchange="clas(1,4)" style="display:none;">
                                                            <c:forEach var="l" items="${list}">
                                                            <c:if test="${l.subject_num == 4}">
                                                               <option value="${l.class_idx}">${l.class_subject}</option>
                                                            </c:if>
                                                            </c:forEach>
                                                         </select>
                                                      </li>
                                                      <li><a onclick="showsel(5)">과학</a>
                                                         
                                                         <select id="sel5" onchange="clas(1,5)" style="display:none;">
                                                            <c:forEach var="l" items="${list}">
                                                            <c:if test="${l.subject_num == 5}">
                                                               <option value="${l.class_idx}" >${l.class_subject}</option>
                                                            </c:if>
                                                            </c:forEach>
                                                         </select>
                                                      </li>
                                                   </ul>
                                       </li>                                                      
                                       </ul>
                                 
                                 </td></tr>
                              
                                 </table>
                              </td>
                              <td><table id="memlist" width=700 ></table>
                                 <!-- Modal -->
                                 <div class="modal fade" id="myModal" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">
                                           <div class="modal-header">
                                               <button type="button" class="close" data-dismiss="modal">&times;</button>
                                               <h4 class="modal-title">쪽지 쓰기</h4>
                                             </div>
                                             <form class="cmxform" id="signupForm"  name="letter_send" action="">
                                           <div class="modal-body" style="height: 350px;"> 
                                               <input type="hidden" name="letterdto[0].letter_sender" value="master">                                                
                                               <div class="form-group form-animate-text" style="width:300px; float: left;height: 66px;">
                                                     <input type="text" class="form-text" id="validate_study_name"  name="letterdto[0].letter_subject" size=27 required>
                                                     <span class="bar"></span>
                                                     <label>제목</label>
                                                </div>    
                                                <div style="width:570px; float: left;">
                                                        <div class="col-md-12 col-sm-12 col-xs-12 mail-reply">
                                                       <textarea wrap="hard" class="summernote" rows="10" role="100" cols="76"  name="letterdto[0].letter_content" style="resize: none;" placeholder="내용입력"></textarea>   
                                                    </div>
                                                 </div>   
                                             </div>
                                             <div class="modal-footer">
                                               <button class="btn btn-primary" >발송</button>
                                             </div>
                                             </form>
                                        </div>
                                      </div>
                                 </div>
                              </td>
                           </tr>
                        </table>
                     </form>
                      </div>
                      <div role="tabpanel" class="tab-pane fade" id="tabs-demo4-area2" aria-labelledby="tabs-demo4-area2">
                        <div id="list_div" ></div>
                  <div class="modal fade" id="myModal2" role="dialog">
                       <div class="modal-dialog">
                         <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">쪽지 내용</h4>
                             </div>
                            <div class="modal-body"> 
                               <div id="bodycon" style="color: #359cf9;"></div>
                           </div>
                              <div class="modal-footer"></div>
                         </div>
                       </div>
                  </div>
                      </div>
                    </div>
                  </div>
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
      }

     
    });

  }); 
 </script>
</body>
</html>