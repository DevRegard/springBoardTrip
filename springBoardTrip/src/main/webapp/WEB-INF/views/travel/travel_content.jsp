<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<fmt:requestEncoding value="utf-8"/>

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
		<center><h1>${travelDto.subject}<br></h1></center>
		
		<table border="1">
			<tr>
				<td width="100" align="center" bgcolor="ivory">언어</td>
				<td width="100" align="center">${travelDto.language}</td>
				
				<td width="100" align="center" bgcolor="ivory">비행시간</td>
				<td width="100" align="center">${travelDto.distance}  시간</td>
			</tr>
			
			<tr>
				<td width="100" align="center" bgcolor="ivory">수도</td>
				<td width="100" align="center">${travelDto.capital}</td>
				
				<td width="100" align="center" bgcolor="ivory">음식</td>
				<td width="100" align="center">${travelDto.food}</td>
			</tr>
			
			<tr>
				<td align="center">글내용</td>
				<td colspan="3" align="center">
				${travelDto.content}
				</td>
			</tr>
			
			<tr>
				<td align="center">작성자</td>
				<td align="center">${travelDto.writer}</td>
				
				<td align="center">조회수</td>
				<td align="center">${travelDto.readcount}</td>
			</tr>
			
			<tr>
				<td align="center">작성일</td>
				<td align="center">
				<fmt:formatDate value="${travelDto.regdate}" pattern="yyyy-MM-dd"/>
				</td>
				
				<td align="center">IP</td>
				<td align="center">${travelDto.ip}</td>
			</tr>
			
			
			<tr>
				<td colspan="4" align="center">
				<input type="button" value="글수정" onClick="location.href='travel_updateForm.do?num=${num}&pageNum=${pageNum}'">
				<input type="button" value="글삭제" onClick="location.href='travel_delete.do?num=${num}&pageNum=${pageNum}'">
				<input type="button" value="글쓰기" onClick="location.href='travel_writeForm.do'">
				<input type="button" value="리스트" onClick="location.href='travel_list.do?pageNum=${pageNum}'">
				</td>
			
			</tr>
		</table>
	</body>
</html>

