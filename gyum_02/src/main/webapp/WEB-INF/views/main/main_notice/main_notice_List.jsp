<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="description" content="Miminium Admin Template v.1">
	<meta name="author" content="Isna Nur Azis">
	<meta name="keyword" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>일반공지</title>
 
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
	<style>
		#inwhole{
			width: 90%;
			float: left;
		}
		table.table-striped.table-bordered.dataTable.no-footer {
		    width: 85%;
		    margin: 7%;
		    margin-top: 3%;
		}
	</style>
</head><body id="mimin" class="dashboard" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">
	<section id="whole">
		<section id="inwhole">
	<h2>공지</h2>
	<table width="450" cellspacing="0" class="table-striped table-bordered dataTable no-footer">
		<thead>
			<tr>
				<th>번호</th>
				<th width="300">제목</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="3" align="center">${page}</td>
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
					<c:url var="contentUrl" value="notice_Content.do">
						<c:param name="idx" value="${dto.notice_idx}" />
					</c:url>
					<td align="center">${dto.notice_idx}</td>
					<td style="text-align: left;"><a href="${contentUrl}">${dto.notice_subject}</a></td>
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
    <script src="asset/js/plugins/icheck.min.js"></script>
    <script src="asset/js/plugins/summernote.min.js"></script>
    <script src="asset/js/plugins/moment.min.js"></script>
    <script src="asset/js/plugins/jquery.nicescroll.js"></script>


    <!-- custom -->
     <script src="asset/js/main.js"></script>
     <script type="text/javascript">
        $(document).ready(function(){
            $('input').iCheck({
              checkboxClass: 'icheckbox_flat-red',
              radioClass: 'iradio_flat-red'
            });

             $('.summernote').summernote({
                height: 300
              });
                 $('.mail-wrapper').find('.mail-left').css('height', $('.mail-wrapper').innerHeight());

        });
     </script>
</html>