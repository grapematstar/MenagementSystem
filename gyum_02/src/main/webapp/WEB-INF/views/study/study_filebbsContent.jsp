<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
  <style>
  #filelist{
     position: relative;
  }
  </style>
<script>   
var i=0;
var bbssunbun=0;
function replylistget(){
   var bbssb=document.getElementById('bbssb').value;
   var params="bbssb="+bbssb;
    $.ajax({
         type : "GET",
         url : "study_filebbs_replyList.do",
         data:params,
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
   rldiv.setAttribute('id','reply'+i);
   rldiv.innerHTML='<tr><td width="150" style="padding-left:10px;margin-top:10px;" height=30 id="rlname'+i+'">'+rl.stu_name+'</td><td width="500" ></td><td width="200" align="center" id="rldate'+i+'">'+rl.study_filebbswritedate+'</td></tr>'+
               '<tr><td width="" colspan=3 style="padding-left:10px;" id="rlcontent'+i+'"><input type="hidden" id="hdrlcontent'+i+'" value="'+rl.study_filebbscontent+'">'+rl.study_filebbscontent+'</td><td width=200 id="btbt'+i+'"><input type="button" class="btn btn-default" onclick="replymodi('+rl.study_filebbsidx+','+i+')" value="수정"><input type="button" style="margin-left:10px;" class="btn btn-default" onclick="replydel('+rl.study_filebbsidx+')" value="삭제"></td></tr>';               
   i++;
   rldiv.comment=rl;
   rldiv.className="rl";
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
   var params="study_filebbsidx="+bbsidx+"&study_filebbscontent="+hdcontent;
   $.ajax({
      type : "get",url:"study_filebbs_replyupdate.do",data:params,
      success:function(data){
         alert(data.msg);
         location.reload();
      }
   })
}
function replydel(bbsidx){
   $.ajax({
      type : "GET",
      url : "study_filebbsdel.do",data : "study_filebbsidx="+bbsidx,
      success:function(data){
         alert(data.msg);
         location.reload();
      }
   })
}
function replyadd(){   
   var stu_id=document.reply_addform.stu_id.value;   
   var stu_name=document.reply_addform.stu_name.value;
   var study_filebbscontent=document.reply_addform.studyfilebbs_content.value;
   var params="stu_id="+encodeURIComponent(stu_id)+"&stu_name="+encodeURIComponent(stu_name)+"&study_filebbscontent="+encodeURIComponent(study_filebbscontent);
   $.ajax({
      type : "GET",
      url : "study_filebbs_replyadd.do",
      data : params, 
      error:function (e){
         alert(e.responseText);
      },
      success:function(data){      
         i=0;         
         document.reply_addform.studyfilebbs_content.value="";
         document.getElementById("reply_list").innerHTML="";
         replylistget();
      }
   });
}
function bbsmodi(){
   var section1=document.getElementById("section1");
   section1.style.display="none";
   var section2=document.getElementById("section2");
   section2.innerHTML='<table><tr><td>제목<input type="text" id="s2subject" value="${dto.study_filebbssubject}"></td><td>작성날짜</td><td>${dto.study_filebbswritedate}</td></tr><tr><td colspan=3>내용<textarea id="s2content" rows="10" cols="80" style="resize: none;" value="${dto.study_filebbscontent}">${dto.study_filebbscontent}</textarea></td></tr></table><input type="button" onclick="modiok(${dto.study_filebbsidx})" value="수정완료">';
   section2.style.display="inherit";
}
function modiok(study_filebbsidx){
   var study_filebbssubject=document.getElementById("s2subject").value;
   var study_filebbscontent=document.getElementById("s2content").value;
   var study_filebbsidx=study_filebbsidx;
   var params="study_filebbsidx="+study_filebbsidx+"&study_filebbssubject="+study_filebbssubject+"&study_filebbscontent="+study_filebbscontent;
   $.ajax({
      type:"get",url:"study_filebbsupdate.do",data:params,
      success:function(data){
         alert(data.msg);
         location.reload();
      }
   })
}
function bbsdel(study_filebbsidx){
   $.ajax({
      type : "GET",
      url : "study_filebbsdel.do",data : "study_filebbsidx="+study_filebbsidx,
      success:function(data){
         alert(data.msg);
         location.href="studydatabbsgo.do";
      }
   })
}
function showfilelist(){
   var flist=document.getElementById('filelist');
   if(flist.style.display=="inherit"){
      flist.style.display="none";   
   }else{
      flist.style.display="inherit";
   }
}
function listgo(){ 
	var session_cp="${sessionScope.study_votebbs_cp}";
	if(session_cp==""||session_cp==null){
	location.href='studyvotebbsgo.do';
	}else{
		location.href='studyvotebbsgo.do?cp='+session_cp;
	}
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
   .download_{
      text-decoration: underline;
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
                <h3 class="animated fadeInLeft">자료 게시판</h3></div>               
            </div>
          </div>


<input type="hidden" id="bbssb" value="${dto.study_filebbssunbun}">

<div class="panel" style="width:880px;margin-top: 20px;">
          <div class="panel-body">
         <table class="table table-striped table-bordered dataTable no-footer" cellspacing=0 >
         <tr>
            <td width="400" style="padding-left: 10px;">${dto.study_filebbssubject}</td><td width="100" align="center"> ${dto.stu_name }</td><td align="center" width="100">${dto.study_filebbswritedate}</td>
         </tr>   
         <tr>
            <td colspan="3" style="padding: 10px;text-align: left;" class="tr_w"><pre>${dto.study_filebbscontent}</pre></td></tr>
         <tr>
            <td colspan="3" style="text-align: right;"><input type="button" onclick="listgo()" class="btn btn-primary" value="목록으로 가기"><input type="button" class="btn btn-primary" onclick="bbsmodi()" value="수정"><input class="btn btn-primary" type="button"  onclick="bbsdel(${dto.study_filebbsidx})" value="삭제"></td>
         </tr>   
         </table>
         
         <div style="position: absolute; left:975px; top:275px;"><a onclick="showfilelist()">첨부파일보기 ▼</a>
         <div id="filelist" style="display:none;">
            <c:forEach var="f" items="${files}">
            <c:url var="downUrl" value="down.do">   
               <c:param name="filename" value="${f.name}"/>      
            </c:url>
            <a class="download_" href="${downUrl}">${f.name}</a><br>
            </c:forEach>
            </div>         
         </div>
</div></div>


<div class="panel" style="width:880px; margin-top: 20px;">
          <div class="panel-body">
   <div id="reply_list"  class="search-v1"> 
   
   </div>
   <div id="replyadd" style="width:850px; margin-top:20px;">
<form name="reply_addform">
<table>
<tr><td style="padding-left: 25px !important;text-align: left; padding: 5px;">
<input type="hidden" name="stu_id" value="${sessionScope.stu_id}"><input type="hidden" name="stu_name" value="${sessionScope.name }">
 ${sessionScope.name }</td><td></td></tr>
<tr><td width="800" style="text-align: left; padding: 5px;"><textarea style="margin-left: 15px; resize: none;" name="studyfilebbs_content" rows="5" cols="103" ></textarea></td><td><input class="btn btn-primary" type="button" style="position: relative;bottom: 30px;margin-left:0;" onclick="replyadd()" value="등록"></td></tr>
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