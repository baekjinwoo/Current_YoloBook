<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->


<!DOCTYPE html>

<head>
<!-- <script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
 --><meta charset='UTF-8'>
<meta name="robots" content="noindex">
<!-- <link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/Lewitje/pen/BNNJjo?depth=everything&order=popularity&page=14&q=box&show_forks=false" />
 -->

<style class="cp-pen-styles">@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  font-weight: 300;
}
body {
  font-family: 'Source Sans Pro', sans-serif;
  color: white;
  font-weight: 300;
}
body ::-webkit-input-placeholder {
  /* WebKit browsers */
  font-family: 'Source Sans Pro', sans-serif;
  color: white;
  font-weight: 300;
}
body :-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  font-family: 'Source Sans Pro', sans-serif;
  color: white;
  opacity: 1;
  font-weight: 300;
}
body ::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  font-family: 'Source Sans Pro', sans-serif;
  color: white;
  opacity: 1;
  font-weight: 300;
}
body :-ms-input-placeholder {
  /* Internet Explorer 10+ */
  font-family: 'Source Sans Pro', sans-serif;
  color: white;
  font-weight: 300;
}
.wrapper {
  background: #50a3a2;
  background: -webkit-linear-gradient(top left, #50a3a2 0%, #53e3a6 100%);
  background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
  position: absolute;
  top: 40%;
  left: 0;
  width: 100%;
  height: 700px;
  margin-top: -200px;
  overflow: hidden;
}
.wrapper.form-success .container h1 {
  -webkit-transform: translateY(85px);
          transform: translateY(85px);
}
.container {
  max-width: 600px;
  margin: 0 auto;
  padding: 80px 0;
  height: 400px;
  text-align: center;
}
.container h1 {
  font-size: 40px;
  -webkit-transition-duration: 1s;
          transition-duration: 1s;
  -webkit-transition-timing-function: ease-in-put;
          transition-timing-function: ease-in-put;
  font-weight: 200;
}
form {
  padding: 20px 0;
  position: relative;
  z-index: 2;
}
form input {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  outline: 0;
  border: 1px solid rgba(255, 255, 255, 0.4);
  background-color: rgba(255, 255, 255, 0.2);
/*   width: 250px; */
  border-radius: 3px;
  padding: 10px 15px;
  margin: 0 auto 10px auto;
/*   display: block; */
  text-align: center;
  font-size: 18px;
  color: white;
  -webkit-transition-duration: 0.25s;
          transition-duration: 0.25s;
  font-weight: 300;
}
form input:hover {
  background-color: rgba(255, 255, 255, 0.4);
}
form input:focus {
  background-color: white;
  width: 300px;
  color: #53e3a6;
}
form button {
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
  outline: 0;
  background-color: white;
  border: 0;
  padding: 10px 15px;
  color: #53e3a6;
  border-radius: 3px;
  width: 250px;
  cursor: pointer;
  font-size: 18px;
  -webkit-transition-duration: 0.25s;
          transition-duration: 0.25s;
}
form button:hover {
  background-color: #f5f7f9;
}
.bg-bubbles {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}
.bg-bubbles li {
  position: absolute;
  list-style: none;
  display: block;
  width: 40px;
  height: 40px;
  background-color: rgba(255, 255, 255, 0.15);
  bottom: -160px;
  -webkit-animation: square 25s infinite;
  animation: square 25s infinite;
  -webkit-transition-timing-function: linear;
  transition-timing-function: linear;
}
.bg-bubbles li:nth-child(1) {
  left: 10%;
}
.bg-bubbles li:nth-child(2) {
  left: 20%;
  width: 80px;
  height: 80px;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  -webkit-animation-duration: 17s;
          animation-duration: 17s;
}
.bg-bubbles li:nth-child(3) {
  left: 25%;
  -webkit-animation-delay: 4s;
          animation-delay: 4s;
}
.bg-bubbles li:nth-child(4) {
  left: 40%;
  width: 60px;
  height: 60px;
  -webkit-animation-duration: 22s;
          animation-duration: 22s;
  background-color: rgba(255, 255, 255, 0.25);
}
.bg-bubbles li:nth-child(5) {
  left: 70%;
}
.bg-bubbles li:nth-child(6) {
  left: 80%;
  width: 120px;
  height: 120px;
  -webkit-animation-delay: 3s;
          animation-delay: 3s;
  background-color: rgba(255, 255, 255, 0.2);
}
.bg-bubbles li:nth-child(7) {
  left: 32%;
  width: 160px;
  height: 160px;
  -webkit-animation-delay: 7s;
          animation-delay: 7s;
}
.bg-bubbles li:nth-child(8) {
  left: 55%;
  width: 20px;
  height: 20px;
  -webkit-animation-delay: 15s;
          animation-delay: 15s;
  -webkit-animation-duration: 40s;
          animation-duration: 40s;
}
.bg-bubbles li:nth-child(9) {
  left: 25%;
  width: 10px;
  height: 10px;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  -webkit-animation-duration: 40s;
          animation-duration: 40s;
  background-color: rgba(255, 255, 255, 0.3);
}
.bg-bubbles li:nth-child(10) {
  left: 90%;
  width: 160px;
  height: 160px;
  -webkit-animation-delay: 11s;
          animation-delay: 11s;
}
@-webkit-keyframes square {
  0% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  100% a
    -webkit-transform: translateY(-700px) rotate(600deg);
            transform: translateY(-700px) rotate(600deg);
  }
}
@keyframes square {
  0% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  100% {
    -webkit-transform: translateY(-700px) rotate(600deg);
            transform: translateY(-700px) rotate(600deg);
  }
}
</style></head><body>
<div class="wrapper">
	<div class="container">
		<h1>YoloBook: 회원가입</h1>
		
		<!-- 선택:일반회원/선생님으로 가입하기 -->
		<c:if test="${empty m_status}">
		<form class="form">
			<button type="button" id="login-button" onclick="location.href='register?m_status=1'">일반회원으로 가입하기</button>
			<button type="button" id="login-button" onclick="location.href='register?m_status=2'">선생님으로 가입하기</button>
		</form>
		</c:if>
		
		<!-- 일반회원으로 가입하기 -->
		<c:if test="${m_status==1}">
		<h4>일반회원으로 가입하기</h4>
		<form action="register" method="post" class="form">
			 * <input type="text" name="id" placeholder="아이디" id="id" required> &nbsp; <input type="button" value="중복확인" class="IdCheck"><br>
			 * <input type="password" name="pw" id='pw' onchange="isSame()" placeholder="비밀번호" pattern='^[a-zA-Z0-9]{3,10}$' required ><br>
			 * <input type="password" id='pwCheck' onchange="isSame()" placeholder="비밀번호 확인" required> &nbsp; <span id='same'></span><br>
			 * <input type="text" name="m_name" placeholder="이름" required><br>
			 * <input type="text" name="email" placeholder="이메일" pattern='^[a-zA-Z0-9]{1,20}@[a-zA-Z0-9]{1,20}.com$' required><br>
			 * <input type="text" name="phone" placeholder="핸드폰" pattern='^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$' required><br>
			<input type="hidden" name="m_status" value="${m_status}">
			<button type="submit" id="login-button">가입하기</button>
		</form>
		</c:if>
		
		<!-- 선생님으로 가입하기 -->
		<c:if test="${m_status==2}">
		<form action="register" method="POST" enctype="multipart/form-data" class="form">
			<h4>강사로 가입하기</h4><br>
			* <input type="text" name="id" placeholder="아이디" id='id'> &nbsp; <input type="button" value="중복확인" class="IdCheck"><br>
			* <input type="password" name="pw" id='pw' onchange="isSame()" placeholder="비밀번호" pattern='^[a-zA-Z0-9]{3,10}$' required><br>
			* <input type="password" id='pwCheck' onchange="isSame()" placeholder="비밀번호 확인" required> &nbsp; <span id='same'></span><br>
			* <input type="text" name="m_name" placeholder="이름" required><br>
			* <input type="text" name="email" placeholder="이메일" pattern='^[a-zA-Z0-9]{1,20}@[a-zA-Z0-9]{1,20}.com$' required><br>
			* <input type="text" name="phone" placeholder="핸드폰" pattern='^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$' required><br>
			* <input type="text" name="m_introduction" placeholder="강사소개"><br>
			* <input type="file" name="m_introduction_file"><br>
			
			<input type="hidden" name="m_status" value="${m_status}">
			<button type="submit" id="login-button">가입하기</button>
		</form>
		</c:if>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>

</body>

<script src="resources/jquery-3.2.1.min.js"></script>
<script>
	$(".IdCheck").on('click', function(){ //id값은 중복될 수 없기때문에 class사용
		$.ajax({
			async:true,
			url:"/program/idcheck", //idcheck도 가능
			type:"POST",
			data: {"id":$("#id").val()}, //id="id'의 값을 가져온다.
			success:function(idcheck){
				if(!idcheck){
					alert("사용가능한 아이디입니다.");
				} 
				else{
					alert("이미 사용 중인 아이디입니다.");
					document.getElementById("id").value = "";
				}
			},				
			error:function(e){
				alert(e);
			},
			complete:function(){
			}
		});
	});
	
	function isSame(){
		if(document.getElementById('pw').value!=''&&document.getElementById('pwCheck').value!=''){
		 if(document.getElementById('pw').value==document.getElementById('pwCheck').value){
		    document.getElementById('same').innerHTML='비밀번호 일치';
		    document.getElementById('same').style.color='blue';
		  }  
		 else{
		    document.getElementById('same').innerHTML='비밀번호 불일치';
		    document.getElementById('same').style.color='red';
		  }
		}
	}
	
</script>

</html>