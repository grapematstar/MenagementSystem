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
var study_votebbsidx="${vbdto.study_votebbsidx}";
var votecheck=0;
var num=0;
var resultnum=0;
var aleadyvote=0;
function getvoteconlist(){   
   document.getElementById('voteconlist').innerHTML="";
   document.getElementById('voteresult').innerHTML="";
   var params="study_votebbsidx="+study_votebbsidx;   
   $.ajax({   
      type : "GET",
      url : "voteconlist.do",
      data : params, 
      error:function (e){
        
      },
      success:function(data){            
         if(data.check!=null){
            votecheck=data.check;
            var voteresultlisttd=document.getElementById("voteresult");
            for(var i=0;i<data.vcldto.length;i++){            
               var vrl=eval("data.vcldto["+i+"]");
               var voteresultdiv=makevoteresult(vrl);
               voteresultlisttd.appendChild(voteresultdiv);
            }     
            var vrl_r=resultview(vrl,1);         
            voteresultlisttd.appendChild(vrl_r);
         }
         var voteconlisttd=document.getElementById("voteconlist");
         for(var i=0;i<data.vcldto.length;i++){            
            var vl=eval("data.vcldto["+i+"]");
            var votelistdiv=makevotelist(vl,(data.vcldto.length-1));
            voteconlisttd.appendChild(votelistdiv);
         }     
         
         voteconlisttd.appendChild(resultview(vl,0));
         num=0;         
         resultnum=0;
      }
   });
}
var checked_idx=0;
function makevotelist(vl,length){   
   var vldiv=document.createElement('tr');
   vldiv.setAttribute('id','vl'+num);      
   if(votecheck>0){   
      if(votecheck==vl.study_voteidx){
         vldiv.innerHTML='<td><div class="form-group form-animate-checkbox" style="width:600px;"><input type="radio" name="voteidx" class="checkbox" value="'+vl.study_voteidx+'" checked> <label style="float:left;padding-left:5px;">'+vl.study_votecontent+'</label> <p class="animated fadeInDown" style="float:left; padding-left:30px !important;margin-bottom:0;">이전 투표</p></td>';
         aleadyvote=vl.study_voteidx;
      }else{
         vldiv.innerHTML='<td><div class="form-group form-animate-checkbox"><input type="radio" name="voteidx" class="checkbox" value="'+vl.study_voteidx+'" > <label style="float:left;padding-left:5px;">'+vl.study_votecontent+'</label></td>';         
      }
   }else{
      vldiv.innerHTML='<td><div class="form-group form-animate-checkbox"><input type="radio" name="voteidx" class="checkbox" value="'+vl.study_voteidx+'" > <label style="float:left;padding-left:5px;">'+vl.study_votecontent+'</label></td>';
   }
   num++;
   vldiv.comment=vl;
   vldiv.className="vl";
   return vldiv;
}
function resultview(vl,values){
   var vldiv=document.createElement('tr');
   vldiv.setAttribute('id','vl'+num);      
   if(values==0){
   vldiv.innerHTML='<td><input type="button" class=" btn btn-outline btn-primary"  onclick="votego('+vl.study_votebbsidx+')" value="투표"> <input type="button" onclick="vote_resultlist()" class=" btn btn-outline btn-primary" value="결과보기"></td>'
   }else{
      vldiv.innerHTML='<td><input type="button" onclick="vote_resultlist()" class=" btn btn-outline btn-primary" value="투표하기"></td>'
   }
   num++;
   vldiv.comment=vl;
   vldiv.className="vl";
   return vldiv;
}


function makevoteresult(vl){
   var vrdiv=document.createElement('tr');
   vrdiv.setAttribute('id','vr'+num);   
   vrdiv.innerHTML='<td><input type="text" class="form-control primary" style="" size=60 readonly value="'+vl.study_votecontent+'"> <input type="text"  style="width:50px;" readonly class="form-control success" value="'+vl.study_votenum+'"></td>';
   resultnum++;
   vrdiv.comment=vl;
   vrdiv.className="vr";
   return vrdiv;
}

