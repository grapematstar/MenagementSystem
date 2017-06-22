<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<table width="100%">
		<thead>
			<tr>
				<th>일차</th>
				<th>수업날짜</th>
				<th>출결상황</th>
				<th>특이사항</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.rnum}일차</td>
				<td>${list.string_attenddate}
				</td>
				<td>
				<c:choose>
					<c:when test="${list.a_a_idx==null||list.a_a_idx==0}">
						<div style="color:gray">미확인</div>
					</c:when>
					<c:when test="${list.a_a_idx==1}">
						<div style="color:green">출석</div>
					</c:when>
					<c:when test="${list.a_a_idx==2}">
						<div style="color:orange">지각</div>
					</c:when>
					<c:when test="${list.a_a_idx==3}">
						<div style="color:blue">조퇴</div>
					</c:when>
					<c:when test="${list.a_a_idx==4}">
						<div style="color:red">결석</div>
					</c:when>
				</c:choose>
				</td>
				<td>${list.attend_note}</td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">${pageStr}</td>
			</tr>
		</tfoot>
	</table>