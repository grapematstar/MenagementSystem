<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="/gyum_02/build/js/httpRequest.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" 
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" 
	crossorigin="anonymous">
</script>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/asset/css/bootstrap.min.css">
<!-- plugins --> 
<link rel="stylesheet" type="text/css" 
href="/gyum_02/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" 
href="/gyum_02/asset/css/plugins/animate.min.css"/>
<link href="/gyum_02/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="/gyum_02/asset/img/logomi.png">
<!-- IO: Css -->
<link rel="stylesheet" type="text/css" href="/gyum_02/css/masterpage/mp_all.css"/>
<link rel="stylesheet" type="text/css" 
 href="/gyum_02/css/masterpage/mp_member/mp_student_eval.css"/>


<title>Insert title here</title>
</head>
<script>
var evalList = [];
var map = '${map}';
var classList = eval('('+map+')').classList;

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
					<select id="select_class_idx">
						<c:forEach var="i" begin="0" end="${fn:length(classList)}" step="1">
							<option value="${classList[i].class_idx }">
								${classList[i].class_subject }
							</option>
						</c:forEach>
					</select>
				</li>
				<li>
					<input type="text" id="searchText_stu_name" >
				</li>
				<li>
					<input type="button" value="검색" onclick="showClassEval()" 
					 id="button_search" class="btn btn-default">
				</li>
			</ul>
			<table id="table_eval" class="table table-hover">
				<tr class="tr_eval_2">
					<th>번호</th> <th>강의평가 목록</th> <th>강사명</th><th>수강생</th>
					<th>평점</th> <th>작성날짜</th> <th>비고</th>
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
							<span class="modal_span_stu_name">
								작성자 : <label id="modal_label_stu_name"></label>
							</span>
							<span class="modal_span_class_subject">
								강의명 : <label id="modal_label_class_subject"></label>
							</span>
							<table id="eval_note" class="table table-hover">
								<thead>
									<tr class="modal_tr_2">
										<th width="200">평가항목</th>
										<th width="120">매우그렇지않다</th>
										<th width="120">그렇지않다</th>
										<th width="120">보통</th>
										<th width="120">그렇다</th>
										<th width="120">매우그렇다</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="num" begin="0" end="${fn:length(question)-1}" step="1">
									<tr class="modal_tr_${num%2}">
										<td class="modal_td_c_e_q_question"
										 >${question[num].c_e_q_question }</td>
										<c:forEach var="num2" begin="1" end="5" step="1">
											<td align="center" id="modal_td_${num2}_${num}"
											 class="modal_td_c_e_q_a"></td>
										</c:forEach>
									</tr>
								</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6">
											<textarea id="c_e_note" name="c_e_note" readonly></textarea>
										</td>
									</tr>
								</tfoot>
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
	var modal_label_stu_name = document.getElementById('modal_label_stu_name');
	var modal_label_class_name = document.getElementById('modal_label_class_name');
	
	modal_label_stu_name.innerHTML = evalList[modal_selectIndex].stu_name;
	modal_label_class_subject.innerHTML = evalList[modal_selectIndex].class_subject;
	
	for(var i=1; i<=5; i++){
		for(var j=1; j<=5; j++){
			document.getElementById('modal_td_'+i+'_'+j).innerHTML = '';
		}
	}

	document.getElementById('modal_td_'+evalInfo.c_e_a1+'_1').innerHTML = '◎';
	document.getElementById('modal_td_'+evalInfo.c_e_a2+'_2').innerHTML = '◎';
	document.getElementById('modal_td_'+evalInfo.c_e_a3+'_3').innerHTML = '◎';
	document.getElementById('modal_td_'+evalInfo.c_e_a4+'_4').innerHTML = '◎';
	document.getElementById('modal_td_'+evalInfo.c_e_a5+'_5').innerHTML = '◎';
	document.getElementById('c_e_note').innerHTML = evalInfo.c_e_note;
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
		
		var td_stu_idx = document.createElement('td');
		td_stu_idx.setAttribute("class","td_stu_idx");
		tr.appendChild(td_stu_idx);
		var td_class_subject = document.createElement('td');
		td_class_subject.setAttribute("class","td_class_subject");
		tr.appendChild(td_class_subject);
		var td_tea_name = document.createElement('td');
		td_tea_name.setAttribute("class","td_tea_name");
		tr.appendChild(td_tea_name);
		var td_stu_name = document.createElement('td');
		td_stu_name.setAttribute("class","td_stu_name");
		tr.appendChild(td_stu_name);
		var td_eval_avg = document.createElement('td');
		td_eval_avg.setAttribute("class","td_eval_avg");
		tr.appendChild(td_eval_avg);
		var td_c_e_writedate = document.createElement('td');
		td_c_e_writedate.setAttribute("class","td_c_e_writedate");
		tr.appendChild(td_c_e_writedate);
		var td_c_e_note = document.createElement('td');
		td_c_e_note.setAttribute("class","td_c_e_note");
		tr.appendChild(td_c_e_note);
		
		
	//	td_e_s_modi_date.innerHTML = modal_e_s_modi_date.getFullYear()+"-"+
	//		modal_e_s_modi_date.getMonth()+"-"+modal_e_s_modi_date.getDate();
		td_stu_idx.innerHTML = evalList[i].stu_idx;
		var button_class_subject = "<input type='button' value='"+
			evalList[i].class_subject+
			"' data-toggle='modal' data-target='#myModal' "+
			"onclick='showModal("+i+","+evalList[i].stu_idx+","+
					evalList[i].class_idx+")' class='button_class_subject'>";
		
		td_class_subject.innerHTML = button_class_subject;
		td_tea_name.innerHTML = evalList[i].tea_name;
		td_stu_name.innerHTML = evalList[i].stu_name;
		td_eval_avg.innerHTML = evalList[i].eval_avg;
		
		var c_e_writedate_str =new Date((Date)(evalList[i].c_e_writedate).toString());
		var c_e_writedate = c_e_writedate_str.getFullYear()+"-"+
		c_e_writedate_str.getMonth()+"-"+c_e_writedate_str.getDate();
		td_c_e_writedate.innerHTML = c_e_writedate;
		td_c_e_note.innerHTML = evalList[i].c_e_note;
		
	}
}

