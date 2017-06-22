<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#searchOk").click(function(){
		
		if($("#searchText").val()=="") {
			alert("검색어를 입력하세요");
		}
		
		var sparam = new Object();
		sparam.ss = $("#searchSelect").val();
		sparam.word = $("#searchText").val();
		$.ajax({
			type:"POST",
			url:"search.do",
			data: sparam,
			success: function(args) {
				$("#searchResult").html(args);
			}
		});
	});
	
	
});
</script>
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
      <link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>

	<link href="asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="asset/img/logomi.png">
<title>검색</title>
<style>
	#inwhole{
		width: 90%;
		float: left;
	}
	table{
		float: right;
	    margin-right: 20%;
	    margin-top: 4%;
	}
	input#searchText {
	    width: 350px;
	}
	#searchResult {
	    width: 65%;
	    margin-top: 36px;
	    margin-right: 18%;
	    float: right;
	}
	.teacher{
		float: left;	
	}
	span#classitem {
	    margin: 5%;
	}
	div#classitem {
	    margin: 3%;
	    margin-left: 10%;
	}
	span#claname {
	    font-size: 16px;
	    margin-right: 2%;
	    margin-left: 4%;
	}
	div#classSearch #teacherSearch {
	    margin-bottom: 30px;
	}
	table.teacher{
		margin-left: 5%;
	    margin-right: 5%;
	    margin-bottom: 5%;
	    float: left;
	}
	#tprofileImg{
		height: 4cm;
   		width: 3cm;
	}
	#nametd{
		padding-bottom: 5px;
		padding-top: 5px;			
	}
	#aaa{
		font-size: x-large;
	}
	#more {
    float: right;
    margin-right: 3%;
	}
span#hh {
    font-size: 22px;
    margin: 4%;
}
</style>
</head>
<body id="mimin" class="dashboard" >
<%@include file="/header.jsp" %>
<div class="container-fluid mimin-wrapper">
<%@include file="/sidemenu.jsp" %>
<div id="content" class="article-v1">
	<section id="whole">
		<section id="inwhole">
			<c:if test="${word}"></c:if>
			<table>
				<tr>
					<td>
						<select id="searchSelect">
							<option value="0" selected="selected">전체</option>
							<option value="1">글쓴이</option>
							<option value="2">제목</option>
							<option value="3">내용</option>
						</select>
					</td>
					<td>
						<span class="col-md-12">
		                	<span class="input-group">
		                		<input id="searchText" class="form-control" aria-label="..." type="text">
		                	</span><!-- /input-group -->
		                </span>
					</td>
					<td>
						<input type="button" value="검색" id="searchOk" class="btn btn-primary">
					</td>
				</tr>					
			</table>
			<div id="searchResult">
			
			</div>
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