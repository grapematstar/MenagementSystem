<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
 <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/nouislider.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/select2.min.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/ionrangeslider/ion.rangeSlider.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/ionrangeslider/ion.rangeSlider.skinFlat.css"/>
  <link rel="stylesheet" type="text/css" href="asset/css/plugins/bootstrap-material-datetimepicker.css"/>
  <link href="asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->
  <link rel="shortcut icon" href="asset/img/logomi.png">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>   
var y=0;

function replylistget(){
    $.ajax({
         type : "GET",
         url : "studyreplyList.do",            
         success:function(data){            
            var listdiv=document.getElementById('reply_list');               
            for(var i=0;i<data.reply.length;i++){
               var rl=eval("data.reply["+i+"]");
               var replydiv=makestudybbslist(rl);
               listdiv.appendChild(replydiv);                  
            }            
            
         }
    });      
}
function makestudybbslist(rl){      
   var rldiv=document.createElement('table');
   rldiv.setAttribute('id','reply'+y);   
   rldiv.innerHTML='<tr><td width="150" style="padding-left:20px;margin-top:10px; text-align:left;" height=30 >'+rl.stu_name+'</td><td width="500" ></td><td width="200" align="center" id="rldate'+y+'">'+rl.study_bbswritedate+'</td></tr>'+
               '<tr><td width="500" style="padding-left:10px;" colspan=3 id="rlcontent'+y+'"><input type="hidden" id="hdrlcontent'+y+'" value="'+rl.study_bbscontent+'">'+rl.study_bbscontent+'</td><td width=200 id="btbt'+y+'"><input type="button"   class="btn btn-default"  onclick="replymodi('+rl.study_bbsidx+','+y+')" value="수정"><input type="button"  class="btn btn-default" style="margin-left:10px;" onclick="replydel('+rl.study_bbsidx+')" value="삭제"></td></tr>';               
   y++;
   rldiv.comment=rl;
   rldiv.className="media table table-striped table-bordered dataTable no-footer";   
   return rldiv;
}
function replymodi(bbsidx,num){
   var rlcontent=document.getElementById("rlcontent"+num);
   var content=document.getElementById("hdrlcontent"+num);
   var btbt=document.getElementById("btbt"+num);
   btbt.style.display="none";
   rlcontent.innerHTML='<textarea style="resize: none; " id="arlcontent'+num+'" rows="5" cols="103" >'+content.value+'</textarea><td width=100 id="btbt"'+num+'"><input type="button" class="btn btn-default" style="position:relative;bottom:70px;margin-left:10px;" onclick="replymodiok('+bbsidx+','+num+')" value="완료"></td>';
}                      
function replymodiok(bbsidx,ii){
   var hdcontent=document.getElementById('arlcontent'+ii).value;
   var bbsidx=bbsidx;
   var params="study_bbsidx="+bbsidx+"&study_bbscontent="+hdcontent;
   $.ajax({
      type : "get",url:"study_bbs_replyupdate.do",data:params,
      success:function(data){
         alert(data.msg);
         location.reload();
      }
   })
}
function replydel(bbsidx){
   $.ajax({
      type : "GET",
      url : "study_bbsdel.do",data : "study_bbsidx="+bbsidx,
      success:function(data){
         alert(data.msg);
         location.reload();
      }
   })
}
function replyadd(){   
   var study_bbssunbun=${bbsc.study_bbssunbun};
   var stu_id=document.reply_addform.stu_id.value;      
   var study_content=document.reply_addform.studybbs_content.value;
   var params="stu_id="+encodeURIComponent(stu_id)+"&study_bbscontent="+encodeURIComponent(study_content)+"&study_bbssunbun="+encodeURIComponent(study_bbssunbun);
   $.ajax({
      type : "GET",
      url : "study_replyadd.do",
      data : params, 
      error:function (e){
         alert(e.responseText);
      },
      success:function(data){      
         y=0;         
         document.reply_addform.studybbs_content.value="";
         document.getElementById("reply_list").innerHTML="";
         replylistget();
      }
   });
}


function bbsmodi(){
   
}
function bbsdel(){
   
}
</script>
<style>
   .tr_w{
      background-color: #fff;
      border:1px solid #e2e2e2 ;
   }
   pre{
      min-height: 200px;
      margin: 0;      
   }

   .btn-primary{
   margin-left: 10px;
   }
   .form-control[readonly]{
      background-color: white;
   }
   .btn-outline{
   line-height: 0.7;
   }
   .form-group,label{
      margin-bottom: 0px;
   }
   label{
      font-size: 15px !important;
   }
   p{
      color: gray;
   }
   td{
   	padding: 5px !important;
   }
</style>
</head>
<body id="mimin" class="dashboard"  style="width:1200px;"onload="replylistget()">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">


<div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">${study_bbsname}</h3></div>               
            </div>
          </div>
    
<div class="panel" style="width:880px;margin-top: 20px;">
          <div class="panel-body">
         <table class="table table-striped table-bordered dataTable no-footer" cellspacing=0 >
         <tr>
            <td width="400" style="padding-left: 10px;">${bbsc.study_bbssubject}</td><td width="100" align="center"> ${bbsc.stu_name }</td><td align="center" width="100"> ${bbsc.study_bbswritedate }</td>
         </tr>   
         <tr>
            <td colspan="3" style="padding: 10px;text-align: left;" class="tr_w"><pre>${bbsc.study_bbscontent }</pre></td></tr>
         <tr>
            <td colspan="3" style="text-align: right;"><input type="button" onclick="location.href='studybbsgo.do?study_bbsref=${sessionScope.study_bbsref}'" class="btn btn-primary" value="목록으로 가기"><input type="button" class="btn btn-primary" onclick="bbsmodi(${bbsc.study_bbsidx})" value="수정"><input class="btn btn-primary" type="button" onclick="bbsdel()" value="삭제"></td>
         </tr>   
         </table>
</div></div>
<div class="panel" style="width:880px; margin-top: 20px;">
          <div class="panel-body">
   <div id="reply_list"  class="search-v1"> 
   
   </div>
   <div id="replyadd" style="width:850px; margin-top:20px;">
<form name="reply_addform">
<table>
<tr><td style="padding-left: 25px !important;text-align: left; padding: 5px;">
<input type="hidden" name="stu_id" value="${sessionScope.stu_id}">
 ${sessionScope.name }</td><td></td></tr>
<tr><td width="800" style="text-align: left; padding: 5px;"><textarea style="margin-left: 15px; resize: none;" name="studybbs_content" rows="5" cols="103" ></textarea></td><td><input class="btn btn-primary" type="button" style="position: relative;bottom: 30px;margin-left:0;" onclick="replyadd()" value="등록"></td></tr>
</table>
</form>
</div>
   </div></div>

</div></div>

<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/summernote.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<script src="asset/js/plugins/jquery.validate.min.js"></script>
<script src="asset/js/plugins/ion.rangeSlider.min.js"></script>
<script src="asset/js/plugins/bootstrap-material-datetimepicker.js"></script>
<script src="asset/js/plugins/jquery.mask.min.js"></script>
<script src="asset/js/plugins/select2.full.min.js"></script>
<script src="asset/js/plugins/nouislider.min.js"></script>
<!-- custom -->
 <script src="asset/js/main.js"></script>

</body>
</html>