<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm.jsp</title>

<style type="text/css">
 body{background-color:lightgray;}
 h2{text-align:center;}
 table{margin:auto; line-height:30px;background-color:ivory;}
</style>

<script type="text/javascript">
function check(){
   if(document.writeForm.writer.value==''){
      alert("글쓴이를 입력 하시오");
      document.writeForm.writer.focus();
      return false;
   }
   if(document.writeForm.subject.value==''){
      alert("글제목를 입력 하시오");
      document.writeForm.subject.focus();
      return false;
   }
   if(document.writeForm.content.value==''){
      alert("글내용를 입력 하시오");
      document.writeForm.content.focus();
      return false;
   }
   if(document.writeForm.pw.value==''){
      alert("암호를 입력 하시오");
      document.writeForm.pw.focus();
      return false;
   }
   return true;
}

</script>

</head>
<body>
 <h2>게시판 글쓰기</h2>
 <form method="post" name="writeForm" action="writePro.do" onSubmit="return check()">
   <input type="hidden" name="pageNum" value="${pageNum}">
   <input type="hidden" name="num" value="${num}">
   <input type="hidden" name="ref" value="${ref}">
   <input type="hidden" name="re_step" value="${re_step}">
   <input type="hidden" name="re_level" value="${re_level}">
   
   <table border="1">
   
     <tr>
      <td colspan="2" align="right">
        <a href="list.do">글목록</a>
      </td>
     </tr>
    
     <tr>
      <td>글쓴이</td>
      <td><input type="text" name="writer" id="writer" size="30"></td>
     </tr>
    
     <tr>
      <td>글제목</td>
      <td>
      <!-- 원글 -->
      <c:if test="${num==0}">
       <input type="text" name="subject" id="subject" size="40">
      </c:if>
     
      <!-- 답글 -->
      <c:if test="${num!=0}">
       <input type="text" name="subject" id="subject" size="40" value="[답변]">
      </c:if>
      </td>
     </tr>
    
     <tr>
      <td>글내용</td>
      <td>
       <textarea name="content" id="content" rows="10" cols="50"></textarea>
      </td>
     </tr>
    
     <tr>
      <td>암호</td>
      <td><input type="password" name="pw" id="pw" size="10"></td>
     </tr>
    
     <tr>
      <td colspan="2" align="center">
       <input type="submit" value="글쓰기">
       <input type="reset" value="다시작성">
       <input type="button" value="목록보기" onClick="location.href='list.do'">
      </td>
     
    </tr>
   </table>
 </form>
</body>
</html>