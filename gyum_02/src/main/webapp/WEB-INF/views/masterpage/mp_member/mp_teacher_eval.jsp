<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
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

<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="/gyum_02/asset/css/plugins/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/gyum_02/asset/css/plugins/simple-line-icons.css" />
<link rel="stylesheet" type="text/css"
	href="/gyum_02/asset/css/plugins/animate.min.css" />
<link rel="stylesheet" type="text/css"
	href="/gyum_02/asset/css/plugins/fullcalendar.min.css" />
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- IO: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_member/mp_teacher_eval.css"/>

<title>Insert title here</title>
</head>
<script>
var evalList = [];
var modal_stu_number = 0;
</script>
<body id="mimin" class="dashboard">
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
	<div id="content" class="article-v1">
		<div class="div_content_border">
			<!-- mp - header -->
			<div class="div_header">
				<a onclick="href='mp_student_eval.do'"><span id="span_student_do">수강생</span
				></a><a onclick="href='mp_teacher_eval.do'"><span id="span_teacher_do">강사</span
				></a>
			</div>
			<!-- /mp - header -->
			<ul>
				<li>
					<input type="text" id="searchText" >
				</li>
				<li>
					<input type="button" value="검색" onclick="showTeacherEval()" 
					 id="button_search"  class="btn btn-default">
				</li>
			</ul>
			<table id="table_eval" class="table table-hover">
				<tr class="tr_eval_2">
					<th>반번호</th> <th>강의평가 목록</th> <th>강사명</th><th>평점</th>
					<th>최초 작성날짜</th> <th>마지막 작성 날짜</th> <th>작성 인원</th><th>총인원</th>
				</tr>
			</table>
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
		
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close"
							 data-dismiss="modal">&times;</button>
							<h4 class="modal-title">이것은 타이틀</h4>
						</div>
						<div class="modal-body">
							<h2>강의평가</h2>
							<table id="modal_table_title">
								<tr>
									<td class="modal_td_tea_name"
									>강사명 : <label id="modal_label_tea_name"></label>
									</td>
									<td class="modal_td_class_subject"
									>강의명 : <label id="modal_label_class_subject"></label>
									</td>
									<td class="modal_td_stu_on_eval"
									>평가한 인원 : <label id="modal_label_stu_on_eval"></label>
									</td>
									<td class="modal_td_stu_total"
									>총 인원 : <label id="modal_label_stu_total"></label>
									</td>
									<td  class="modal_td_eval_avg"
									>평점 : <label id="modal_label_eval_avg"></label>
									</td>
									
								</tr>
							</table>
							<table id="modal_table_eval" class="table table-hover">
								<thead>
									
								</thead>
								<tbody>
								<tr class="modal_tr_2">
									<c:forEach var="num_th" begin="0" 
									 end="${fn:length(question)-2}" step="1">
										<th>
											${question[num_th].c_e_q_question}
										</th>
										<c:if test="${num_th%4==3 }">
											</tr>
											<tr class="modal_tr_1">
												<c:forEach var="num_td" begin="0" 
												 end="3" step="1">
													<td id="modal_td_evg_${((num_th+1)%4)+num_td}">
													</td>
													<c:set var="last_td_num" value="${num_td}"></c:set>
												</c:forEach>
											</tr> 
											<tr class="modal_tr_${num_th%4==2?1:2 }">								
										</c:if>
									</c:forEach>
									<c:if test="${(fn:length(question)-1)%4>0}">
										<c:forEach var="num_td" begin="${last_td_num+1}" 
										 end="${fn:length(question)-1}" step="1">
										 	</tr>
										 	<tr class="modal_tr_1">
												<td id="modal_td_evg_${num_td}">
												</td>
										</c:forEach>
									</c:if>
									</tr>
								</tbody>
							</table>
							<table id="modal_table_notes" class="table table-hover">
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
							 data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>

function listReset() {
	if(evalList.length==0 || evalList==null){
		return;
	}
	var table_eval = document.getElementById('table_eval');
	for(var i=evalList.length; i>0; i--){
		table_eval.removeChild(table_eval.childNodes[i+1]);
	}
}

