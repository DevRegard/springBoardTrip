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
      alert("작성자를 입력 하시오");
      document.writeForm.writer.focus();
      return false;
   }
      if(document.writeForm.subject.value==""){
  		alert("나라이름을 입력하십시요.");
  		document.writeForm.subject.focus();
  		return false;
  	}
  	if(document.writeForm.language.value==""){
  		alert("언어를 입력하십시요.");
  		document.writeForm.language.focus();
  		return false;
  	}
  	if(document.writeForm.distance.value==""){
  		alert("비행시간을 입력하십시요.");
  		document.writeForm.distance.focus();
  		return false;
  	}
  	if(document.writeForm.capital.value==""){
  		alert("수도를 입력하십시요.");
  		document.writeForm.capital.focus();
  		return false;
  	}
  	if(document.writeForm.food.value==""){
  		alert("음식을 입력하십시요.");
  		document.writeForm.food.focus();
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
 <h2>나라 정보</h2>
 <form method="post" name="writeForm" action="travel_writePro.do" onSubmit="return check()">
   <input type="hidden" name="pageNum" value="${pageNum}">
   <input type="hidden" name="num" value="${num}">
   
   <table border="1">
   
    
    <tr>
     <td>글쓴이</td>
     <td><input type="text" name="writer" id="writer" size="20"></td>
    
<!-- 나라이름  -->
<td>나라이름</td>
<td><input type="text" name="subject" id="subject" size="20" ></td>
</tr>

    <tr>
<td>언어</td>
<td><input type="text" name="language" id="language" size="20" ></td>



<td>비행시간</td>
<td><input type="text" name="distance" id="distance" size="14" >  시간</td>
</tr>

<tr>
<td>수도</td>
<td><input type="text" name="capital" id="capital" size="20" ></td>



<td>음식</td>
<td><input type="text" name="food" id="food" size="20" ></td>
</tr>
    
    <tr>
     <td>글내용</td>
     <td colspan="3">
      <textarea name="content" id="content" rows="10" cols="50"></textarea>
     </td>
    </tr>
    
    <tr>
     <td>암호</td>
     <td colspan="3"><input type="password" name="pw" id="pw" size="10"></td>
    </tr>
    
    <tr>
<td colspan="4" align="center">
<!-- 원글일 때 -->
<input type="submit" value="글쓰기">
<input type="reset" value="다시쓰기">
<input type="button" value="글목록" onClick="location.href='travel_list.do'">

</td>
</tr>
    
   </table>
 </form>
</body>
</html>