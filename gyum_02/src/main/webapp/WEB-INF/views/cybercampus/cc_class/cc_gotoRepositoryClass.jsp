
<ul class="pagination">
<li class="paginate_button previous disabled" id="datatables-example_previous">
<a href="#" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a></li>
<li class="paginate_button active"><a href="#" aria-controls="datatables-example" data-dt-idx="1" tabindex="0">1</a></li>
<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="2" tabindex="0">2</a></li>
<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="3" tabindex="0">3</a></li>
<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="4" tabindex="0">4</a></li>
<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="5" tabindex="0">5</a></li>
<li class="paginate_button "><a href="#" aria-controls="datatables-example" data-dt-idx="6" tabindex="0">6</a></li>
<li class="paginate_button next" id="datatables-example_next"><a href="#" aria-controls="datatables-example" data-dt-idx="7" tabindex="0">Next</a></li></ul>






<%-- <%@page import="java.util.*"%>
<%@ page import="gyum_02.commons.ControllerSurpport" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" 
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>
<script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script>
<title>Insert title here</title>
</head>

<script>
var jsonList = eval('(${jsonList})');

</script>
<body>
	<input type="button" value="게시판 띄우기" data-toggle="modal" 
	 data-target="#modalBoard" id="input_modalBoard" onclick="modalInit()">

	<!-- Modal 과제 제출 현황-->
	<div class="modal fade" id="modalBoard" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close"
					 data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과제물 제출</h4>
				</div>
				<div class="modal-body" id="modal_div_cc_repository">
					<table>
						<tr>
							<td>
			<table border="1" cellspacing="0" 
				id="modal_table_cc_repository">
				<tr>
			   		<th>번호</th> <th>과제물 목록</th> <th>작성자</th> 
			   		<th>작성날짜</th>
			   		<th>마감기한</th> <th>상태</th> <th>현황</th>
				</tr>
			   	<c:forEach var="i" begin="1" end="${fn:length(list)}" 
			   	 step="1">
			   		<tr onclick="modalClickEvent(${i-1})"
			   		 id="modal_tr_repository_${i-1}">
			   			<td>${list[i-1].c_h_t_idx }</td>
			   			<td>${list[i-1].c_h_t_subject}</td>
			   			<td>${list[i-1].tea_name}</td>
			   			<td>${list[i-1].c_h_t_writedate.getYear()+1900}
			   			- ${list[i-1].c_h_t_writedate.getMonth()+1}
			   			- ${list[i-1].c_h_t_writedate.getDate() }</td>
			   			<td>${list[i-1].c_h_t_enddate.getYear()+1900}
			   			- ${list[i-1].c_h_t_enddate.getMonth()+1}
			   			- ${list[i-1].c_h_t_enddate.getDate() }</td>
			   			<!-- 마감여부 / db에서 계산해서 가져옴, dto에 있음-->
			   			<td>${list[i-1].c_h_t_present}</td>
			   			<!-- 제출여부 / db에서 계산해서 가져옴, dto에 있음-->
			   			<td>${list[i-1].c_h_t_status }</td>
			   		</tr>
			   	</c:forEach>
			</table>
							</td>
							<td id="modal_td_work">
							</td >
						</tr>
					
					</table>
				</div>
				<div id="modal_div_footer" class="modal-footer">
					<c:if test="${user=='student'}">
						<button type="button" class="btn btn-default" 
						 data-toggle="modal" data-target="#modalWork"
						 onclick="modalWorkInsert()"
						 disabled="disabled" id="modal_button_workInsert">
						  과제 제출</button> 
					</c:if>
					<c:if test="${user=='teacher' }">
						<button type="button" data-toggle="modal" 
						id="modalOpenButtonTemp" data-target="#modalWorkRegister">
						 과제 등록
						</button>
					</c:if>
					<button type="button" class="btn btn-default"
					 data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal 과제 생성기-->
	<div class="modal fade" id="modalWorkRegister" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close"
					 data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과제물 생성</h4>
				</div>
				<div class="modal-body" id="modal_div_workRegister" align="center">
					<form id="modal_form_workRegister" action="cc_workRegister.do"
					 enctype="multipart/form-data" method="post" 
					  name="modal_form_workRegister">
						<table border="1">
							<tr>
								<td>
					<ul>
						<li>
							<label>작성자</label>
							<input type="text" value="${dto.tea_name }"
							name="tea_name" readonly="readonly">
						</li>
						<li>
							<label>제목</label>
							<input type="text" name="c_h_t_subject">
						</li>
						<li>
							<label>제출시작</label>
							<input type="text" name="c_h_t_startdate">
						</li>
						<li>
							<label>마감기한</label>
							<input type="text" name="c_h_t_deadline">
						</li>
						<li>
						</li>
					</ul>
								</td>
								<td>
									<label>주의사항</label>
									<textarea rows="30" cols="15" 
									 name="c_h_t_notice"></textarea>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div id="modal_div_footer" class="modal-footer">
					<button type="button" class="btn btn-default" 
					 data-toggle="modal" id="modal_button_workRegister"
					 onclick="modalWorkRegister()">
					  과제 등록</button> 
					<button type="button" class="btn btn-default" 
					 id="modal_button_workClose" data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>
	
