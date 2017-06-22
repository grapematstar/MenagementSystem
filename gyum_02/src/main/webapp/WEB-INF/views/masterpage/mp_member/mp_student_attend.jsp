<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생 출결관리</title>
 <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Miminium</title>

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

</head>
<script>
var subnum=0;
var params;
function sublist(){
   subnum=document.getElementById("sub").value;
   params="sub="+subnum;
   
$.ajax({
      type:"GET",
      url:"mp_student_attend_list.do",
      data:params,
      success:function(data){      

         var sublist=document.getElementById("cla");
         sublist.innerHTML="<option value=0>전체</option>";//초기화
         for(var i=0;i<data.sublist.length;i++){//가져온 데이터의 길이 만큼
            var sl=eval("data.sublist["+i+"]");//이런 아이디를 줄꺼고
            var makeoption=makeclasslist(sl);//이 아이디를 준 div를 만들어서
            
            sublist.appendChild(makeoption);//초기화 한  div에 붙여 넣은꺼야
         }
         alert(data.msg);//data.뒤에 addobject한 키값쓰면 그 벨류값나옴
      }
   })
}
var i=0;
function makeclasslist(sl){
   var classlistselect=document.createElement('option');//div 를 만들꺼고ㅑ
   classlistselect.setAttribute('value',sl.class_idx);//아이디 셋팅을 sl 로 해줄꺼고 
   i++;//i 가 늘어나면서 이게 몇번쨰인지 확인하고
   classlistselect.innerHTML=sl.class_subject;//고안에 넣을꺼야 
   
      /* "<table id='subb"+i+"' onclick='subdel("+i+")'><tr><td>"+sl.subname"</td><td>"+sl.아 이거 한박자 느린거 짱남 +"</td><td>"+sl.디티오안의 변수명들+"</td?></tr></table>" */
   return classlistselect;//만들어진걸 돌려줘서  append 하는 거 
}
var u=0;
var divcheck=0;
function gogo(){   
   document.getElementById('stu_panel').style.display="inherit";
   subnum=document.getElementById("sub").value;
   var class_idx = document.getElementById("cla").options[document.getElementById("cla").selectedIndex].value;
   var stu_name=document.getElementById("stu_name").value;
   var nono=0;
   if(stu_name==null||stu_name==""){
      nono++;
   }
   if(class_idx==0){
      nono++;
   }else{
      nono=1;   
   }
   if(nono==2){
      alert('이름을 넣거나 강의 선택을 해라');
      return false;
   }   
   alert("과목번호:"+subnum+" 선택한강의번호:"+class_idx+" 수강생 이름 :"+stu_name);
   $.ajax({
      type:"get", url:"mp_student_attend_list_ok.do",
      data:"sub="+subnum+"&class_idx="+class_idx+"&stu_name="+encodeURIComponent(stu_name),
      success:function(data){      
         if(data.check!=null){
            alert(data.check);
            location.reload();
         }else{
            var result=document.getElementById("stu");
            result.innerHTML="";         
            if(data.num!=0){
               console.log('이름 검색 '+data.num);
               for(var k=0;k<data.num;k++){
                  var lr=eval("data.last_result"+k+"");//왜해..필요없음ㅋㅋㅋㅋㅋㅋㅋ 그거하면 lr뒤에 공백 생겨서 length안되는거아님?                  
                  for(var j=0; j<lr.length; j++){ 
                     var tl=eval("data.last_result"+k+"["+j+"]");//가져온 data배열로 만들기
                     var tl2=eval("data.last_result"+k+"["+(j-1)+"]");//가져온 data배열로 만들기      
                     /* var maketable=maketablelist(tl);//div만들어서 (함수 따로 만들어야됨)            
                     result.appendChild(maketable);//.appendChild(변수명); */
                     if(j==0||(j>0&&tl.class_subject!=tl2.class_subject)){
                        var maketable=maketablelist(tl);//div만들어서 (함수 따로 만들어야됨)            
                        result.appendChild(maketable);//.appendChild(변수명);                     
                     }else{
                        var gettr=eval("document.getElementById('tr_"+u+"')");
                        var maketd=maketrlist(tl);//div만들어서 (함수 따로 만들어야됨)            
                        gettr.appendChild(maketd);//.appendChild(변수명);
                        var gettr2=eval("document.getElementById('tr2_"+u+"')");
                        var maketd2=maketrlist2(tl);//div만들어서 (함수 따로 만들어야됨)            
                        gettr2.appendChild(maketd2);//.appendChild(변수명);
                        var gettr3=eval("document.getElementById('tr3_"+u+"')");
                        var maketd3=maketrlist3(tl);//div만들어서 (함수 따로 만들어야됨)            
                        gettr3.appendChild(maketd3);//.appendChild(변수명);
                     }
                  }
               }
            }else{
               console.log('전체');
               for(var j=0; j<data.last_result .length; j++){//공백 안생길뿐더러.... 상관없음..ㅇㅇㅇㅇㅇ해바근데왜안나옴..
                  var tl=eval("data.last_result["+j+"]");//가져온 data배열로 만들기   
                  var tl2=eval("data.last_result["+(j-1)+"]");//가져온 data배열로 만들기
                  if(j==0||(j>0&&tl.stu_name!=tl2.stu_name)){
                     var maketable=maketablelist(tl);//div만들어서 (함수 따로 만들어야됨)            
                     result.appendChild(maketable);//.appendChild(변수명);                     
                  }else{
                     var gettr=eval("document.getElementById('tr_"+u+"')");
                     var maketd=maketrlist(tl);//div만들어서 (함수 따로 만들어야됨)            
                     gettr.appendChild(maketd);//.appendChild(변수명);
                     var gettr2=eval("document.getElementById('tr2_"+u+"')");
                     var maketd2=maketrlist2(tl);//div만들어서 (함수 따로 만들어야됨)            
                     gettr2.appendChild(maketd2);//.appendChild(변수명);
                     var gettr3=eval("document.getElementById('tr3_"+u+"')");
                     var maketd3=maketrlist3(tl);//div만들어서 (함수 따로 만들어야됨)            
                     gettr3.appendChild(maketd3);//.appendChild(변수명);
                  }
               }         
            }
            flow();
            alert(data.msg);//data.뒤에 addobject한 키값쓰면 그 벨류값나옴
         }
      }
   })
}

