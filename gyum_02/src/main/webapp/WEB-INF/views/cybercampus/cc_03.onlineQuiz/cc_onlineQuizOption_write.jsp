<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문제보기 작성하기</title>
</head>
<body>
문제:${before question }
<fieldset>
	<legend>보기항목</legend>
	<input type="button" value="보기항목추가">
	<!-- 1번보기 --><textarea></textarea><input type="button" value="삭제">
	<!-- 2번보기 --><textarea></textarea><input type="button" value="삭제">
</fieldset>
<input type="submit" value="등록">
<input type="button" value="닫기">
</body>
</html>