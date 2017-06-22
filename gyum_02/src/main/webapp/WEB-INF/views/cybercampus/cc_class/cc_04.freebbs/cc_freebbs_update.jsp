<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
</head>
<body>
	<form name="cc_submitFreeBBSUpdate" action="cc_submitFreeBBSUpdate.do" method="POST">
	<div class="row">
		<c:set var="dto" value="${dto}" />
		<table width="100%">
			<thead>
				<tr>
					<th>작성날짜</th>
					<td>${dto.string_writedate}</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>${dto.c_f_b_writer}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="c_f_b_subject" value="${dto.c_f_b_subject}"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2"><pre><textarea cols="100" rows="5" name="c_f_b_content">${dto.c_f_b_content}</textarea></pre></td>
				</tr>
			</tbody>
		</table>
	<div style="text-align:right"><input type="submit" class="btn btn-primary" value="수정"></div>
	</div>
	<input type="hidden" name="c_f_b_idx" value="${dto.c_f_b_idx}">
	</form>
</body>
</html>