var showClassEval = function() {
	
	var select_class_idx = document.getElementById('select_class_idx');
	var class_idx = select_class_idx.options[select_class_idx.selectedIndex].value;
	var searchText_stu_name = document.getElementById('searchText_stu_name').value;
	
	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	if(regExp.test(searchText_stu_name)){
		searchText_stu_name = searchText_stu_name.replace(regExp, "");
	}
	
	$.ajax({
        url: "mp_student_eval_list.do?class_idx="+class_idx+
        		"&stu_name="+searchText_stu_name,
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

function showModal(modal_selectIndex, stu_idx, class_idx) {
	//select * from class_eval
	//where stu_idx = 3 and class_idx = 49
	
	$.ajax({
        url: "mp_evalInfo.do?stu_idx="+stu_idx+"&class_idx="+class_idx,
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
    <script src="asset/js/jquery.min.js"></script>
    <script src="asset/js/jquery.ui.min.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
   
    
    <!-- plugins -->
    <script src="asset/js/plugins/moment.min.js"></script>
    <script src="asset/js/plugins/fullcalendar.min.js"></script>
    <script src="asset/js/plugins/jquery.nicescroll.js"></script>
    <script src="asset/js/plugins/jquery.vmap.min.js"></script>
    <script src="asset/js/plugins/maps/jquery.vmap.world.js"></script>
    <script src="asset/js/plugins/jquery.vmap.sampledata.js"></script>
    <script src="asset/js/plugins/chart.min.js"></script>


    <!-- custom -->
     <script src="asset/js/main.js"></script>


</html>