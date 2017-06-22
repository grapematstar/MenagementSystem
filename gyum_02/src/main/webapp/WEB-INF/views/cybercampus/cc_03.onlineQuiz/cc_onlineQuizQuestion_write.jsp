<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>온라인문제 - 문제 만들기</title>
</head>
<body>
문제등록
<form>
과목
<select>
	<option selected>기타</option>
	<option><!-- 등록된 과목리스트 --></option>
</select>
문제유형
<input type="radio" name="choiceQuiz" value="선다">선다
<input type="radio" name="writeQuiz" value="서술">서술
<input type="radio" name="simpleQuiz" value="주관식">주관식단답
<input type="radio" name="oxQuiz" value="OX">OX
<input type="radio" name="coupleQuiz" value="짝짓기">짝짓기
<input type="radio" name="emptyQuiz" value="빈칸채우기">빈칸채우기
<input type="radio" name="numberQuiz" value="수치">수치

문제
<textarea></textarea>

힌트
<input type="text">
<input type="checkbox">보기순서섞기
이미지 첨부<input type="file">
<input type="button" value="다음">
<input type="button" value="닫기">
</form>
</body>
</html>