<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title> 관리자 모드 </title>
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


 <body id="page-top">
 
 <!-- BootStrap 상단 -->
 <!-- Navigation -->
 <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
 <div class="container">
 	<a class="navbar-brand js-scroll-trigger" href="main"> YoloBook:관리자모드 </a>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
            </li>
            <li class="nav-item mx-0 mx-lg-1">
				<input type=button value='미승인 강사' onclick="changeIfrm(3)" class="btn btn-warning dropdown-toggle">
            </li>
            <li class="nav-item mx-0 mx-lg-1">
				<input type=button value='미승인 프로그램' onclick="changeIfrm(4)" class="btn btn-warning dropdown-toggle">
            </li>
            
            <li class="nav-item mx-0 mx-lg-1">
				<input type=button value='전체회원정보' onclick="changeIfrm(1)" class="btn btn-default dropdown-toggle">
            </li>
            
              <li class="nav-item mx-0 mx-lg-1">
				<input type=button value='프로그램 정보' onclick="changeIfrm(2)" class="btn btn-default dropdown-toggle"><br>
            </li>
         </li>
       </ul>
	</div>
</div>
</nav>
	
	<session>
		<br><br><br><br><br><br>
		<!-- <iframe name="ifrm" id="ifrm" width="90%"  style="height: 100%"  scrolling="auto"></iframe>  iframe은 height를 최대치로 할 수 없어서 아래의 코드를 사용한다-->
		<iframe name="ifrm" id="ifrm" onload="calcHeight();" frameborder="0" scrolling="yes" style="overflow-x:hidden; overflow:auto; width:100%; min-height:500px;"></iframe>
	</session>
	
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

<!-- jsp화면을 가져오기 위해서는, ajax가 아니고 include를 사용해야한다.  -->
<script src="resources/jquery-3.2.1.min.js"></script>
<script>
function changeIfrm(idx) {
	var ifrm = document.getElementById("ifrm");
	if(idx == 1) {
		ifrm.contentWindow.document.location.href = "memberlist";
	}
	else if(idx==2) {
		ifrm.contentWindow.location.href = "pselect";
	}
	else if(idx==3) { //미승인 강사
		ifrm.contentWindow.location.href="member2";
	}
	else if(idx==4) { //미승인 프로그램
		ifrm.contentWindow.location.href="program2";
	}
}
</script>
</html>