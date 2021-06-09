<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--noticeContent.jsp --%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>noticeContent.jsp</title>
		
		<!-- head - style -->
		<link href="resources/styleMain.css" type="text/css" rel="stylesheet">
		<!-- head - style-->
	</head>
	
	
	<body>

		<div class="header" align="center"><font size="4" color="#4169E1"><b>공지사항</b></font></div>
		<div>
			<b>글번호</b> ${noticeDto.n_num}
			&nbsp&nbsp&nbsp&nbsp&nbsp
			<b>조회수</b> ${noticeDto.n_readcount}
			&nbsp&nbsp&nbsp&nbsp&nbsp
			<b>작성일</b>: <fmt:formatDate value="${noticeDto.wdate}" pattern="yyyy-MM-dd"/>
		</div>
		
			<hr>
			
		<div>
			<b>작성자</b>  : ${noticeDto.user}
		</div>
			<hr>
		<div>
			<b>글제목</b>  : ${noticeDto.n_subject}
		</div>
			<hr>
		<div align="center">
			<textarea name="n_content" rows="15" cols="90" readonly>${noticeDto.n_content}</textarea>
		</div>
			<hr>
		<div>
			<input type="button" value="수정" onClick="location='noticeUpdateForm.do?n_num=${n_num}&pageNum=${pageNum}'">
			<input type="button" value="삭제" onClick="location.href='noticeDeleteForm.do?n_num=${n_num}&pageNum=${pageNum}'">
			<input type="button" value="공지작성" onClick="location='noticeWriteForm.do?'">
			<input type="button" value="목록" onClick="location='noticeList.do?pageNum=${pageNum}'">
		</div>
	
	</body>
</html>