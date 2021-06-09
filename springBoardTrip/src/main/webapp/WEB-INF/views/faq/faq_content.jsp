<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<fmt:requestEncoding value="utf-8"/>

<%--faq 관리자 페이지 --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
body{background-color:lightgray;}
h2,h4{text-align:center;}
table{
line-height:30px;
background-color:ivory;
margin:auto;
width:70%;
}

</style>
</head>

<body>
<h2>FAQ</h2>
<h4>관리자</h4>
<table border="1">
<tr>
<td  align="center">글번호</td>
<td align="center">${faqDto.num}</td>

<td  align="center">작성일</td>
<td align="center">
<fmt:formatDate value="${faqDto.regdate}" pattern="yyyy-MM-dd"/>
</td>
</tr>

<tr>
<td align="center">글제목</td>
<td align="center">${faqDto.subject}</td>

<td align="center">작성자</td>
<td  align="center">${faqDto.writer}</td>

</tr>

<tr>
<td align="center">글내용</td>
<td align="center" colspan="3">
<pre>${faqDto.content}</pre>
</td>
</tr>

<tr>
<td colspan="4" align="center">
<input type="button" value="글수정" onClick="location.href='faq_updateForm.do?num=${num}&pageNum=${pageNum}'">
<input type="button" value="글삭제" onClick="location.href='faq_delete.do?num=${num}&pageNum=${pageNum}'">
<input type="button" value="글쓰기" onClick="location.href='faq_writeForm.do'">
<input type="button" value="리스트" onClick="location.href='faq_list.do?pageNum=${pageNum}'">
</td>

</tr>
</table>

</body>
</html>