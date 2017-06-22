<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <section style="width: 300px;float: left; ">
<table>
<tr>
	<td width="300" align="center"><h3><a href="study_setup_go.do">설정</a></h3></td>
</tr>
<tr>
	<td width="300" align="center"><h3><a href="studybbsgo.do?study_bbsref=0">공지</a></h3></td>
</tr>
<tr>
	<td width="300" align="center"><h3><a href="study_schedule.do">일정</a></h3></td>
</tr>
<tr>
	<td width="300" align="center"><h3>게시판</h3></td>
</tr>
<tr><td width="300" align="center"><h5><a href="studydayreportgo.do">-일일 일지</a></h5></td></tr>
<c:forEach var="bbsname" items="${sessionScope.bbsnamelist }">
	<tr><td width="300" align="center"><div id="sidelist"></div><h5><a href="studybbsgo.do?study_bbsref=${bbsname.study_bbsref }">-${bbsname.study_bbsname }</a></h5></td></tr>
</c:forEach>	
 	
 	<tr><td width="300" align="center"><h5><a href="studyvotebbsgo.do">-투표 게시판</a></h5></td></tr>
	<tr><td width="300" align="center"><h5><a href="studydatabbsgo.do">-자료 게시판</a> </h5></td></tr>
 
</table>
</section> --%>



<div id="left-menu">
   <div class="sub-left-menu scroll">
      <ul class="nav nav-list">      	
      	 <li class="time">
                <h1 class="animated fadeInLeft">21:00</h1>
                <p class="animated fadeInRight">Sat,October 1st 2029</p>
              </li>
					<li class="active ripple">
						<a class="tree-toggle nav-header" href="study.do?study_idx=${sessionScope.study_idx }"><span class="fa-home fa"></span>
							스터디							
						</a>					
					</li>
					<li class="ripple">
						<a class="tree-toggle nav-header" href="study_setup_go.do"> <span class="fa-diamond fa"></span> 
						설정</a>
					</li>
					<li class="ripple">
						<a class="tree-toggle nav-header"  href="studybbsgo.do?study_bbsref=0"> <span class="fa fa-pencil-square"></span> 
						공지 사항
						</a>
					</li>
					<li class="ripple"><a class="tree-toggle nav-header" href="study_schedule.do"> <span
							class="fa fa-calendar"></span> 일정 </a>
					</li>
							
         			<li class="ripple"><a class="tree-toggle nav-header" href="studydayreportgo.do"> <span
							class="fa fa-file-code-o"></span> 일일 일지 </a>
					</li>
					
					<c:forEach var="bbsname" items="${sessionScope.bbsnamelist }">			
         				<li class="ripple"><a class="tree-toggle nav-header" href="studybbsgo.do?study_bbsref=${bbsname.study_bbsref }"> 
         					<span class="fa fa-envelope-o"></span> 
         					${bbsname.study_bbsname } </a>
       					</li>
					</c:forEach>
							
			         <li class="ripple"><a class="tree-toggle nav-header" href="studyvotebbsgo.do"> <span
							class="fa fa-table"></span> 투표 게시판 </a></li>
         
         			<li class="ripple"><a class="tree-toggle nav-header" href="studydatabbsgo.do"> <span
							class="fa fa-table"></span> 자료게시판 </a></li>
					  <li class="ripple"><a class="tree-toggle nav-header">　</a></li>
						
      </ul>
   </div>
  </div>