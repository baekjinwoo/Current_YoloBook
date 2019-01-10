<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 미승인 강사 리스트  </title>

<style>
	div{
	background-color: gray;
	width: 500px;
	}
</style>

</head>
<body>
<center>
<div> 
&nbsp;
	<div>
		<h1>미승인 강사 리스트</h1>
	</div>
&nbsp;
</div>

<table border="3">
<tr>
	<th>아이디</th>
	<th>이메일</th>
	<th>전화번호</th>
	<th>이름</th>
	<th>회원 등급</th>
	<th>자기소개</th>
	<th>자격증</th>
	<th>승인/거부</th>
</tr>
<c:forEach var="member2list" items="${member2list }">
	<tr>
		<td>${member2list.id }</td> 
		<td>${member2list.email }</td> 
		<td>${member2list.phone }</td> 
		<td>${member2list.m_name }</td>
		<td>${member2list.m_status }</td>
		<td>${member2list.m_introduction }</td>
		<td>
		<a href="resources/images/certification/${member2list.certification_filename}" target="_blank">클릭</a>
		</td><!-- ${member2list.certification_filename } -->
		<td><button type="button" onclick="location.href='updatem2?m_number=${member2list.m_number}'">승인</button></td>
		
	</tr>
</c:forEach>
</table>



</body>
</html>