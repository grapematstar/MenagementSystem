<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!Doctype html>
 <html>
<section style="width: 200px; float: left;position: fixed;"">
	 <div id="left-menu">
   <div class="sub-left-menu scroll">
      <ul class="nav nav-list">
      <li class="time">
                <h1 class="animated fadeInLeft">21:00</h1>
                <p class="animated fadeInRight">Sat,October 1st 2029</p>
              </li>
					<li class="active ripple"><a href="studyListgo.do"></a> <a
						class="tree-toggle nav-header"><span class="fa-home fa"></span>
							스터디 <span class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul class="nav nav-list tree">
							<li><a href="studyListgo.do">목록</a></li>
							<li><a href="studyRecruitgo.do">모집</a></li>
						</ul>
					</li>
					
					<li class="ripple"><a class="tree-toggle nav-header"> <span
							class="fa fa-pencil-square"></span> 스터디 룸 <span
							class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul class="nav nav-list tree">
							<li><a href="sg_favorcartview.do">스터디룸 이용안내</a></li>
							<li><a href="study_room_reservgo.do"> 스터디룸 예약</a></li>
						
						</ul>
					</li>	
      </ul>
   </div>
  </div>
<!-- 사이드바 끝 -->
</section>

</html>