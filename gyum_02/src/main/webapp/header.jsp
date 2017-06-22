<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<header>
<script src="https://code.jquery.com/jquery-3.2.1.js" 
   integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
   crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	get_my_noread_letter_num();
});
function get_my_noread_letter_num(){
    $.ajax({
       type: "GET",
       url: "/gyum_02/get_my_noread_letter_num.do",
       success: function(args){
          if(args.msg!=null){
             return;
          }
          
          if(args.letternum>0){
            document.getElementById('letterbox').innerHTML = '<img src="/gyum_02/img/letter2.png" width="20">&nbsp;<span class="badge badge-default">'+args.letternum+'</span>&nbsp;';
          }else{
          	document.getElementById('letterbox').innerHTML = '<img src="/gyum_02/img/letter1.png" width="20">';
          }
       },
       error:function(e){
          $("body").html(e.responseText);
       }
    });
}
function letterbox(){
   window.open('open_letter_box.do', '나의쪽지함', 'width=400,height=370,top=100,left=400');
}
</script>
 <!-- start: Header -->
        <nav class="navbar navbar-default header navbar-fixed-top">
          <div class="col-md-12 nav-wrapper">
            <div class="navbar-header" style="width:100%;">
              <div class="opener-left-menu is-open">
                <span class="top"></span>
                <span class="middle"></span>
                <span class="bottom"></span>
              </div>
                <a href="index.do" class="navbar-brand"> 
                 <b>GYUM ACADEMY</b>
                </a>

             <ul class="nav navbar-nav search-nav">
               <li>
                  <div class="search">
                     <a href="searchgo.do">
                        <span id="searchIcon" class="fa fa-search icon-search" style="font-size: 23px;"></span>
                        <div class="form-group form-animate-text">
                           <input id="searchword" type="text" class="form-text" required> <span
                              class="bar"></span> <label class="label-search">Type
                              anywhere to <b>Search</b>
                           </label>
                        </div>
                     </a>
                  </div>
               </li>
            </ul>

              <ul class="nav navbar-nav navbar-right user-nav">
                <li class="user-name">
                	<span>
						<c:set var="id" value="${sessionScope.id}"></c:set>
      					<c:if test="${!empty id }">
         					<p><a id="letterbox" onclick="letterbox()"></a>&nbsp;<a href="my_index.do">${id }</a>님 로그인중|<a href="logout.do">로그아웃</a></p>
      					</c:if>
      					<c:if test="${empty id }">
         					<p><a href="login.do">로그인</a>|<a href="my_member.do">회원가입</a></p>
      					</c:if>
					</span>
				</li>
                  <li class="dropdown avatar-dropdown">
                   <img src="asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                   <ul class="dropdown-menu user-dropdown">
                     <li><a href="my_index.do"><span class="fa fa-user"></span> My Page</a></li>
                     <li><a href="#"><span class="fa fa-calendar"></span> My Calendar</a></li>
                     <li role="separator" class="divider"></li>
                     <li class="more">
                      <ul>
                        <li><a href=""><span class="fa fa-cogs"></span></a></li>
                        <li><a href=""><span class="fa fa-lock"></span></a></li>
                        <li><a href=""><span class="fa fa-power-off "></span></a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      <!-- end: Header -->
</header>