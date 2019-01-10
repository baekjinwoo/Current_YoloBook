<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>YoloBook:메인 페에지</title>
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
    
    <!--처리 커스텀 --><!--처리 커스텀 --><!--처리 커스텀 --><!--처리 커스텀 --><!--처리 커0스텀 --><!--처리 커스텀 --><!--처리 커스텀 -->
    <link href="resources/main_bootstrap/css/custom.css?ver=1" rel="stylesheet">
  </head>

 

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
         <div class='menu2'>
        <ul>
			<li>
	           	<c:if test="${empty member }">
	              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login">로그인</a>
	            </c:if>
	            <c:if test="${!empty member }">
	              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="myinfo?m_number=${member.m_number }&m_status=${member.m_status}">${member.m_name }의 정보보기</a>
	            </c:if>
            </li>
			<li><a href='intro'>우리 공방 소개</a></li>
			<li class='active sub'><a href='#'>수업강좌</a>
				<ul>
					<li class='sub'><a href='program?p_class=1'>떡케이크</a></li>
					<li class='sub'><a href='program?p_class=2'>프랑스 자수</a></li>
					<li class='sub'><a href='program?p_class=3'>가죽 공예</a></li>
					<li class='sub'><a href='program?p_class=4'>취미 미술</a></li>

				</ul></li>
		<!--<li><a href='#'>달력</a></li> -->
			<li>
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

<!-- <!-- Header -->
<!--     <header class="masthead bg-primary text-white text-center"> -->
<!--       <div class="container"> -->
<!--         <img class="img-fluid mb-5 d-block mx-auto" src="resources/main_bootstrap/img/portfolio/profile.png" alt=""> -->
<!--         <h1 class="text-uppercase mb-0">삶을 디자인 해라</h1> -->
<!--         <hr class="star-light"> -->
<!--         <h2 class="font-weight-light mb-0">Web Developer - Graphic Artist - User Experience Designer</h2> -->
<!--       </div> -->
<!--     </header> --> 


<!-- Portfolio Grid Section --><!-- Portfolio Grid Section --><!-- Portfolio Grid Section --><!-- Portfolio Grid Section --><!-- Portfolio Grid Section --><!-- Portfolio Grid Section -->
	    <section class="portfolio" id="portfolio">
	      <div class="container">
	        <h2 class="text-center text-uppercase text-secondary mb-0"> 공방 수강  </h2>
	        <hr class="star-dark mb-5">
	        <div class="row">
	        

			<c:forEach var="randomprogramlist" items="${randomprogramlist }" varStatus="status">
		
			          <div class="col-md-6 col-lg-4">
			            <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-${status.count}" id="test"> <!-- "#portfolio-modal-${status.count} 를 통해 이미지 누를때 modal을 뿌려줄 수 있다. -->
			              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
			                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
			                  <i class="fa fa-search-plus fa-3x"></i>
			                </div>
			              </div>
			              <c:if test="${randomprogramlist.p_class eq '1'}">
			              	<img class="img-fluid" src="resources/main_bootstrap/img/portfolio/cake/${randomprogramlist.p_thumbnail_filename}" alt="">
			              </c:if>
			              <c:if test="${randomprogramlist.p_class eq '2'}">
			              	<img class="img-fluid" src="resources/main_bootstrap/img/portfolio/jasu/${randomprogramlist.p_thumbnail_filename}" alt="">
			              </c:if>	
					      <c:if test="${randomprogramlist.p_class eq '3'}">
			              	<img class="img-fluid" src="resources/main_bootstrap/img/portfolio/leather/${randomprogramlist.p_thumbnail_filename}" alt="">
			              </c:if>	
					      <c:if test="${randomprogramlist.p_class eq '4'}">
			              	<img class="img-fluid" src="resources/main_bootstrap/img/portfolio/art/${randomprogramlist.p_thumbnail_filename}" alt="">
			              </c:if>	
			               ${randomprogramlist.p_name }
			            </a>
			          </div>
				<c:if test="empty member">
					${member.m_name }
				</c:if>	
			</c:forEach>
			</div>
		</div>
	</section>



   <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Location</h4>
            <p class="lead mb-0">서울특별시 마포구 양화로 12길 26 (서교동,서우빌딩3층)
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
							            ?전화상담: 1899-8897
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


<c:forEach var="randomprogramlist" items="${randomprogramlist }" varStatus="status"> <!-- db의 class가 1일때를 조건으로 -->
   	<c:if test="${!empty randomprogramlist.p_class}" > 
    <!-- Portfolio Modal 1 -->
    <div class="portfolio-modal mfp-hide" id="portfolio-modal-${status.count}"> <!-- "#portfolio-modal-${status.count} 를 통해 이미지 누를때 modal을 뿌려줄 수 있다. -->
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">${randomprogramlist.p_name }</h2>
              <hr class="star-dark mb-5">
              
              <c:if test="${randomprogramlist.p_class eq '1' }"> 
             	 <img class="big-image" src="resources/main_bootstrap/img/portfolio/cake/${randomprogramlist.p_thumbnail_filename}" alt="">
              </c:if>
              <c:if test="${randomprogramlist.p_class eq '2' }"> 
             	 <img class="big-image" src="resources/main_bootstrap/img/portfolio/jasu/${randomprogramlist.p_thumbnail_filename}" alt="">
              </c:if>
              <c:if test="${randomprogramlist.p_class eq '3' }"> 
             	 <img class="big-image" src="resources/main_bootstrap/img/portfolio/leather/${randomprogramlist.p_thumbnail_filename}" alt="">
              </c:if>
              <c:if test="${randomprogramlist.p_class eq '4' }"> 
             	 <img class="big-image" src="resources/main_bootstrap/img/portfolio/art/${randomprogramlist.p_thumbnail_filename}" alt="">
              </c:if>
              
              <p class="mb-5"> ${randomprogramlist.p_introduction }</p>
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="book?p_number=${randomprogramlist.p_number}">예약하기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    </c:if>
    </c:forEach>


    <!-- Bootstrap core JavaScript -->
    <script src="resources/main_bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="resources/main_bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/main_bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="resources/main_bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="resources/main_bootstrap/js/jqBootstrapValidation.js"></script>
    <script src="resources/main_bootstrap/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="resources/main_bootstrap/js/freelancer.min.js"></script>
  </body>

</html>
