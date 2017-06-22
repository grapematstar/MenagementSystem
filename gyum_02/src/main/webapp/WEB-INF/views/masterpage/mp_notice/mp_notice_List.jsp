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
<title>일반공지</title>
<style>
#inwhole{
	width: 90%;
	float: left;
}
#btngroup{
	float: right;
    margin-right: 23%;
}
#htag {
    width: 300px;
    font-size: 30px;
    margin: 9%;
}
#writego{
	float: right;
}
#noticetable{
	float: right;
    margin-right: 22%;
    width: 70%;
}
#notsub{
	text-align: left;
    padding-left: 4%;
}
</style>
</head>
<body id="mimin" class="dashboard" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="../mp_index.jsp" %>
<div id="content" class="article-v1">
<section id="whole">
	<section id="inwhole">
		<span id="htag">일반공지</span>
		<div id="btngroup" class="btn-group" role="group">
	    	<button class="btn  dropdown-toggle" aria-expanded="true" aria-haspopup="true" type="button" data-toggle="dropdown">
	    		일반공지
	    		<span class="fa fa-angle-down"></span>
	    	</button>
	      	<ul class="dropdown-menu">
	        	<li><a href="notice_go.do">일반공지</a></li>
	        	<li><a href="t_n_go.do">강사공지</a></li>
	      	</ul>
	    </div>
		<table id="noticetable" width="600" border="1" cellspacing="0" class="table-striped table-bordered dataTable no-footer">
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="70%">제목</th>
					<th width="20%">작성날짜</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3" align="center">
						${page}
						<a id="writego" href="noticeWrite.do?sel=${sel}">글쓰기</a>
					</td>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="3" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr>
						<c:url var="contentUrl" value="notice_UpdateGo.do">
							<c:param name="idx" value="${dto.notice_idx}" />
						</c:url>
						<td align="center">${dto.notice_idx}</td>
						<td id="notsub" align="left"><a href="${contentUrl}">${dto.notice_subject}</a></td>
						<td align="center">${dto.notice_writedate}</td>
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