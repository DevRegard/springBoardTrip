<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>

<style type="text/css">
 body{background-color:lightgray;}
 h2{text-align:center;}
 table{margin:auto; line-height:30px;background-color:ivory;}
</style>

</head>
<body>
  <h2>글목록(전체글):${count}</h2>
  
  <table width="800">
    <tr>
     <td align="right" bgcolor="#FFB4B4">
       <font color="blue">
         <a href="writeForm.do">글쓰기</a>
       </font>
     </td>
    </tr>
   </table>
   
    <c:if test="${count==0}">
      <table width="800">
        <tr>
         <td align="center">
             게시판에 저장된 글이 없습니다 
         </td>
        </tr>
      </table>
    </c:if>
    
    <c:if test="${count>0}">
      <table width="800">
       <tr bgcolor="#FFB4B4">
         <td>글번호</td>
         <td>글제목</td>
         <td>작성자</td>
         <td>작성일</td>
         <td>조횟수</td>
         <td>IP</td>
       </tr>
       
       <c:forEach var="dto" items="${list}">
         <tr>
          <td>
           <c:out value="${number}"/>
           <c:set var="number" value="${number-1}"/>
          </td>
          
          <!-- 글 제목 줄력 -->
          <td>
           <!-- 답글 -->
           <c:if test="${dto.re_level>0}">
             <img src="resources/imgs/level.gif" width="${5*dto.re_level}" height="16">
             <img src="resources/imgs/re.gif">
           </c:if>
           
           <!-- 원글 -->
           <c:if test="${dto.re_level==0}">
             <img src="resources/imgs/level.gif" width="${5*dto.re_level}" height="16">
           </c:if>
           
           <!-- 글제목을 클릭하면 글  내용보기로 간다  -->
           <a href="content.do?num=${dto.num}&pageNum=${currentPage}">
             ${dto.subject}
           </a>
           
           <!-- 조횟수가 20번 이상이면 hot.gif표시 -->
           <c:if test="${dto.readcount>=20}">
             <img src="resources/imgs/hot.gif" border="0" height="16">
           </c:if>
          </td>
          <!-- 글 제목 줄력 끝-->
          
          <!-- 작성자 -->
          <td>
           ${dto.writer}
          </td>
          
          <!-- 날짜 -->
          <td>
           <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
          </td>
          
           <!-- 조횟수 -->
          <td>${dto.readcount}</td>
          
          <!-- ip -->
          <td>${dto.ip}</td>
         </tr>
       </c:forEach>
      </table>
    </c:if>
    <!-- 실행 -->
    
    <!-- block,page 처리 -->
    <table>
     <tr>
      <td align="center">
    <!-- 에러방지 -->
    <c:if test="${endPage>pageCount}">
      <c:set var="endPage" value="${pageCount}"/>
    </c:if>
    
    <!-- 이전블럭  -->
    <c:if test="${startPage>10}">
     <a href="list.do?pageNum=${startPage-10}">[이전블럭]</a>
    </c:if>
    
    <!-- 페이지처리 -->
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
     <a href="list.do?pageNum=${i}">[${i}]</a>
    </c:forEach>
    
    <!-- 다음블럭 -->
    <c:if test="${endPage<pageCount}">
     <a href="list.do?pageNum=${startPage+10}">[다음블럭]</a>
    </c:if>
    
      </td>
     </tr>
    </table>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
</body>
</html>