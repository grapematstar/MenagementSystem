<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/header.jsp" %>
<h2>학부모 회원가입</h2>
<section>
	<article>
		<form name="joinwrite_sp" action="joinwrite_sp.do">
			<table border="1" cellspacing="0" width="500">
				<tr>
					<th>아이디</th>
					<td colspan="3"><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd"></td>
					<th>비밀번호 확인</th>
					<td><input type="password" name="pwd_a"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="3"><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="3"><input type="text" name="tel"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3"><input type="text" name="email"></td>
				</tr>
				<tr>	
					<th>자녀</th>
					<td colspan="3"><input type="text" name="student"></td>
				</tr>
				<tr align="center">
					<td colspan="4"><input type="submit" value="회원가입"><input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>
	</article>
</section>
</body>
</html>