/*여기*/
var y=0;
var bbssunbun=0;
function replylistget(){
   var bbssb=document.getElementById('bbssb').value;
   var params="bbssb="+bbssb;
    $.ajax({
         type : "GET",
         url : "study_votebbs_replyList.do",
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
   rldiv.setAttribute('id','reply'+y);
   rldiv.innerHTML='<tr><td width="150" style="padding-left:10px;margin-top:10px;" height=30 id="rlname'+y+'">'+rl.stu_name+'</td><td width="500" ></td><td width="200" align="center" id="rldate'+y+'">'+rl.study_votebbswritedate+'</td></tr>'+
               '<tr><td width="850" style="padding-left:10px;" colspan=3 id="rlcontent'+y+'"><input type="hidden" id="hdrlcontent'+y+'" value="'+rl.study_votebbscontent+'">'+rl.study_votebbscontent+'</td><td width=200 id="btbt'+y+'"><input type="button" class="btn btn-default" onclick="replymodi('+rl.study_votebbsidx+','+y+')" value="수정"><input type="button" class="btn btn-default" style="margin-left:10px;" onclick="replydel('+rl.study_votebbsidx+')" value="삭제"></td></tr>';
   y++;
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
   var hdcontent=eval("document.getElementById('arlcontent"+ii+"')").value;
   var bbsidx=bbsidx;
   var params="study_votebbsidx="+bbsidx+"&study_votebbscontent="+hdcontent;
   $.ajax({
      type : "get",url:"study_votebbs_replyupdate.do",data:params,
      success:function(data){
         alert(data.msg);
         location.reload();
      }
   })
}
function replydel(bbsidx){
   $.ajax({
      type : "GET",
      url : "study_votebbsdel.do",data : "study_votebbsidx="+bbsidx,
      success:function(data){
         alert(data.msg);
         location.reload();
      }
   })
}
function replyadd(){   
   var stu_id=document.reply_addform.stu_id.value;   
   var stu_name=document.reply_addform.stu_name.value;
   var study_votebbscontent=document.reply_addform.studyvotebbs_content.value;
   var params="stu_id="+encodeURIComponent(stu_id)+"&stu_name="+encodeURIComponent(stu_name)+"&study_votebbscontent="+encodeURIComponent(study_votebbscontent);

   $.ajax({
      type : "GET",
      url : "study_votebbs_replyadd.do",
      data : params, 
      error:function (e){
        
      },
      success:function(data){      
         y=0;         
         document.reply_addform.studyvotebbs_content.value="";
         document.getElementById("reply_list").innerHTML="";
         replylistget();
      }
   });
}
function bbsmodi(){
   var section1=document.getElementById("section1");
   section1.style.display="none";
   var section2=document.getElementById("section2");
   section2.innerHTML="<table><tr><td>제목<input type='text' id='s2subject' value='${dto.study_filebbssubject}'></td><td>작성날짜</td><td>${dto.study_filebbswritedate}</td></tr><tr><td colspan=3>내용<textarea id='s2content' rows='10' cols='80' style='resize: none;' value='${dto.study_filebbscontent}'>${dto.study_filebbscontent}</textarea></td></tr></table><input type='button' onclick='modiok(${dto.study_filebbsidx})' value='수정완료'>";
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
         location.reload();
      }
   })
}








