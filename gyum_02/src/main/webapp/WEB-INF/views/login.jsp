<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form action="login.do" method="post">
<fieldset>
	<legend>수강생 로그인하기</legend>
	id : <input type="text" name="id" value="${cid}">
	pw : <input type="password" name="pwd"><br>
	<input type="submit" value="확인">
	<input type="checkbox" name="idchk" ${empty cid?"":"checked='true'"}>아이디 기억하기
</fieldset>
</form>
</body>
</html>