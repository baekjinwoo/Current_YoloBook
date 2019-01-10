<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title> 미승인 프로그램 리스트  </title>

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
		<h1>미승인 프로그램 리스트</h1>
	</div>
&nbsp;
</div>

<table border='2'>
	<tr>
		<th>프로그램명</th>
		<th>날짜</th>
		<th>시작시간 </th>
		<th>종료시간 </th>
		<th>가격</th>
		<th>인원제한 </th>
		<th>프로그램 소개</th>
		<th>파일명</th>
		<th>프로그램 분류</th>
		<th>P_STATUS</th>
		<th>강의계획서</th>
		<th>승인/거부</th>
	<tr>
	
<c:forEach var="listOfProgramBeforeApproval" items="${listOfProgramBeforeApproval}"> 
	<tr>
		<td>${listOfProgramBeforeApproval.p_name }</td>
		<td>${listOfProgramBeforeApproval.p_date }</td>
		<td>${listOfProgramBeforeApproval.starttime }</td>
		<td>${listOfProgramBeforeApproval.endtime }</td>
		<td>${listOfProgramBeforeApproval.price }</td>
		<td>${listOfProgramBeforeApproval.limitofstudents }</td>
		<td>${listOfProgramBeforeApproval.p_introduction }</td>
		<td>${listOfProgramBeforeApproval.p_syllabus_filename }</td>
		<td>${listOfProgramBeforeApproval.p_class }</td>
		<td>${listOfProgramBeforeApproval.p_status }</td>
		<td><a href="resources/images/syllabus/${listOfProgramBeforeApproval.p_syllabus_filename }" target="_blank">클릭</a></td>
		<td><button type="button" onclick="location.href='approveProgram?p_number=${listOfProgramBeforeApproval.p_number}'">승인</button></td>
	</tr>
	
	</c:forEach>
</table>



</body>
</html>