function modalReset(modal_selectIndex, evalInfo){
	
	var modal_label_tea_name = document.getElementById('modal_label_tea_name');
	var modal_label_class_subject = document.getElementById('modal_label_class_subject');
	modal_label_tea_name.innerHTML = evalList[modal_selectIndex].tea_name;
	modal_label_class_subject.innerHTML = evalList[modal_selectIndex].class_subject;
	var modal_label_stu_on_eval = document.getElementById('modal_label_stu_on_eval');
	var modal_label_stu_total = document.getElementById('modal_label_stu_total');
	var modal_label_eval_avg = document.getElementById('modal_label_eval_avg');
	modal_label_stu_on_eval.innerHTML = evalList[modal_selectIndex].stu_on_eval;
	modal_label_stu_total.innerHTML = evalList[modal_selectIndex].stu_total;
	modal_label_eval_avg.innerHTML = evalList[modal_selectIndex].eval_avg;
	
	var modal_td_evg = document.getElementById('modal_td_evg_0');
	modal_td_evg.innerHTML = evalInfo.c_e_a1_avg;
	modal_td_evg = document.getElementById('modal_td_evg_1');
	modal_td_evg.innerHTML = evalInfo.c_e_a2_avg;
	modal_td_evg = document.getElementById('modal_td_evg_2');
	modal_td_evg.innerHTML = evalInfo.c_e_a3_avg;
	modal_td_evg = document.getElementById('modal_td_evg_3');
	modal_td_evg.innerHTML = evalInfo.c_e_a4_avg;
	modal_td_evg = document.getElementById('modal_td_evg_4');
	modal_td_evg.innerHTML = evalInfo.c_e_a5_avg;
	
	var modal_table_notes = document.getElementById('modal_table_notes');
	for(var i=0; i<=parseInt(modal_stu_number/4); i++){
		modal_table_notes.removeChild(modal_table_notes.childNodes[i]);
	}
	var modal_tr = document.createElement('tr');
	modal_table_notes.appendChild(modal_tr);
	
	var c_e_note_splits = evalInfo.c_e_note.split('|');
	
	for(var i=0; i<c_e_note_splits.length; i++){
		if(i!=0 && i%4==0){
			modal_tr = document.createElement('tr');
			modal_table_notes.appendChild(modal_tr);
		}
		var modal_td_c_e_note = document.createElement('td');
		modal_td_c_e_note.setAttribute("id", "modal_td_notes");
//		modal_td_c_e_note.setAttribute("width", "120");
		modal_tr.appendChild(modal_td_c_e_note);
		modal_td_c_e_note.innerHTML = c_e_note_splits[i];
	}
	 
	modal_stu_number = c_e_note_splits.length;
}

