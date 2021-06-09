<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content.jsp</title>
<style type="text/css">
h2{text-align:center;}
body{background-color:margenta;}
table{
line-hieght:30px;
background-color:Ivory;
margin:auto;
width:70%;
}
</style>
</head>
<body>
  <h2>글 내용 보기</h2>
  <table border="1">
    
    <tr>
      <td>글 번호</td>
      <td>${boardDto.num}</td>
      <td>조회수</td>
      <td>${boardDto.readcount}</td>
    </tr>
    
    <tr>
      <td>작성자</td>
      <td>${boardDto.writer}</td>
      <td>작성일</td>
      <td>
      <fmt:formatDate value="${boardDto.regdate}" pattern="yyyy-MM-dd"/>
      </td>
    </tr>
    
    <tr>
      <td>글 제목</td>
      <td colspan="3">${boardDto.subject}</td>
    </tr>
    
    <tr>
      <td>글 내용</td>
      <td colspan="3"><pre>${boardDto.content}</pre></td>
    </tr>
    
    <tr>
      <td colspan="4" align="center">
      <input type="button" value="글 수정" onClick="location.href='updateForm.do?num=${num}&pageNum=${pageNum}'">
      <input type="button" value="글 삭제" onClick="location.href='delete.do?num=${num}&pageNum=${pageNum}'">
      <input type="button" value="글 쓰기" onClick="location.href='writeForm.do'">
      <input type="button" value="답글쓰기" onClick="location.href='writeForm.do?num=${num}&ref=${boardDto.ref}&re_step=${boardDto.re_step}&re_level=${boardDto.re_level}'">
      <input type="button" value="글 목록" onClick="location.href='list.do?num=${num}&pageNum=${pageNum}'">
      </td>
    </tr>
  </table>
</body>
</html>