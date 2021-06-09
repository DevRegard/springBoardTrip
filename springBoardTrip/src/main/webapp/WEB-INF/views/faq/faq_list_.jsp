<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{background-color:lightgray;}
h2, h4{text-align:center;}
table{margin:auto; line-height:30px; background-color:ivory;}

</style>

</head>
<body>
<h2>FAQ</h2>
<h4>더 궁금하신 내용은 Q&A를 이용해주세요</h4>

<c:if test="${count==0}">
 <table width="50%" border="1">
   <tr>
    <td align="center">
       작성된 글이 없습니다.
    </td>
   </tr>
 </table>
</c:if>

<c:if test="${count>0}">
 <table width="50%" align="center">
  <tr bgcolor="#FFB4B4">
   <td align="center">글번호</td>
   <td align="center">글제목</td>
   <td align="center">작성자</td>
   <td align="center">작성일</td>
  </tr>
  
  <c:forEach var="dto" items="${list}">
  <tr>
  <!-- 글번호 -->
  <td align="center">
   <c:out value="${number}"/>
   <c:set var="number" value="${number-1}"/>
  </td>
  
  <!-- 글제목 -->
  <td align="center">
   <!-- 글 제목을 클릭하면 글 내용보기로 간다 content_.do -->
   <a href="faq_content_.do?num=${dto.num}&pageNum=${currentPage}">
   ${dto.subject}
   </a>
  </td>
  
  <!-- 글쓴이 -->
  <td align="center">
   ${dto.writer}
  </td>
  
  <!-- 날짜 -->
  <td align="center">
  <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
  </td>
  </tr>  
  </c:forEach>
 </table>
</c:if>
<!-- 실행 -->

<!-- block, page 처리 -->

<table width="50%" >
<tr><td align="center">
<!-- 에러방지 -->
<c:if test="${endPage>pageCount}">
<c:set var="endPage" value="${pageCount}"/>
</c:if>

<!-- 이전블럭 -->
<c:if test="${startPage>10}">
<a href="faq_list_.do?pageNum=${startPage-10}">[이전블럭]</a>
</c:if>

<!-- 페이지 처리 -->
<c:forEach var="i" begin="${startPage}" end="${endPage}">
<a href="faq_list_.do?pageNum=${i}">
[${i}]
</a>
</c:forEach>

<!-- 다음 블럭 -->
<c:if test="${endPage<pageCount}">
<a href="faq_list_.do?pageNum=${startPage+10}">[다음블럭]</a>
</c:if>

</td></tr>
</table>

</body>
</html>