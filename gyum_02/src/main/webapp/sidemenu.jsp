<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!Doctype html>
 <html>
 <div id="left-menu">
   <div class="sub-left-menu scroll">
      <ul class="nav nav-list">      	
      	 <li class="time">
                <h1 class="animated fadeInLeft">21:00</h1>
                <p class="animated fadeInRight">Sat,October 1st 2029</p>
              </li>
					<li class="active ripple"><a href="#"></a> <a
						class="tree-toggle nav-header"><span class="fa-home fa"></span>
							Dashboard <span class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul class="nav nav-list tree">
							<li><a href="index.do">HOME</a></li>
						</ul>
						
					
			         <li class="ripple"><a class="tree-toggle nav-header" href="notice.do"> <span
							class="fa fa-check-square-o"></span> 공지사항 </a></li>
							
					<li class="ripple"><a class="tree-toggle nav-header"> <span
							class="fa fa-pencil-square"></span> 수강신청 <span
							class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul class="nav nav-list tree">
							<li><a href="sg_favorcartview.do">수강장바구니</a></li>
							<li><a href="sg_index.do">과목 리스트</a></li>
							<li><a href="sg_payment.do">결제내역 및 취소</a></li>
						</ul></li>
						
					<li class="ripple"><a class="tree-toggle nav-header"> <span
						class="fa fa-check-square-o"></span> 사이버강의실 <span
						class="fa-angle-right fa right-arrow text-right"></span></a>
						<ul class="nav nav-list tree">
							<li><a href="cc_gotoOldClass.do">이전강의실</a></li>
							<li><a href="cc_gotoCurrentClass.do">현재강의실</a></li>
							<li><a href="cc_gotoPlannedClass.do">예정된강의</a></li>
						</ul>
					</li>
						
						
         <li class="ripple"><a class="tree-toggle nav-header" > <span
							class="fa fa-check-square-o"></span> 스터디 </a><ul class="nav nav-list tree">
							<li><a href="studyListgo.do">리스트</a></li>
							<li><a href="studyRecruitgo.do">모집</a></li>							
						</ul></li>
							
         <li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-check-square-o"></span>스터디룸<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="study_room_reservgo.do">스터디룸 신청</a></li>
					</ul>
				</li>
		
		
         <li class="ripple"><a class="tree-toggle nav-header" href="my_index.do"> <span
							class="fa fa-check-square-o"></span> 마이페이지 </a></li>
         <li class="ripple"><a class="tree-toggle nav-header" href="mp_academy_index.do"> <span
							class="fa fa-check-square-o"></span> 관리자 </a></li>
         <li class="ripple"><a class="tree-toggle nav-header" href="freebbsList.do"> <span
							class="fa fa-check-square-o"></span> 자유게시판 </a></li>
      </ul>
   </div>
  </div>
<!-- 사이드바 끝 -->


</html>