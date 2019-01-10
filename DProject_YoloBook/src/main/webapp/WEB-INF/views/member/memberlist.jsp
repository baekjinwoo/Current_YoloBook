<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>회원목록</title>
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
		<h1>회원목록</h1>
	</div>
&nbsp;
</div>
<br>

<form action="memberlist" method="get">
		<table border="3">
		<tr>
		<th> 아이디 </th>
		<th> 이메일 </th>
		<th> 전화번호 </th>
		<th> 이름 </th>
		<th> 회원 등급 </th>
		<th> 등급명 </th>
		<th> 자기소개 </th>
		<th> 자격증명 </th>
		</tr>
			<c:forEach var="memberlist" items="${memberlist }" varStatus="status">
				<tr>
				<td>${memberlist.id }</td> 
				<td>${memberlist.email }</td> 
				<td>${memberlist.phone }</td> 
				<td>${memberlist.m_name }</td>
				<td>${memberlist.m_status }</td>
				<th>${mgradeList[status.index] } </th>
				<td>${memberlist.m_introduction }</td>
				<td>${memberlist.certification_filename }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
		<input type=button value='회원 삭제' onclick="location.href='mdelete'">
		<input type=button value='회원 수정' onclick="location.href='mupdate'">
</center>
</body>

</html>