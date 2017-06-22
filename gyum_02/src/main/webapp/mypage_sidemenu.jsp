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
							Dashboard <span class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="index.do">학원관리프로그램</a></li>
					</ul>
				</li>
				
				<c:if test="${'student' eq usergrade }">	
				<li class="ripple"><a class="tree-toggle nav-header" href="#"> <span
					class="fa-diamond fa"></span>수강생</a></li>
					
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-pencil-square"></span>수강신청<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="sg_favorcartview.do">수강장바구니</a></li>
						<li><a href="sg_index.do">과목 리스트</a></li>
						<li><a href="sg_payment.do">결제내역 및 취소</a></li>
					</ul>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-check-square-o"></span>강의목록<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="my_student_classList.do">강의내역</a></li>
						<li><a href="my_student_timetable_view.do">강의시간표 보기</a></li>
						<li><a href="my_student_timetable_write.do">강의시간표 작성</a></li>
						<li><a href="my_student_attendance.do">출결확인</a></li>
						<li><a href="my_student_class_eval.do">강의평가</a></li>
						<li><a href="my_stuclass_test_List.do">시험보기</a></li>
					</ul>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-check-square-o"></span>개인성적조회<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="my_student_score_school.do">학교성적추이</a></li>
						<li><a href="my_student_score_school_goal.do">학교목표성적</a></li>
						<li><a href="my_student_score_class.do">강의별성적</a></li>
					</ul>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-check-square-o"></span>스터디<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="study_enter_go.do">스터디 내역</a></li>
						<li><a href="study_reqlist_go.do">스터디 신청내역</a></li>
						<li><a href="study_req_recivlist_go.do">스터디 신청받은 내역</a></li>
						<li><a href="study_inq_sendlistgo.do">스터디 문의 내역</a></li>
						<li><a href="study_inq_recivlistgo.do">스터디 문의받은 내역</a></li>
					</ul>
				</li>
								
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-check-square-o"></span>개인정보<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="stu_information.do">계정관리</a></li>
						<li><a href="qna.do">나의 문의내역</a></li>
						<li><a href="chat.do">실시간 상담</a></li>
						<li><a href="stu_infoDel.do">회원탈퇴</a></li>
					</ul>
				</li>
				</c:if>
				
				
				<c:if test="${'parent' eq usergrade }">
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa-diamond fa"></span>학부모</a></li>
					
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-pencil-square"></span>학부모 상담<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="qna.do">상담글 작성</a></li>
						<li><a href="chat.do">실시간 상담</a></li>
					</ul>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header" 
					href="/gyum_02/my_parent_cctv.do"><span
					class="fa fa-pencil-square"></span>CCTV</a>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-pencil-square"></span>자녀 정보<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="my_parent_attendCheck.do">출결확인</a></li>
						<li><a href="my_parent_score_schoolAll.do">학교 성적 확인</a></li>
						<li><a href="my_parent_classScore.do">학원 성적 확인</a></li>
					</ul>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-check-square-o"></span>개인정보<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="par_information.do">계정관리</a></li>
						<li><a href="qna.do">나의 문의내역</a></li>
						<li><a href="par_infoDel.do">회원탈퇴</a></li>
					</ul>
				</li>
				</c:if>
				
				
				<c:if test="${'teacher' eq usergrade }">
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa-diamond fa"></span>강사</a></li>
					
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-pencil-square"></span>강의 목록<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="class_test_Write.do">온라인 시험 작성</a></li>
						<li><a href="my_teacher_class_eval_check.do">강의평가 결과조회</a></li>
						<li><a href="my_teacher_class_timetable.do">강의시간표</a></li>
					</ul>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-pencil-square"></span>강의 개설<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="open_lectureForm.do">강의 개설 신청</a></li>
						<li><a href="class_check.do">신청 결과 조회</a></li>
					</ul>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-pencil-square"></span>학생부<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="my_teacher_class_student_attend_All.do">출결 관리</a></li>
						<li><a href="my_teacher_class_student_score_All.do">강의별 성적 현황</a></li>
					</ul>
				</li>
				
				<li class="ripple"><a class="tree-toggle nav-header"> <span
					class="fa fa-check-square-o"></span>개인정보<span
					class="fa-angle-right fa right-arrow text-right"></span></a>
					<ul class="nav nav-list tree">
						<li><a href="tea_information.do">계정관리</a></li>
						<li><a href="qna.do">나의 문의내역</a></li>
						<li><a href="tea_infoDel.do">회원탈퇴</a></li>
					</ul>
				</li>
				</c:if>
      </ul>
   </div>
  </div>
<!-- 사이드바 끝 -->
</html>