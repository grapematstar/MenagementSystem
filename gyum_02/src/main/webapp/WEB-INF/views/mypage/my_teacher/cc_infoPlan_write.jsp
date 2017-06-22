<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의정보/계획</title>
</head>
<body>
<form name="cc_submitInfoPlanWrite" action="cc_submitInfoPlanWrite.do" method="POST">
강의명: <div><span><!-- 설정된 값에서 불러올 것임 --></span></div>
<input type="hidden" name="club_idx" id="club_idx" value="${club_idx}">
과목: <div><span></span></div>
<input type="hidden" name="subject_num" id="subject_num" value="${subject_num}">
강의개요<br>
<textarea name="c_i_p_overview" id="c_i_p_overview" rows="20" cols="100" required></textarea><br>
강의목표<br>
<textarea name="c_i_p_purpose" id="c_i_p_purpose" rows="20" cols="100" required></textarea><br>
<hr>
강의계획<br>
<fieldset>
<div style="display:none;">
<div id="PlanUNIT">
<div>단원: <input type="number" name="c_plan_unit">
세부계획: <textarea name="c_plan_content"></textarea></div>
<input type="button" value="삭제"></div>
</div>
<input type="submit" value="폼서브밋">
<input type="button" value="단원추가" id="addPlanUNIT">
<div id="addUnitLocation">
<div id="PlanUNIT1">
<div>단원: <input type="number" name="c_plan_unit">
세부계획: <textarea name="c_plan_content"></textarea></div>
<input type="button" value="삭제"></div>
</div>

</fieldset>
</form>
<input type="button" id="submitInfoPlanWrite" value="에이작스 등록">
<div id="dialog"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
var idNum=1;
var appendUnit=new Array;
$(document).ready(function(){
	$("#addPlanUNIT").click(function(){
		idNum++;
		appendUnit[idNum]=$("#PlanUNIT").clone(true);
		$("#addUnitLocation").append(appendUnit[idNum].attr("id","PlanUNIT"+idNum).show());
	});
	$("#submitInfoPlanWrite").click(function(){
		var params=new Object();
		params.c_i_p_overview=$("#c_i_p_overview").val();
		params.c_i_p_purpose=$("#c_i_p_purpose").val();
		params.c_plan_unit=[];
		$("input[name='c_plan_unit']").each(function(){
			params.c_plan_unit.push($(this).val());
		});
		params.c_plan_content=[];
		$("textarea[name='c_plan_content']").each(function(){
			params.c_plan_content.push($(this).val());
		});
		$.ajax({
			type:"POST",
			url:"cc_submitInfoPlanWrite.do",
			data:params,
			success:function(args){
				$("body").html(args);
			},
			error:function(e){
				$("#dialog").html(e.responseText);
			}
		});
	});
});
</script>
</body>
</html>