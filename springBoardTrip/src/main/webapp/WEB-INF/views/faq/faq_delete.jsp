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
	if(document.delForm.pw.value==''){
	alert("암호를 입력하시오");
	document.delForm.pw.focus();
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
<table width="700"></table> 
<br>
<center><h1>글삭제</h1>
<h3>(게시물을 삭제하시려면 암호를 입력하세요.)<br><br></h3>
</center>

<form name="delForm" method="post" 
action="faq_deletePro.do" onSubmit="return check()">

<table border="1" align="center" width="300">
<tr height="30">
<td align="center" bgcolor="ivory">
암호를 입력하세요
</td>
</tr>

<tr height="40">
<td align="center" bgcolor="ivory">
암호 :&nbsp; <input type="password" name="pw" size="15">
         <input type="hidden" name="num" value="${faqDto.num}">
</td>
</tr>

<tr height="30">
<td align="center" bgcolor="ivory">
<input type="submit" value="글삭제">

<input type="button" value="글목록" 
onClick="location='faq_list.do'">
</td>
</tr>



</table>
</form>


</body>
</html>