</body>

<script>
var modalInit = function() {
	document.getElementById('modal_td_work').innerHTML = '';
}

var modalWorkInsertResetting = function(i) {
	
	var modal_td_work = 
		document.getElementById('modal_td_work');
	modal_td_work.innerHTML = 
		"<hr>"+
		"<h2>과제물 제출</h2>"+
		"<hr>"+
		"<form action=\"cc_workInsert.do\" id=\"modal_form_workInsert\""+
		"enctype=\"multipart/form-data\" method=\"post\">"+
		"<ul>"+
		"<li>"+
		"<textarea cols=\"30\" rows=\"15\">"+jsonList[i].c_h_t_subject+"\n"+
		jsonList[i].c_h_t_notice+"\n"+
		"</textarea>"+
		"</li>"+
		"<li>"+
		"<input type=\"file\" name=\"modal_form_workInsert\""+
		"value=\"파일 업로드\" >"+
		"</li>"+
//		"<li>"+
//		"<input class=\"btn btn-default\" type=\"submit\" "+
//		" value=\"저장\">"+
//		"<button type=\"button\" class=\"btn btn-default\""+
//		"data-dismiss=\"modal\">close</button>"+
//		"</li>"+
		"</ul>"+
		"</form>";
		
	var modal_button_workInsert = 
		document.getElementById('modal_button_workInsert');
	if(jsonList[i].c_h_t_present=='마감'){
		modal_button_workInsert.setAttribute("disabled","disabled");
	}else{
		modal_button_workInsert.removeAttribute("disabled");
	}
}

var modalWorkViewResetting = function(i) {
	
	var modal_td_work = 
		document.getElementById('modal_td_work');
	modal_td_work.innerHTML = 
		"<hr>"+
		"<h2>과제물 확인</h2>"+
		"<hr>"+
		"<ul>"+
		"<li>"+
		"<textarea cols=\"30\" rows=\"15\">"+jsonList[i].c_h_t_subject+"\n"
		jsonList[i].c_h_t_notice+"\n"+
		"</textarea>"+
		"</li>"+
		"<li>"+
		"<input type=\"file\""+
		"value=\"파일 업로드\" >"+
		"</li>"+
		"</ul>";
	
}


var modalWorkInsert = function() {
	$('#modal_form_workInsert').submit();
}

var modalWorkRegister = function() {
	$('#modal_form_workRegister').submit();
}

var modalClickEvent = function(i) {
	if('${user}'=='student'){
		modalWorkInsertResetting(i);
	}else if('${user}'=='teacher'){
		modalWorkViewResetting(i);
	}
}

</script>
</html>
<script>
if('${msg}'!=''){
	alert('${msg}');
	$('#input_modalBoard').click();
	if('${count}'<=0){
		$('#modalOpenButtonTemp').click();
	}
}
</script>

 --%>