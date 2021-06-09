<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link href="style.css" rel="stylesheet" type="text/css">
	
	<style type="text/css">
		body {
			background-color: lightgray;
		}
		
		h2 {
			text-align: center;
		}
		
		table {
			margin: auto;
			line-height: 30px;
			background-color: ivory;
		}
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
<c:if test="${!msg.equals(null)}">
<center><font color="red">${msg}</font></center>
</c:if>
	<h2>TRAVEL 수정하기</h2>
	<form name="writeForm" method="post" action="travel_updatePro.do" onSubmit="return check()">

		<table border="1">
			<tr>
				<td colspan="4" align="right"><a href="travel_list.do">글목록</a></td>
			</tr>

			<tr>
				<td>글쓴이</td>
				<td>
				<input type="text" name="writer" value="${travelDto.writer}" size="20">
				<input type="hidden" name="num" value="${travelDto.num}">
				</td>
			
				<td>나라이름</td>
				<td><input type="text" name="subject" size="20"
					value="${travelDto.subject}"></td>
			</tr>
			
			<tr>
				<td>언어</td>
				<td><input type="text" name="language" value="${travelDto.language}" size="20" ></td>
				
				<td>비행시간</td>
				<td><input type="text" name="distance" value="${travelDto.distance}" size="14" >  시간</td>
			</tr>
			
			<tr>
				<td>수도</td>
				<td><input type="text" name="capital" value="${travelDto.capital}" size="20" ></td>
				
				<td>음식</td>
				<td><input type="text" name="food" id="food" value="${travelDto.food}" size="20" ></td>
			</tr>


			<tr>
				<td>글내용</td>
				<td colspan="3"><textarea name="content" rows="10" cols="50">${travelDto.content}</textarea>
				</td>
			</tr>

			<tr>
				<td>암호</td>
				<td colspan="3"><input type="password" name="pw" size="40"></td>
			</tr>

			<tr>
				<td colspan="4" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성"> 
				<input type="button"value="목록보기"
					onClick="location='travel_list.do'">
				</td>
			</tr>
		</table>
</body>
</html>