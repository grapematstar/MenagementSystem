<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<c:if test="${!empty mcdto}">
		<fieldset>
			<div id="classSearch">
				<span id="hh">강의</span><c:if test="${empty ls}"><a id="more" onclick="more_()">더보기</a></c:if>
				<c:forEach var="mcdto" items="${mcdto}">
					<div id="classitem">
						<div id="subname">${mcdto.subject_name}</div>
						<span id="claname"><a href="teacherClassContentGo.do?class_idx=${mcdto.class_idx}">${mcdto.class_subject}</a></span>
						<span id="teaname"><b>${mcdto.tea_name}</b> 강사님</span>
					</div>
				</c:forEach>
			</div>
		</fieldset>
		<hr>
	</c:if>
	<c:if test="${!empty tdto}">
		<div id="teacherSearch" class="col-md-12">
			<span id="hh">강사</span><a id="more" href="teacherInfoListGo.do">더보기</a>
			<div class="row">
				<div id="tearesult" class="col-md-12">
					<c:forEach var="tdto" items="${tdto}">
					<div class="col-md-3">
						<span id="teaitem">
							<span id="teaImg" class="col-md-12">
								<a href="teacherInfoContentGo.do?idx=${tdto.tea_idx}&sub=${tdto.subject_num}">
									<img id="tprofileImg" alt="${tdto.file_idx}img" src="#" >
								</a>
							</span>
							<span id="teaname" class="col-md-12">
								<a href="teacherInfoContentGo.do?idx=${tdto.tea_idx}&sub=${tdto.subject_name}">
									${tdto.tea_name} 강사님
								</a>
							</span>
						</span>
					</div>	
					</c:forEach>
				</div>
			</div>
		</div>
		<hr>
	</c:if>
	<c:if test="${!empty crdto}">
		<div id="classReviewSearch">
			<span id="hh">강의후기</span>
			<c:forEach var="crdto" items="${crdto}">
				<div>
				[${crdto.class_idx}]
				<a href="">${crdto.class_subject}</a>
				<span><a href="#">${crdto.tea_name}</a> 강사님</span>
				</div>
			</c:forEach>
		</div>
		<hr>
	</c:if>
	<c:if test="${!empty fbdto}">
		<div id="freebbsSearch">
			<span id="hh">자유게시판</span> <a id="more" href="freebbsList.do">더보기</a>
			<c:forEach var="fbdto" items="${fbdto}">
				<div>
					<span><a href="freebbsContent.do?idx=${fbdto.f_b_idx}">${fbdto.f_b_subject}</a>(${fbdto.f_b_readnum})</span>
					<span>${fbdto.f_b_writedate}</span>
					<span>${fbdto.f_b_writer}</span>
				</div>
			</c:forEach>
		</div>
		<hr>
	</c:if>
	<c:if test="${!empty ndto}">
		<div id="noticeSearch">
			<span id="hh">공지</span> <a id="more" href="notice.do">더보기</a>
			<c:forEach var="ndto" items="${ndto}">
				<div>
					<span><a href="notice_Content.do?idx=${ndto.notice_idx}">${ndto.notice_subject}</a></span>
					<span>${ndto.notice_writedate}</span>
				</div>
			</c:forEach>
		</div>
		<hr>
	</c:if>
	<script>
	function more_(){
		var sparam = new Object();
		sparam.ss = $("#searchSelect").val();
		sparam.word = $("#searchText").val();
		$.ajax({
			type:"POST",
			url:"search.do?ls=0",
			data: sparam,
			success: function(args) {
				$("#searchResult").html(args);
			}
		});
	};
	</script>
</body>
</html>