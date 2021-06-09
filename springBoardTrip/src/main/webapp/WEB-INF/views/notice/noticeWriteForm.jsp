<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--noticeWriteForm.jsp --%>

<%--로그인 유무에 따라 글쓰기 가능 --%>
<c:if test="${empty sessionScope.memM_id}"> <!-- 로그인이 안된 상태이면 -->
	<script>
		alert("로그인을 하셔야 글쓰기가 가능 합니다.");
	</script>
	<Meta http-equiv="Refresh" content="0;url=${ctxpath}/member/main.do">
</c:if>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>noticeWriteForm.jsp</title>
		
		<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			function writeSave(){
				//alert("function TEST")
				if(document.noticeWriteForm.user.value==""){
					alert("작성자를 입력해 주세요");
					document.noticeWriteForm.user.focus();
					return false;
				}
				
				if(document.noticeWriteForm.u_pass.value==""){
					alert("암호를 입력해 주세요");
					document.noticeWriteForm.u_pass.focus();
					return false;
					}
				
				if(document.noticeWriteForm.n_subject.value==""){
					alert("제목을 입력해 주세요");
					document.noticeWriteForm.n_subject.focus();
					return false;
				}
				
				if(document.noticeWriteForm.n_content.value==""){
					alert("내용을 입력해 주세요");
					document.noticeWriteForm.n_content.focus();
				 	return false;
				}
				
				return true; //worning : false & true
			 }
		
		</script>		
		
		<link href="resource/styleMain.css" type="text/css" rel="stylesheet">
		
	</head>
	
	
	<body>
    	<div class="header" align="center"><font size="4" color="#4169E1"><b>공지사항 등록</b></font></div>
    	
		<form name="noticeWriteForm" method="post" action="noticeWritePro.do" onSubmit="return writeSave()">
		
			<input type="hidden" name="n_num" value="${n_num}"> 
			<div>
				<input type="text" name="user" id="user" placeholder="작성자을 입력해 주세요." class="textarea_input" style="height: 40px;"  width="50%";>
				<input type="password" name="u_pass" id="u_pass" placeholder="암호을 입력해 주세요." class="textarea_input" style="height: 40px;">
				<hr>
				<input type="text" name="n_subject" id="n_subject" placeholder="제목을 입력해 주세요." class="textarea_input" style="height: 40px;">
			</div>
				<hr>
			<div>
				<textarea name="n_content" id="n_content" rows="15" cols="130" placeholder="공지 사항을 입력해 주세요" class="textarea_input" ></textarea>
			</div>
				<hr>
			<div>
				<input type="submit" value="등록하기">
				<input type="reset" value="내용초기화">
				<input type="button" value="공지목록" onClick="location='noticeList.do'">
			</div>
		</form>
	</body>
</html>