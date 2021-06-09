<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--새롭게 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--noticeUpdateForm.jsp--%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>noticeUpdateForm.jsp</title>
		
		<script type="text/javascript">
			function writeSave(){
				//alert("function TEST")
				if(document.noticeWriteform.user.value==""){
				  alert("작성자를 입력해 주세요");
				  document.noticeWriteform.user.focus();
				  return false;
				}
				if(document.noticeWriteform.n_subject.value==""){
				  alert("제목을 입력해 주세요");
				  document.noticeWriteform.n_subject.focus();
				  return false;
				}
				
				if(document.noticeWriteform.n_content.value==""){
				  alert("내용을 입력해 주세요");
				  document.noticeWriteform.n_content.focus();
				  return false;
				}
			        
				if(document.noticeWriteform.u_pass.value==""){
				  alert("암호를 입력해 주세요");
				  document.noticeWriteform.u_pass.focus();
				  return false;
				}
				return true; //worning : false & true
			 }
		
		</script>
		
		<!-- head - style -->
		<link href="resource/styleMain.css" type="text/css" rel="stylesheet">
		<!-- head - style-->
	</head>
	
	
	<body>
		<!-- 메세지 출력 코드 추가 -->
		<c:if test="${!msg.equals(null)}">
			<center><font color="red">${msg}</font></center>
		</c:if>
		<!-- 메세지 출력 코드 추가 END -->
		
		<div class="header" align="center"><font size="4" color="#4169E1"><b>공지사항 수정</b></font></div>

		<form name="noticeWriteform" method="post" action="noticeUpdatePro.do" 
		onSubmit="return writeSave()">
		
		<div>
			<b>작성자  :</b>
			<input type="text" name="user" size="25" value="${noticeDto.user}">
			<input type="hidden" name="n_num" value="${noticeDto.n_num}">
		</div>
			<hr>
			
		<div>
			<b>공지제목  :</b>
			<input type="text" name="n_subject" size="25" value="${noticeDto.n_subject}">
		</div>
			<hr>
		
		<div>
			<textarea name="n_content" rows="15" cols="90">${noticeDto.n_content}</textarea>
		</div>
			<hr>
		
		<div>
			<input type="password" name="u_pass" id="u_pass" placeholder="암호을 입력해 주세요." class="textarea_input" style="height: 40px;">
		</div>
			<hr>
		
			<div>
				<input type="submit" value="수정하기">
				<input type="reset" value="다시 하기">
				<input type="button" value="목록보기" onClick="location='noticeList.do?pageNum=${pageNum}'">
				<input type="button" value="취소하기" onclick="location.href='javascript:history.go(-1)'">
			</div>
		
		</form>		
	</body>
</html>