function votego(votebbsidx){
   var voteidx=document.vote.voteidx.value;
   alert(aleadyvote+'=='+voteidx);	
   if(aleadyvote==voteidx){
		return false;
	}
   if(aleadyvote==0){
	   var params="study_voteidx="+voteidx+"&study_votebbsidx="+votebbsidx+"&aleadyvote=-1";
   }else{
   	var params="study_voteidx="+voteidx+"&study_votebbsidx="+votebbsidx+"&aleadyvote="+aleadyvote;
   }
   $.ajax({   
      type : "GET",
      url : "votego.do",
      data : params, 
      error:function (e){
         alert(e.responseText);
      },
      success:function(data){   
      /*    
         alert(aleadyvote);
         if(aleadyvote>0){
            vote_cancel(aleadyvote,votebbsidx);
         } */
         aleadyvote=0;
         getvoteconlist();
      }
   });
}
/* function vote_cancel(voteidx,votebbsidx){
   var params="voteidx="+voteidx+"&votebbsidx="+votebbsidx;
   $.ajax({   
      type : "GET",
      url : "vote_cancel.do",
      data : params, 
      error:function (e){
         alert(e.responseText);
      },
      success:function(data){   
         
      }
   });   
} */
function vote_resultlist(){
   var r_list=document.getElementById('voteresult');
   var rr_list=document.getElementById('voteconlist');
   if(r_list.style.display=="inherit"){
      rr_list.style.display="inherit";
      r_list.style.display="none";
   }else{
      rr_list.style.display="none";
      r_list.style.display="inherit";
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
<body id="mimin" class="dashboard"  style="width:1200px;"onload="getvoteconlist();replylistget();">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="study_insidebar.jsp" %>
<div id="content" class="article-v1">

<div class="panel" style="width:880px;">
          <div class="panel-body">
            <div class="col-md-12">
                <h3 class="animated fadeInLeft">투표 게시판</h3></div>               
            </div>
          </div>


<div class="panel" style="width:880px;margin-top: 20px;">
          <div class="panel-body">
         <table class="table table-striped table-bordered dataTable no-footer" cellspacing=0 >
         <tr>
            <td width="400" style="padding-left: 10px;">${vbdto.study_votebbssubject }</td><td width="100" align="center"> ${vbdto.stu_name }</td><td align="center" width="100">${vbdto.study_votebbswritedate }</td>
         </tr>   
         <tr>
            <td colspan="3" style="padding: 10px;text-align: left;" class="tr_w"><pre>${vbdto.study_votebbscontent}<br><br></div></div><form name="vote"><table id="voteconlist" class="table table-striped table-bordered dataTable no-footer"  style="float:left;width: 600px;padding:10px;"></table></form> <table id="voteresult"  class="table table-striped table-bordered dataTable no-footer"  style="float:left;width: 600px;padding:10px;display: none;"></table></div></pre></td></tr>
         <tr>
            <td colspan="3" style="text-align: right;"><input type="button" onclick="listgo()" class="btn btn-primary" value="목록으로 가기"><input type="button" class="btn btn-primary" onclick="bbsmodi()" value="수정"><input class="btn btn-primary" type="button"  onclick="bbsdel(${dto.study_votebbsidx})" value="삭제"></td>
         </tr>   
         </table>
         
</div></div>

<input type="hidden" id="bbssb" value="${vbdto.study_votebbssunbun}">


<div class="panel" style="width:880px; margin-top: 20px;">
          <div class="panel-body">
   <div id="reply_list" class="search-v1"> 
   
   </div>
   <div id="replyadd" style="width:850px; margin-top:20px;">
      <form name="reply_addform">
         <table>
            <tr><td style="padding-left: 25px !important;text-align: left; padding: 5px;">
            <input type="hidden" name="stu_id" value="${sessionScope.stu_id}"><input type="hidden" name="stu_name" value="${sessionScope.name }">
             ${sessionScope.name }</td><td></td></tr>
            <tr><td width="800" style="text-align: left; padding: 5px;"><textarea style="margin-left: 15px; resize: none;" name="studyvotebbs_content" rows="5" cols="103" ></textarea></td><td><input class="btn btn-primary" type="button" style="position: relative;bottom: 30px;margin-left:0;" onclick="replyadd()" value="등록"></td></tr>
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