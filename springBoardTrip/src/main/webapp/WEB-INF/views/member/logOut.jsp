<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logOut.jsp</title>
</head>
<body>
  <c:remove var="m_id" scope="session"/><!-- 세션무효화 , Bye~! -->
이용해 주셔서 감사 합니다
<input type="button" value="로그인 페이지" onClick="location='loginForm.do'">

</body>
</html>