<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--noticeDeleteForm.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>noticeDeleteForm.jsp</title>
		<link href="../styleMain.css" type="text/css" rel="stylesheet">
		
		<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
		
		<script type="text/javascript">
			<%--JQuery Function Use --%>
			function check(){ 
				
				if($('#u_pass').val()==""){
					alert("암호를 입력 하세요");
					$("#u_pass").focus();
					return false;
				}//if end
				
				if($('#u_pass2').val()==""){
					alert("암호를 추가 입력 하세요");
					$("#u_pass2").focus();
					return false;
				}//if end
				
				if($('#u_pass').val() != $('#u_pass2').val()){
					alert("암호가 서로 일치하지 않습니다.");
					$('#u_pass').val('');
					$('#u_pass2').val('');
					$('#u_pass').focus();
					return false;
				}//if end 
				
				return true;
			}//check() end
			
		</script>
	</head>
	
	
	<body>
		<c:if test="${!msg.equals(null)}">
			<center><font color="red">${msg}</font></center>
		</c:if>
		
		<div class="header" align="center"><font size="4" color="#4169E1"><b>게시물을 삭제하시겠습니까?</b></font></div>
		
		<br><br><br><br><br><br>
		<form name="delForm" method="post" action="noticeDeletePro.do" onSubmit="return check()">
		
		<div class="header" align="center"><font size="2" color="red"><b>삭제를 진행하시면 게시물은 영구적으로 소멸되며 복구되지 않습니다. </b></font></div>
		<div class="header" align="center"><font size="2" color="red"><b>그래도 삭제를 원하시면 암호를 입력해주세요 </b></font></div>
		<div>
			<hr>
				<input type="password" name="u_pass" id="u_pass" placeholder="암호를 입력해 주세요" class="textarea_input" style="height: 40px;">
				<input type="hidden" name="n_num" value="${noticeDto.n_num}">
				<input type="password" name="u_pass2" id="u_pass2" placeholder="암호를 추가 입력해주세요" class="textarea_input" style="height: 40px;">
			<hr>
		</div>
		
		<div>
			<input type="submit" value="삭제합니다">
			<input type="button" value="취소합니다" onclick="location.href='javascript:history.go(-1)'">
		</div>
		
		</form>
	</body>
</html>