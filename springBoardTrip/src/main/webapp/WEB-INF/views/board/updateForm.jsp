<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm.jsp</title>
<style type="text/css">
body{background-color:#ffffcc;}
table{
margin:auto;
line-height:30px;
backgroundcolor:ivory;
}
h2{
text-align:center;}
</style>

</head>
<body>
  <h2>글수정</h2>
  <form method="post" action="updatePro.do">
    <table border="1" align="center">
    
    <tr>
      <td>글쓴이</td>
      <td>
       <input type="text" name="writer" value="${boardDto.writer}"size="30">
       <input type="hidden" name="num" value="${boardDto.num}">
      </td>
    </tr>
    
    <tr>
      <td>글 제목</td>
      <td><input type="text" name="subject" value="${boardDto.subject}" size="40"></td>
    </tr>
    
    <tr>
     <td>글 내용</td>
     <td><textarea name="content" rows="10" cols="50">${boardDto.content}</textarea></td>
    </tr>
    
    <tr>
      <td>암호</td>
      <td><input type="password" name="pw" size="20"></td>
    </tr>
    
    <tr>
      <td colspan="2" align="center">
       <input type="submit" value="글수정">
       <input type="reset" value="다시쓰기">
       <input type="button" value="글목록" onClick="location.href='list.do?pageNum=${pageNum}'">
      </td>
    </tr>
    
    </table>
  </form>

</body>
</html>