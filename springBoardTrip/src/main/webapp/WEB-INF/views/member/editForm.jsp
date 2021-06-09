<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editForm.jsp</title>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function openDaumPostcode(){
   new daum.Postcode({
      oncomplete:function(data){
         document.getElementById('m_zipcode').value=data.zonecode;
         document.getElementById('m_addr').value=data.address;
       }
   }).open();
}//openDaumPostcode()---
</script>

<style type="text/css">
body{background-color:#FFE4E1}
 h2{text-align:center;}
 table{
 margin:auto;
 line-height:30px;
 padding:3px;
 background-color:#FFEFD5;
 }
</style>


<script type="text/javascript">
function check(){
   //데이터 유효성 체크
     
   if($('#m_pw').val()==''){
      alert("암호를 입력 하세요");
      $('#m_pw').focus();
      return false;
   }//if end
   
   if($('#m_pw2').val()==''){
      alert("암호확인을 입력 하세요");
      $('#m_pw2').focus();
      return false;
   }//if end
   
   if($('#m_pw').val()!=$('#m_pw2').val()){
      alert("암호와 암호 확인이 틀립니다");
      $('#m_pw').val('');
      $('#m_pw2').val('');
      $('#m_pw').focus();
      return false;
   }
   return true;
}//check() end
</script>
</head>
<body>
  <h2>회원정보 수정</h2>
  <form method="post" name="editForm" action="editPro.do" onSubmit="return check()">
    <table border="1">
      
      <tr>
        <td>ID</td>
        <td>
        &nbsp;&nbsp;<b>${memberDto.m_id}</b>
         <input type="hidden" name="m_id" id="m_id" size="20" value="${memberDto.m_id}" readOnly>
        </td>
      </tr>
      
      <tr>
       <td>암호</td>
       <td><input type="password" name="m_pw" id="m_pw" size="20"></td>
      </tr>
      
      <tr>
       <td>암호확인</td>
       <td><input type="password" name="m_pw2" id="m_pw2" size="20"></td>
      </tr>
      
      <tr>
       <td>이름</td>
       <td><input type="text" name="m_name" id="m_name" size="20" value="${memberDto.m_name}"></td>
      </tr>
      
      <tr>
       <td>주민번호</td>
       <td>
         <input type="text" name="m_jumin1" id="m_jumni1" size="6"
					onkeyup="if(this.value.length==6) editForm.m_jumin2.focus();">
		-<input type="text" name="m_jumin2" id="m_jumin2" size="7"
					onkeyup="if(this.value.length==7) editForm.m_email.focus();">
       </td>
      </tr>
      
      <tr>
       <td>Email</td>
       <td>
       <input type="text" name="m_email" id="m_email" size="30" value="${memberDto.m_email}">@
       <input type="text" name="m_email2" id="m_email2" size="30" value="${memberDto.m_email2}">    
       </td>
      </tr>
      
      <tr>
       <td>우편번호</td>
       <td>
        <input type="text" name="m_zipcode" id="m_zipcode" size="7" value="${memberDto.m_zipcode}">
        <input type="button" value="주소찾기" onClick="openDaumPostcode()">
       </td>
      </tr>
      
      <tr>
       <td>주소</td>
       <td><input type="text" name="m_addr" id="m_addr" size="50" value="${m_addr}">
       <br>
                상세주소:&nbsp;<input type="text" name="m_addr2" id="m_addr2" size="20" value="${m_addr2}">
       </td>
      </tr>
      
      <tr>
       <td align="center" colspan="2">
        <input type="submit" value="회원정보수정">
        <input type="reset" value="다시입력">
        <input type="button" value="취소" onclick="history.back(-1);">
       
       </td>
      </tr>
          
    </table>
  
  </form>

</body>
</html>