function evalPlus() {
	var table_eval = document.getElementById('table_eval');
	
	for(var i=0; i<evalList.length; i++){
		var tr =  document.createElement('tr');
		tr.setAttribute("class","tr_eval_"+(i%2));
		table_eval.appendChild(tr);
		
	//	student.stu_idx, student.stu_name, class.class_idx,
  //      teacher.tea_idx, teacher.tea_name, class.class_subject,
   //     (class_eval.c_e_a1+class_eval.c_e_a2+class_eval.c_e_a3
   //     +class_eval.c_e_a4+class_eval.c_e_a5)/5 as eval_avg
		
		var td_class_idx = document.createElement('td');
		td_class_idx.setAttribute("class","td_class_idx");
		tr.appendChild(td_class_idx);
		var td_class_subject = document.createElement('td');
		td_class_subject.setAttribute("class","td_class_subject");
		tr.appendChild(td_class_subject);
		var td_tea_name = document.createElement('td');
		td_tea_name.setAttribute("class","td_tea_name");
		tr.appendChild(td_tea_name);
		var td_eval_avg = document.createElement('td');
		td_eval_avg.setAttribute("class","td_eval_avg");
		tr.appendChild(td_eval_avg);
		var td_min_c_e_writedate = document.createElement('td');
		td_min_c_e_writedate.setAttribute("class","td_min_c_e_writedate");
		tr.appendChild(td_min_c_e_writedate);
		var td_max_c_e_writedate = document.createElement('td');
		td_max_c_e_writedate.setAttribute("class","td_max_c_e_writedate");
		tr.appendChild(td_max_c_e_writedate);
		var td_stu_on_eval = document.createElement('td');
		td_stu_on_eval.setAttribute("class","td_stu_on_eval");
		tr.appendChild(td_stu_on_eval);
		var td_stu_total = document.createElement('td');
		td_stu_total.setAttribute("class","td_stu_total");
		tr.appendChild(td_stu_total);

		td_class_idx.innerHTML = evalList[i].class_idx;
		
		var button_class_subject = "<input type='button' value='"+
			evalList[i].class_subject+
			"' data-toggle='modal' data-target='#myModal' "+
			"onclick='showModal("+i+","+evalList[i].class_idx+
			")' class='button_class_subject'>";
		td_class_subject.innerHTML = button_class_subject;
		td_tea_name.innerHTML = evalList[i].tea_name;
		td_eval_avg.innerHTML = evalList[i].eval_avg;
		
		var min_c_e_writedate_str =
			new Date((Date)(evalList[i].min_c_e_writedate).toString());
		var min_c_e_writedate = min_c_e_writedate_str.getFullYear()+"-"+
		min_c_e_writedate_str.getMonth()+"-"+min_c_e_writedate_str.getDate();
		 
		var max_c_e_writedate_str =
			new Date((Date)(evalList[i].max_c_e_writedate).toString());
		var max_c_e_writedate = max_c_e_writedate_str.getFullYear()+"-"+
		max_c_e_writedate_str.getMonth()+"-"+max_c_e_writedate_str.getDate();
		
		td_min_c_e_writedate.innerHTML = min_c_e_writedate;
		td_max_c_e_writedate.innerHTML = max_c_e_writedate;
		td_stu_on_eval.innerHTML = evalList[i].stu_on_eval;
		td_stu_total.innerHTML = evalList[i].stu_total;
	}
	
}

var showTeacherEval = function() {
	 
	var searchText = document.getElementById('searchText').value;
	
	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	if(regExp.test(searchText)){
		searchText = searchText.replace(regExp, "");
	}
	$.ajax({
        url: "mp_teacher_eval_list.do?&searchText="+searchText,
        type: "GET",
        data: null,
        dataType: "json",
        contentType: "application/json",
        success: function(data) {
        	listReset();
        	evalList = data.evalList;
        	evalPlus();
        },
        error:function(data){
        }
    });
}

function showModal(modal_selectIndex, class_idx) {
	//select * from class_eval
	//where stu_idx = 3 and class_idx = 49
	
	$.ajax({
        url: "mp_evalAvgInfo.do?class_idx="+class_idx,
        type: "GET",
        data: null,
        dataType: "json",
        contentType: "application/json",
        success: function(data) {
        	evalInfo = data.evalInfo;
        	modalReset(modal_selectIndex, evalInfo);
        },
        error:function(data){
        }
    });
}

</script>
    <!-- start: Javascript -->
    <script src="/gyum_02/asset/js/jquery.min.js"></script>
    <script src="/gyum_02/asset/js/jquery.ui.min.js"></script>
    <script src="/gyum_02/asset/js/bootstrap.min.js"></script>
   
    <!-- plugins -->
    <script src="/gyum_02/asset/js/plugins/moment.min.js"></script>
    <script src="/gyum_02/asset/js/plugins/fullcalendar.min.js"></script>
    <script src="/gyum_02/asset/js/plugins/jquery.nicescroll.js"></script>
    <script src="/gyum_02/asset/js/plugins/jquery.vmap.min.js"></script>
    <script src="/gyum_02/asset/js/plugins/maps/jquery.vmap.world.js"></script>
    <script src="/gyum_02/asset/js/plugins/jquery.vmap.sampledata.js"></script>
    <script src="/gyum_02/asset/js/plugins/chart.min.js"></script>

    <!-- custom -->
     <script src="/gyum_02/asset/js/main.js"></script>
</html>