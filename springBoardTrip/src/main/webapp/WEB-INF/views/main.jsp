<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	메인화면
	협업과정에서 상반된 컨셉 사용된 페이지 
	수정은 보류, 필요하면 깃허브로 수정
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국내외 여행 정보 사이트</title>

<!-- head -->
<link href="resources/styleMain.css" type="text/css" rel="stylesheet">

</head>
<body>

  <table width="800" height="500" align="center" border="1">
	<tr>
	 <td width="500" height="500">
	  <img src="resources/imgs/여행.png" alt="메인 페이지 이미지" width="100%" height="100%">
     </td>	
	</tr>
	<tr>
	  <td>
	   <input type="button" value="게시판 목록" onClick="location='travel_list.do'">
	   <input type="button" value="로그인" onClick="location='loginForm.do'">
	   	   국내외 여행 정보 제공 사이트
	  </td>
	</tr>
  </table>
</body>
</html>