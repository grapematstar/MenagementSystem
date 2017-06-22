<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<meta charset="utf-8">
<meta name="description" content="Miminium Admin Template v.1">
<meta name="author" content="Isna Nur Azis">
<meta name="keyword" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- start: Css -->
<link rel="stylesheet" type="text/css"
	href="asset/css/bootstrap.min.css">
<!-- plugins -->
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="asset/css/plugins/animate.min.css">
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="asset/img/logomi.png">

</head>



<body>
<body id="mimin" class="dashboard" style="width: 1450px;">
	<!-- 본문 -->
	<%@include file="../../../header.jsp"%>
	<div class="container-fluid mimin-wrapper">
		<%@include file="../../../sidemenu.jsp"%>
		<div id="content" class="article-v1">
		
<div class="col-md-6 col-sm-12 col-xs-12" style="width: 1200px; float: left;">
  <div class="panel">
    <div class="panel-heading">
      <h3 align="center">Welcome to GYUM ACADEMY !</h3>
    </div>
    <div class="panel-body">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
            <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
            <li data-target="#carousel-example-generic" data-slide-to="3" class=""></li>
          </ol>
          <div class="carousel-inner">
            <div class="item active">
              <img class="img-responsive" data-src="holder.js/900x500/auto/#777:#555/text:First slide" alt="First slide" src="img/mama.JPG">
            </div>
           <div class="item">
              <img class="img-responsive" data-src="holder.js/900x500/auto/#777:#555/text:First slide" alt="First slide" src="img/emmalogo.JPG">
            </div>
            <div class="item">
              <img class="img-responsive" data-src="holder.js/900x500/auto/#666:#444/text:Second slide" alt="Second slide" src="img/mingoologo.JPG">
            </div>
            <div class="item">
              <img class="img-responsive" data-src="holder.js/900x500/auto/#555:#333/text:Third slide" alt="Third slide" src="img/sullogo.JPG">
            </div>
          </div>
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>		
					<div class="panel" style="width:590px;margin-right: 20px;margin-top: 20px;float: left;">
						<div class="panel-body">
							<div class="panel box-v2">
							<!-- here  -->
								<div class="responsive-table">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="3"><h4 style="font-family: fantasy;">공지사항</h4></td>
											</tr>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty sgClassList}">
												<tr>
													<td colspan="7">등록된 게시물이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="dto" items="${sgClassList}">
												<tr>
													<td>${dto.class_subject}</td>
													<td>${dto.class_startdate}</td>
													<td>${dto.tea_name}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="panel" style="width:590px;margin-top: 20px;float: left;">
						<div class="panel-body">
							<div class="panel box-v2">
							<!-- here  -->
								<div class="responsive-table">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="3"><h4 style="font-family: fantasy;">개설과목</h4></td>
											</tr>
											<tr>
												<th>과목명</th>
												<th>개강일</th>
												<th>강사</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty sgClassList}">
												<tr>
													<td colspan="7">등록된 게시물이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="dto" items="${sgClassList}">
												<tr>
													<td>${dto.class_subject}</td>
													<td>${dto.class_startdate}</td>
													<td>${dto.tea_name}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
		
				
						<div class="panel" style="width:590px;margin-right: 20px;margin-top: 20px;float: left;">
						<div class="panel-body">
							<div class="panel box-v2">
							<!-- here  -->
								<div class="responsive-table">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="3"><h4 style="font-family: fantasy;">캘린더</h4></td>
											</tr>
											<tr>
												<th>과목명</th>
												<th>개강일</th>
												<th>강사</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty sgClassList}">
												<tr>
													<td colspan="7">등록된 게시물이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="dto" items="${sgClassList}">
												<tr>
													<td>${dto.class_subject}</td>
													<td>${dto.class_startdate}</td>
													<td>${dto.tea_name}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				\<div class="panel" style="width:590px;margin-top: 20px;float: left;">
						<div class="panel-body">
							<div class="panel box-v2">
							<!-- here  -->
								<div class="responsive-table">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<td colspan="3"><h4 style="font-family: fantasy;">쪽지함</h4></td>
											</tr>
											<tr>
												<th>제목</th>
												<th>보낸이</th>
												<th>날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty letterlist}">
												<tr>
													<td colspan="3">등록된 게시물이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="dto" items="${letterlist}">
												<tr>
													<td><a href="javascript:window.open('my_letter_show_content.do?letter_idx=${dto.letter_idx }&noread=noread','나의쪽지함','width=400,height=340,top=100,left=400');">${dto.letter_subject}</a></td>
													<td>${dto.letter_sender}</td>
													<td>${dto.letter_senddate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
</div>
	<script src="asset/js/jquery.min.js"></script>
	<script src="asset/js/jquery.ui.min.js"></script>
	<script src="asset/js/bootstrap.min.js"></script>
	<!-- plugins -->
	<script src="asset/js/plugins/moment.min.js"></script>
	<script src="asset/js/plugins/jquery.nicescroll.js"></script>
	<!-- custom -->
	<script src="asset/js/main.js"></script>
	<div id="ascrail2000" class="nicescroll-rails"
		style="width: 7px; z-index: 222; cursor: default; position: fixed; top: 0px; left: 193px; height: 638px; opacity: 0; display: block;">
		<div
			style="position: relative; top: 0px; float: right; width: 5px; height: 421px; background-color: rgb(33, 150, 243); border: 1px solid rgb(255, 255, 255); background-clip: padding-box; border-radius: 5px;"></div>
	</div>
	<div id="ascrail2000-hr" class="nicescroll-rails"
		style="height: 7px; z-index: 222; top: 631px; left: 0px; position: fixed; cursor: default; display: none; width: 193px; opacity: 0;">
		<div
			style="position: relative; top: 0px; height: 5px; width: 200px; background-color: rgb(33, 150, 243); border: 1px solid rgb(255, 255, 255); background-clip: padding-box; border-radius: 5px; left: 0px;"></div>
	</div>
	<div id="ascrail2000" class="nicescroll-rails"
		style="width: 7px; z-index: 222; cursor: default; position: fixed; top: 0px; left: 193px; height: 798px; opacity: 0; display: block;">
		<div
			style="position: relative; top: 0px; float: right; width: 5px; height: 666px; background-color: rgb(33, 150, 243); border: 1px solid rgb(255, 255, 255); background-clip: padding-box; border-radius: 5px;"></div>
	</div>
	<div id="ascrail2000-hr" class="nicescroll-rails"
		style="height: 7px; z-index: 222; top: 791px; left: 0px; position: fixed; cursor: default; width: 193px; opacity: 0; display: block;">
		<div
			style="position: relative; top: 0px; height: 5px; width: 195px; background-color: rgb(33, 150, 243); border: 1px solid rgb(255, 255, 255); background-clip: padding-box; border-radius: 5px; left: 0px;"></div>
	</div>


</body>
</html>