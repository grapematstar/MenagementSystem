<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var count = ${dto2.size()}+1;
   var arr = new Array(count);
   $(document).ready(function(){
      $('#btn-add-row').click(function(){
   	
    	if(count<=5){
        $('#mytable > tbody:last').append('<tr><td><input type="text" id="c_t_q_o_num" name="c_t_q_o_num" value="'+count+'"></td><td><input type="text" id="c_t_q_o_option" name="c_t_q_o_option"></td></tr>');
        count++;
    	}
      });
      $('#btn-delete-row').click(function(){
         $('#mytable > tbody:last > tr:last').remove();
         count--;
      });
      $("#submitOn").click(function(){
    	  var list = new Object();
		  list.test_idx = $("#test_idx").val();
    	  list.c_t_q_num = $("#c_t_q_num").val();
    	  list.c_t_q_idx = $("#c_t_q_idx").val();
    	  list.c_t_q_score = $("#c_t_q_score").val();
    	  list.c_t_q_question = $("#c_t_q_question").val();
    	  list.c_t_q_answer = $("#c_t_q_answer").val();
    	  list.c_t_q_explain = $("#c_t_q_explain").val();
    	  list.c_question_Option_num = [];
    	  $("input[name='c_t_q_o_num']").each(function(){
    		  list.c_question_Option_num.push($(this).val());
    	  });
    	  list.c_question_Option_option = [];
    	  $("input[name='c_t_q_o_option']").each(function(){
    		  list.c_question_Option_option.push($(this).val());
    	  });
    	  $.ajax({
    		  type:"GET",
    		  url:"class_question_option_update.do",
    		  data:list,
    		  success:function(args){
    			  $('#myModal').hide();
    			  $('.modal-backdrop').hide();
    		  },
    		  error:function(e){
    			  $("#dialog").html(e.responseText);
    		  }
    	  });
      });
    });
   </script>
</head>
<body>
<h2>문제 수정</h2>
<c:set var="dto1" value="${dto1 }"/>
<c:set var="dto2" value="${dto2 }"/>
<table id="mytable" class="table table-striped table-bordered" width="100%"
			cellspacing="0">
	<tr>
		<th>문제번호</th>
		<td><input type="text" id="c_t_q_num" name="c_t_q_num" value="${dto1.c_t_q_num }" readonly>
			<input type="hidden" id="c_t_q_idx" name="c_t_p_idx" value="${dto1.c_t_q_idx }">
			<input type="hidden" id="test_idx" name="test_idx" value="${dto1.test_idx }">
			</td>
		<th>배점</th>
		<td><input type="text" id="c_t_q_score" name="c_t_q_score" value="${dto1.c_t_q_score }"></td>
	</tr>
	<tr>
		<th>문제</th>
		<td><textarea rows="2" cols="20" id="c_t_q_question" name="c_t_q_question">${dto1.c_t_q_question }</textarea></td>
		<th>답</th>
		<td><input type="text" id="c_t_q_answer" name="c_t_q_answer" value="${dto1.c_t_q_answer }"></td>
	</tr>
	<tr>
		<th>문제 해설</th>
		<td><textarea rows="2" cols="22" id="c_t_q_explain" name="c_t_q_explain">${dto1.c_t_q_explain }</textarea></td>
	</tr>
	<tr>
		<th>번호</th>
		<th>보기</th>
	</tr>
		<c:forEach var="dto2" items="${dto2 }">
		<tr>
		<td><input type="text" id="c_t_q_o_num_${dto2.c_t_q_o_num }" name="c_t_q_o_num" value="${dto2.c_t_q_o_num }"></td>
		<td><input type="text" name="c_t_q_o_option" value="${dto2.c_t_q_o_option }">
			
		</td>
		
		</tr>
		</c:forEach>
		<tbody></tbody>
		<tr>
		<td colspan="2" align="center">
		<button type="button" class=" btn btn-raised btn-primary" id="btn-add-row">보기 추가</button> 
		<button type="button" class=" btn btn-raised btn-primary" id="btn-delete-row">보기 삭제</button>   
		</td>
		</tr>
		</table>
		<p id="submitBt"><input type="button" id="submitOn" class=" btn btn-raised btn-primary" value="작성"></p>
</body>
</html>