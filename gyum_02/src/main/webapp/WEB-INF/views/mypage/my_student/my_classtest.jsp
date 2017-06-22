<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- stylesheet -->
<!-- start: Css -->
<link rel="stylesheet" type="text/css"
   href="asset/css/bootstrap.min.css">

<!-- plugins -->
<link rel="stylesheet" type="text/css"
   href="asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
   href="asset/css/plugins/simple-line-icons.css" />
<link rel="stylesheet" type="text/css"
   href="asset/css/plugins/mediaelementplayer.css" />
<link rel="stylesheet" type="text/css"
   href="asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
   href="asset/css/plugins/icheck/skins/flat/red.css" />
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">
<script>
<!--
function timeStart(){
   document.getElementById("label_timeStart").value;
   window.setTimeout('timeStart()',1000);
   
}
-->



function stu_onetest(test_idx,q){
   location.href='stu_onetest.do?test_idx='+test_idx+'&c_t_q_idx='+q;
}   
      
</script>
</head>
<body id="mimin" class="dashboard" style="width:1200px;">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/mypage_sidemenu.jsp" %>
<div id="content" class="article-v1">
         <div class="panel ">
            <div class="panel-body">
               <div class="col-md-12">
                  <h2 class="animated fadeInLeft">등록된 시험</h2>
                  <p class="animated fadeInDown">시험 시간 준수해 주시기 바랍니다.</p>
                  <p class="animated fadeInDown">시험 시간은 오전 10시부터 오후 10시까지 입니다.</p>
               </div>
            </div>
         </div>
         <div class="panel " style="margin-top:20px;">
         
                  <div class="panel-body">
                     <div class="col-md-12 padding-0" style="padding-bottom: 20px;">
                        <div class="col-md-6" style="padding-left: 10px;"></div>
                        <div class="col-md-6">
                           <div class="col-lg-12">
                              <div class="input-group">
                                 <div class="input-group-btn"></div>
                                 <!-- /btn-group -->
                              </div>
                              <!-- /input-group -->
                           </div>
                           <!-- /.col-lg-6 -->
                        </div>
                     </div>
                     <div class="responsive-table">
<table  class="table table-striped table-bordered" width="100%" cellspacing="0">
   <thead>
   <tr>
      <th>번호</th>
      <th>과목</th>
      <th>과목명</th>
      <th>강의실</th>
      <th>시험종류</th>
      <th colspan="2">문제풀기</th>
   </tr>
   </thead>
   <tbody>
   <c:if test="${empty test_list }">
      <tr>
         <td colspan="3" align="center">등록된 시험이 없습니다.</td>
      </tr>
   </c:if>
   <c:forEach var="test_list" items="${test_list }">
      <tr>
         <td>${test_list.c_t_q_idx }</td>
         <c:if test="${test_list.c_t_testnum==1}">
         <td>국어</td>
         </c:if>
         <c:if test="${test_list.c_t_testnum==2}">
         <td>영어</td>
         </c:if>
         <c:if test="${test_list.c_t_testnum==3}">
         <td>수학</td>
         </c:if>
         <c:if test="${test_list.c_t_testnum==4}">
         <td>사회</td>
         </c:if>
         <c:if test="${test_list.c_t_testnum==5}">
         <td>과학</td>
         </c:if>
         <td>${test_list.class_subject }</td>
         <td>${test_list.classroom }호</td>
         <c:if test="${test_list.c_t_testnum==1 }">
         <td>중간 고사</td>
         </c:if>
         <c:if test="${test_list.c_t_testnum==2 }">
         <td>기말 고사</td>
         </c:if>
         <td><input  type="button" class=" btn btn-raised btn-primary" value="문제풀기" onclick="stu_onetest(${test_list.test_idx},${test_list.c_t_q_idx })"></td>
      </tr>
   </c:forEach>
</table>
   <div class="col-md-6">
                        <ul class="pagination pull-right">
                          <li>
                            <a href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <li class="active">${test_pageStr }</li>
                          <li>
                            <a href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                  </div>
                  </div>
                  </div>
</div>
</div>
</div>
</div>
</div>
<!-- start: Javascript -->
   <script src="asset/js/jquery.min.js"></script>
   <script src="asset/js/jquery.ui.min.js"></script>
   <script src="asset/js/bootstrap.min.js"></script>


   <!-- plugins -->
   <script src="asset/js/plugins/moment.min.js"></script>
   <script src="asset/js/plugins/icheck.min.js"></script>
   <script src="asset/js/plugins/jquery.nicescroll.js"></script>


   <!-- custom -->
   <script src="asset/js/main.js"></script>
   </body>
</html>