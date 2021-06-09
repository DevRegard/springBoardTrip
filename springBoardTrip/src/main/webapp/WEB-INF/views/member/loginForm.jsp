<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
<style type="text/css">
body{
background-color:#FFE4E1;
}
table{
margin:auto;
line-height:30px;
background-color:#e3dbeb;
}
h2{
text-align:center;
}
</style>

<script type="text/javascript">
function check(){
	if(document.loginForm.m_id.value==''){
		alert("ID를 입력하세요");
		document.loginForm.m_id.focus();
		return false;
	}
	
	if(document.loginForm.m_pw.value==''){
		alert("암호를 입력하세요");
		document.loginForm.m_pw.focus();
		return false;
	}
	return true;	
}//check() end
</script>
</head>
<body>
  <c:if test="${!msg.equals(null)}">
   ${msg}  
  </c:if>
  <h2>로그인</h2>
  <form method="post" name="loginForm" action="loginPro.do" onSubmit="return check()"> 
    <table border="1">
     <tr>
      <td align="center">ID</td>
      <td><input type="text" name="m_id" size="20"></td>
     </tr>
     
     <tr>
      <td align="center">암호</td>
      <td><input type="password" name="m_pw" size="20"></td>
     </tr>
     
     <tr>
      <td colspan="2" align="center">
       <input type="submit" value="로그인">
       <input type="reset" value="다시입력">
       <input type="button" value="회원가입" onclick="location.href='insertForm.do'">
      </td>
     </tr>
    
    </table>
  </form>
</body>
</html>