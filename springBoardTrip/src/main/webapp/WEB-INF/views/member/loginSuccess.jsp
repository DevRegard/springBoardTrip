<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginSuccess.jsp</title>
<script type="text/javascript">
function updateMember(){
	document.updateForm.action="editForm.do"//회원정보 수정
	document.updateForm.submit();//서버로 전송
}//updateMember() end
function deleteMember(){
	document.delForm.action="deleteMember.do"//회원 탈퇴
	document.delForm.submit();//서버로 제출
}//deleteMember() end

</script>
</head>
<body>
	<h2>${memberDto.m_name}님저희 홈에 오신 것을 환영합니다.</h2>

	<c:set var="m_id" value="${memberDto.m_id}" scope="session" />
	<table>
		<tr>
			<td><a href="travel_list.do">게시판 목록</a></td>
			<td><a href="javascript:updateMember()">내 정보수정</a></td>

			<td><a href="javascript:deleteMember()">회원탈퇴</a></td>
			<td><a href="logOut.do">로그아웃</a></td>
		</tr>
	</table>
	<form name="updateForm" method="post">
		<input type="hidden" name="m_id" value="${m_id}">
	</form>

	<form name="delForm" method="post">
		<input type="hidden" name="m_id" value="${m_id}">
	</form>

</body>
</html>