<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function open_lecture(){
	location.href="open_lectureForm.do";
}
</script>
</head>
<body>
<h2>강의 개설</h2>
<input type="button" value="강의 개설" onclick="open_lecture()">
</body>
</html>