function maketablelist(tl){
   var tablelist=document.createElement('div'); //여기있는데????????
   tablelist.setAttribute('id','attend_'+u);   
   u++;
   divcheck++;
   tablelist.innerHTML="<table><tr id='tr_"+u+"'><td colspan=2 width=150 align='center'>"+tl.class_subject+"</td><td>"+tl.attend_date+"</td></tr><tr id='tr2_"+u+"' rowspan=2><td>"+tl.stu_idx+"번</td><td>"+tl.stu_name+"</td><td>"+tl.a_a_attendance+"</td></tr><tr id='tr3_"+u+"'><td></td><td></td><td>"+tl.attend_note+"</td></tr></table>";

   return tablelist;
} 

function maketrlist3(tl){
   var tablelist=document.createElement('td');   
   tablelist.innerHTML=tl.attend_note;
   return tablelist;
}
function  maketrlist(tl){
var tablelist=document.createElement('td'); //여기있는데????????

tablelist.innerHTML=tl.attend_date;
return tablelist;
}
function  maketrlist2(tl){
   var tablelist=document.createElement('td'); //여기있는데????????

   tablelist.innerHTML=tl.a_a_attendance;
   return tablelist;
   }
function flow(){
   for(var z=0;z<divcheck;z++){
      alert(divcheck);
      eval("document.getElementById('attend_"+z+"')").style.width="100";
      eval("document.getElementById('attend_"+z+"')").style.overflow="auto";
   }
}   
   
</script>


</head>

<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
<div id="content" class="article-v1">

<div class="panel box-shadow-none content-header">
   <div class="panel-body">
      <div class="col-md-12">
         <h3 class="animated fadeInLeft">회원관리</h3>
         <p class="animated fadeInDown">
            회원관리 <span class="fa-angle-right fa"></span>수강생출결관리
         </p>
      </div>
   </div>
</div>
<hr>
<div align="center">

</div>
<div class="panel box-shadow-none content-header" style="margin-top:20px;">
   <div class="panel-body">
   <b>과목 |</b>
   <select id="sub" onchange="sublist()">
      <option value=0>전체</option>
      <option value=1>국어</option>
      <option value=2>영어</option>
      <option value=3>수학</option>
      <option value=4>사회</option>
      <option value=5>과학</option>
   </select>
   <b>강의 |</b>
   <select id="cla">
      <option value=0>전체</option>
   </select>
   <b>수강생 |</b><input type="text" id="stu_name">
   <input type="button" class="btn btn-primary" value="검색" onclick="gogo()">
</div>
</div>
<div class="panel" style="margin-top:20px;display: none;" id="stu_panel" >
   <div class="panel-body">
<div id="stu" style="width:1000px; overflow: auto; "></div>
</div></div>

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