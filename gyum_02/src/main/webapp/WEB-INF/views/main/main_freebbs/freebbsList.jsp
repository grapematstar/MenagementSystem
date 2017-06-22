<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="Miminium Admin Template v.1">
	<meta name="author" content="Isna Nur Azis">
	<meta name="keyword" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
   
    <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/icheck/skins/flat/red.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/summernote.css"/>
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/normalize.css"/>

	<link href="asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="asset/img/logomi.png">
<title>자유게시판</title>
<style>

#freebbs_list{
	width: 90%;
	float: left;
}

#htag{
	width: 300px;
	font-size: 30px;
}
#write{
	float: right;
    margin-right: 10%;
    margin-top: 5%;
}
table.table-striped.table-bordered.dataTable.no-footer {
    width: 85%;
    margin: 7%;
    margin-top: 3%;
}
#htagtop {
    margin-left: 7%;
}
</style>
</head>
<body id="mimin" class="dashboard" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">

<section id="whole">
<section id="freebbs_list">
	<div id="htagtop">
		<span id="htag">자유게시판</span>
		<c:if test="${!empty id}">
			<a href="freebbsWrite.do" id="write">글쓰기</a>
		</c:if>
	</div>
	<table cellspacing="0" class="table-striped table-bordered dataTable no-footer">
		<thead>
			<tr>
				<th width="50">번호</th>
				<th width="500">제목</th>
				<th width="150">작성자</th>
				<th width="130">작성날짜</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4" align="center">${page}</td>
			</tr>
		</tfoot>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td align="center">${dto.f_b_idx}</td>
					<c:url var="contentUrl" value="freebbsContent.do">
						<c:param name="idx" value="${dto.f_b_idx}"/>
					</c:url>
					<td style="text-align:left;"><a href="${contentUrl}">${dto.f_b_subject}[${dto.f_b_readnum}]</a></td>
					<td align="center">${dto.f_b_writer}</td>
					<td align="center">${dto.f_b_writedate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</section>
	</section>
	</div>
	</div>
</body>
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>


<!-- plugins -->
<script src="asset/js/plugins/moment.min.js"></script>
<script src="asset/js/plugins/icheck.min.js"></script>
<script src="asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="asset/js/main.js"></script>
<script type="text/javascript">
</script>
</html>