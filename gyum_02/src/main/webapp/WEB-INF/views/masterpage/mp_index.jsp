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
							<li><a href="index.do">학원관리프로그램</a></li>
						</ul></li>
							
					<li class="ripple"><a class="tree-toggle nav-header" href="notice_go.do"> <span
							class="fa fa-check-square-o"></span> 공지사항 </a></li>
					<li class="ripple"><a class="tree-toggle nav-header" href="masterchat.do"> <span
							class="fa fa-check-square-o"></span> 실시간 상담 </a></li>

		         <li class="ripple"><a class="tree-toggle nav-header" href="mp_class_management.do"> <span
							class="fa fa-file-code-o"></span> 강의관리 </a></li>
							
				<li class="ripple"><a class="tree-toggle nav-header"> <span
							class="fa fa-pencil-square"></span> 회원관리 <span
							class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul class="nav nav-list tree">
							<li><a href="mp_member_search.do">회원 조회</a></li>
							<li><a href="mp_student_attend.do">수강생 출결관리</a></li>
							<li><a href="mp_student_eval.do">강의평가 관리</a></li>
						</ul></li>
						
         <li class="ripple"><a class="tree-toggle nav-header" href="mp_member_send_notice_letter.do"> <span
							class="fa fa-file-code-o"></span> 쪽지관리 </a></li>
         <li class="ripple"><a class="tree-toggle nav-header" href="mp_student.do"> <span
							class="fa fa-table"></span> 학원현황 </a></li>
         <li class="ripple"><a class="tree-toggle nav-header" href="mp_qna.do"> <span
							class="fa fa-table"></span> 질문내역 </a></li>
         <li class="ripple"><a class="tree-toggle nav-header" href="mp_equipment_index.do"> <span
							class="fa fa-table"></span> 비품관리 </a></li>
						
      </ul>
   </div>
  </div>
<!-- 사이드바 끝 -->


</html>



<!-- 
<hr>
<hr>
<a href="mp_student.do">academy_status/student</a><br/>
<a href="mp_teacher.do">academy_status/teacher</a><br/>
<a href="mp_sales.do">academy_status/sales</a><br/>
<hr>
<a href="mp_qna.do">mp_qna_management/mp_qna</a><br/>
<hr>
<a href="mp_equipment_status.do">mp_equipment_status</a><br/>
<a href="mp_equipment_IO.do">mp_equipment_IO</a><br/>
<a href="mp_equipment_management.do">mp_equipment_management</a><br/>
<a href="mp_equipment_monthly.do">mp_equipment_monthly</a><br/>
<a href="mp_equipment_yearly.do">mp_equipment_yearly</a><br/>
<hr>
<a href="mp_class_management.do">mp_class_management</a><br/> -->
