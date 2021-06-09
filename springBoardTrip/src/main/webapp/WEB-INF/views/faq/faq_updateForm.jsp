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
	function check() {
		if (document.writeForm.writer.value == '') {
			alert("글쓴이를 입력 하시오");
			document.writeForm.writer.focus();
			return false;
		}
		if (document.writeForm.subject.value == '') {
			alert("글제목를 입력 하시오");
			document.writeForm.subject.focus();
			return false;
		}
		if (document.writeForm.content.value == '') {
			alert("글내용를 입력 하시오");
			document.writeForm.content.focus();
			return false;
		}
		if (document.writeForm.pw.value == '') {
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
	<h2>FAQ 수정하기</h2>
	<form name="writeForm" method="post" action="faq_updatePro.do" onSubmit="return check()">

		<table border="1">
			<tr>
				<td colspan="2" align="right"><a href="faq_list.do">글목록</a></td>
			</tr>

			<tr>
				<td>글쓴이</td>
				<td>
				<input type="text" name="writer" value="${faqDto.writer}" size="30">
				<input type="hidden" name="num" value="${faqDto.num}">
				</td>
			</tr>

			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" size="40"
					value="${faqDto.subject}"></td>
			</tr>

			<tr>
				<td>글내용</td>
				<td><textarea name="content" rows="10" cols="50">${faqDto.content}</textarea>
				</td>
			</tr>

			<tr>
				<td>암호</td>
				<td><input type="password" name="pw" size="20"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성"> 
				<input type="button"value="목록보기"
					onClick="location='faq_list.do'">
				</td>
			</tr>
		</table>
</body>
</html>