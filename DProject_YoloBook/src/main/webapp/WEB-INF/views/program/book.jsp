<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> 예약하기  </title>
	<style>
		#chatting{ color: #18bc9c; }
		#chatting:hover{ color: blue; }
		#chatting:active{ color: red; } 
	</style>
	
    <!-- Bootstrap core CSS -->
    <link href="resources/main_bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="resources/main_bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="resources/main_bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="resources/main_bootstrap/css/freelancer.min.css" rel="stylesheet">

</head>
<style>
.img-fluid {
	width : 350px;
    height: 260px;
}
.big-image {
	width : 640px;
    height: 460px;
}
.dropdown-menu{
	background-color: transparent;
	color:white;
}
.menu{
	color:white;
}

</style>

 	<!-- 상위 메뉴바 -->
   <body id="page-top">
     <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
 	<a class="navbar-brand js-scroll-trigger" href="main">YoloBook</a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
			
			<c:if test="${empty member }">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login">로그인</a>
            </c:if>
            <c:if test="${!empty member }">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="myinfo?m_number=${member.m_number }">${member.m_name }의 정보보기</a>
            </c:if>
            
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="intro">우리공방소개</a>
            </li>
            <div class="dropdown">
			  <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" style="color:white; background-color: transparent;">수업강좌
			  <span class="caret"></span></button>
			    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" style="background-color: transparent;">
			      <li role="presentation" ><a role="menuitem" tabindex="-1" href="program?p_class=1" class='menu'> 떡 케이크</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="program?p_class=2" class='menu'> 프랑스자수 </a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="program?p_class=3" class='menu'> 가죽공예</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="program?p_class=4" class='menu'> 취미미술</a></li>
			      <li role="presentation" class="divider"></li>
			    </ul>
			  </div>
            <li class="nav-item mx-0 mx-lg-1">
				<!-- <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">달력</a> -->
            </li>
            <li class="nav-item mx-0 mx-lg-1">
			
			<c:if test="${empty member }">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href=# style="color: transparent;"></a>
            </c:if>
            <c:if test="${!empty member }">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="logout"> 로그아웃 </a>
            </c:if>
            </li>
          </ul>
        </div>
      </div>
    </nav>

	<c:if test="${empty member }">
		
		<script>
			alert("회원가입부터 하세요!!!")
			location.href='login';
			
		</script>
		
	</c:if>
	
	<c:if test="${!empty member }">
	<br><br>
	<session>
		<br><br><br><br>
		<h1> YoloBook입니다. </h1>
		<b><font size="5"> ${member.m_name }님의 예약현황 </font></b>
		<table border='1'>
			<tr>
				<th>프로그램명</th>
				<th>시작 시간</th>
				<th>종료 시간</th>
				<th>날짜</th>
				<th>가격</th>
			</tr>
			<tr>
				<td>${program.p_name }</td>
				<td>${program.starttime }</td>
				<td>${program.endtime }</td>
				<td>${program.p_date }</td>
				<td>${program.price }</td>
			</tr>
		</table>
		
			<form action=pay><!-- onclick="location.href='pay'" --> <!-- ?대신에 hidden을 사용할 수 있다. -->
				<b><font size='3'>신용카드<input type="radio" name='payinfo' value='신용카드' "></font></b> &nbsp;
				<b><font size='3'>무통장입금<input type="radio" name='payinfo' value=무통장입금 "></font></b> &nbsp;
				<b><font size='3'>휴대폰결제<input type="radio" name='payinfo' value=휴대폰결제 "></font></b><br><br>
				<input type="hidden" name="m_number" value="${member.m_number }">
				<input type="hidden" name="p_number" value="${program.p_number }">				
				<b><font size='5'>  예약하시겠습니까?	 </font></b> <input type="submit" value='예'>
				<a href="#" class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" onclick="history.back()">뒤로가기</a>
			</form>

			<br><br><br><br><br><br><br><br><br><br>
	</session>
	</c:if>
	
	
<!-- BootStrap 하단 -->
<!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Location</h4>
            <p class="lead mb-0">서울특별시 마포구 양화로 12길 26 (서교동, 서우빌딩3층)
          	<a href="location"><h3>위치보기</h3></a></p>
              
              <h4 class="text-uppercase mb-4">etc</h4>
            <p class="lead mb-0">사업자등록번호: 105-91-23344	
								 E-mail: kkp0071@naver.com
								 copyrightⓒ2017 월든공방클래스 all rights reserved
              <br>Clark, MO 65243</p>
          </div>
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Around the Web</h4>
            <ul class="list-inline mb-0">
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-google-plus"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-linkedin"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a class="btn btn-outline-light btn-social text-center rounded-circle" href="#">
                  <i class="fa fa-fw fa-dribbble"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <h4 class="text-uppercase mb-4">account</h4>
            <p class="lead mb-0">입금계좌: 국민은행 650301-04-109062 월든학원 
            					   ​전화상담: 1899-8897
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

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
    </div>
</body>
</html>