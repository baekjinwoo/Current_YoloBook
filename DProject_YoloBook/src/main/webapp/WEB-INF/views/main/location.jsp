<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title> 공방위치 </title>
<style>
		#chatting{ color: #18bc9c; }
		#chatting:hover{ color: blue; }
		#chatting:active{ color: red; } 
</style>

<script
	src="http://maps.google.com/maps/api/js?key=AIzaSyBuMhc367ia1i3QryuC2LLtWT5WnSSNwF8"></script>
<script src="resources/jquery-3.2.1.min.js"></script>


<!-- Bootstrap core CSS -->
<link
	href="resources/main_bootstrap/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="resources/main_bootstrap/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link
	href="resources/main_bootstrap/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="resources/main_bootstrap/css/freelancer.min.css"
	rel="stylesheet">

<!--처리 커스텀 -->
<!--처리 커스텀 -->
<!--처리 커스텀 -->
<!--처리 커스텀 -->
<!--처리 커0스텀 -->
<!--처리 커스텀 -->
<!--처리 커스텀 -->
<link href="resources/main_bootstrap/css/custom.css?ver=1"
	rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="resources/main_bootstrap/vendor/jquery/jquery.min.js"></script>
<script
	src="resources/main_bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="resources/main_bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
<script
	src="resources/main_bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="resources/main_bootstrap/js/jqBootstrapValidation.js"></script>
<script src="resources/main_bootstrap/js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="resources/main_bootstrap/js/freelancer.min.js"></script>

</head>
<style>
#map {
	margin: auto;
}
</style>




<!-- 상위 메뉴바 -->
<body id="page-top">
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="main">YoloBook</a>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<div class='menu2'>
				<ul>
					<li><c:if test="${empty member }">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="login">로그인</a>
						</c:if> <c:if test="${!empty member }">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="myinfo?m_number=${member.m_number }&m_status=${member.m_status}">${member.m_name }의
								정보보기</a>
						</c:if></li>
					<li><a href='intro'>우리 공방 소개</a></li>
					<li class='active sub'><a href='#'>수업강좌</a>
						<ul>
							<li class='sub'><a href='program?p_class=1'>떡케이크</a></li>
							<li class='sub'><a href='program?p_class=2'>프랑스 자수</a></li>
							<li class='sub'><a href='program?p_class=3'>가죽 공예</a></li>
							<li class='sub'><a href='program?p_class=4'>취미 미술</a></li>

						</ul></li>
					<!--<li><a href='#'>달력</a></li> -->
					<li><c:if test="${empty member }">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href=# style="color: transparent;"></a>
						</c:if> <c:if test="${!empty member }">
							<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="logout"> 로그아웃 </a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>



	<!-- Portfolio Grid Section -->
	<!-- Portfolio Grid Section -->
	<!-- Portfolio Grid Section -->
	<!-- Portfolio Grid Section -->
	<!-- Portfolio Grid Section -->
	<!-- Portfolio Grid Section -->
	<section class="portfolio" id="portfolio">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">공방 위치
			</h2>
			<hr class="star-dark mb-5">
			<div class="row">
				<div id='map' style="width: 1024px; height: 600px"></div>
			</div>
		</div>

	</section>



	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						서울특별시 마포구 양화로 12길 26<br> (서교동, 서우빌딩3층)
					<h4 class="text-uppercase mb-4">
						<a href="location">위치보기</a>
					</h4>
					<p class="lead mb-0">
						사업자등록번호: 105-91-23344 E-mail: kkp0071@naver.com copyrightⓒ2017
						월든공방클래스 all rights reserved <br>Clark, MO 65243
					</p>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<ul class="list-inline mb-0">
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-facebook"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-google-plus"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-linkedin"></i>
						</a></li>
						<li class="list-inline-item"><a
							class="btn btn-outline-light btn-social text-center rounded-circle"
							href="#"> <i class="fa fa-fw fa-dribbble"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h4 class="text-uppercase mb-4">account</h4>
					<p class="lead mb-0">
						입금계좌: 국민은행 650301-04-109062 월든학원 ?전화상담: 1899-8897 
		              <b><a onclick="chatting()" id =chatting><h3>문의하기</h3></a></b>
		            </p>
		
				   <c:if test="${!empty member }">           
			           <script> //window.open을 이용한 웹소켓 팝업창(새창)
				           	function chatting(){
					       	 window.open("chat", "", "width=400, height=300,  scrollbars=1");
				           	};		
			           </script>
		           </c:if>
		           <c:if test="${empty member }">
		           	    <script>
				           	 function chatting(){
			           			alert("로그인 후 이용하세요");
		    	       			location.href="login";
				           	 }
		           		</script>
		           </c:if>
				</div>
			</div>
		</div>
	</footer>

	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2018</small>
		</div>
	</div>
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded"
			href="#page-top"> <i class="fa fa-chevron-up"></i>
		</a>
	</div>

</body>
<script>
	$(document).ready(function() {
		watchID = navigator.geolocation.watchPosition(success, error, {
			enableHighAccuracy : true,
			maximumAge : 0
		});
	});

	function success(p) {
		var lat = 37.557391;
		var lon = 126.919046;

		var center = new google.maps.LatLng(lat, lon);
		map = new google.maps.Map(document.getElementById("map"), {

			mapTypeId : google.maps.MapTypeId.ROADMAP,
			zoom : 17,
			center : center

		});

		marker = new google.maps.Marker({
			position : center,
			title : "현재나",
			map : map
		});
	}

	function error(e) {
		$('.result').html(e.code + " : " + e.message);
	}
</script>

</html>