<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--insertForm.jsp --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
table, tr, td {
	border: 1px solid black;
	align: center;
              }

tr {line-height: 30px;}
</style>

<script src="//code.jquery.com/jquery-3.5.1.min.js">
</script>

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

<script type="text/javascript">
 function check(){
    //데이터 유효성 체크
    if($('#m_id').val()==''){
       alert("id를 입력 하세요");
       $('#m_id').focus();
       return false;
    }//if end
    
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
    
    if($('#m_name').val()==''){
       alert("이름을 입력 하세요");
       $('#m_name').focus();
       return false;
    }
    if($('#m_jumin1').val()==''){
        alert("주민번호 앞자리를 입력하세요");
        $('#m_jumin1').focus();
        return false;
     }
    if($('#m_jumin2').val()==''){
        alert("주민번호 뒷자리를 입력하세요");
        $('#m_jumin2').focus();
        return false;
     }
    if($('#m_email').val()==''){
       alert("Email을 입력하세요");
       $('#m_email').focus();
       return false;
    }
    if($('#m_email2').val()==''){
        alert("Email2를 입력하세요");
        $('#m_email2').focus();
        return false;
     }
    if($('#m_zipcode').val()==''){
        alert("우편번호를 입력하세요");
        $('#m_zipcode').focus();
        return false;
     }
    if($('#m_addr').val()==''){
        alert("주소를 입력하세요");
        $('#m_addr').focus();
        return false;
     }
    if($('#m_addr2').val()==''){
        alert("상세주소를 입력하세요");
        $('#m_addr2').focus();
        return false;
     }

    return true;
 }//check() end
 
 function onfocus_id(){
    if($('#idcheck').val()=='-1'){
       alert('id중복체크를 하세요');
       $('#m_id').focus();
       return false;
    }
 }

 //-----------------------------
 //Ajax사용하여 id사용 여부 체크
 //-----------------------------
 function confirmIdCheck(){
    if($('#m_id').val()==''){
       alert("id를 입력 하세요");
    }else{
       $.ajax({
         type:'POST',
         url:'idCheck.do',
         data:"m_id="+$('#m_id').val(),
          dataType:'JSON',
         success:function(data){
            //alert(data);
            if(data.check==-1){
               alert("사용중인 id");
               $('#m_id').val('').focus();
            }else if(data.check==1){
               alert("사용 가능한 id");
               $('#m_pw').focus();
            }
         }//success
       });
    }//else end
    
    $('#idcheck').val('1');//id중복 체크가 되었을때 
    
 }//confirmIdCheck() end
 
</script>

</head>
<body>
	<form method="post" name="userForm" action="insertPro.do"
		onSubmit="return check()">
		<table>

			<tr>
				<td colspan="2" align="center"><b><font size=+2>회원가입</font></b>
				</td>
			</tr>

			<tr>
				<td>사용자 ID</td>
				<td>
				 <input type="text" name="m_id" id="m_id" size="16"> 
				 <input type="hidden" name="idcheck" id="idcheck" value="-1"> 
				 <input type="button" value="id중복체크" onClick="confirmIdCheck()">
			    </td>
			</tr>

			<tr>
				<td>암호</td>
				<td>
				 <input type="password" name="m_pw" id="m_pw" size="12" onFocus="onfocus_id()">
				</td>
			</tr>

			<tr>
				<td>암호확인</td>
				<td>
				 <input type="password" name="m_pw2" id="m_pw2" size="12">
				</td>
			</tr>

			<tr>
				<td>사용자이름</td>
				<td>
				 <input type="text" name="m_name" id="m_name" size="30">
				</td>
			</tr>

			<tr>
				<td>주민번호</td>
				<td>
				 <input type="text" name="m_jumin1" id="m_jumin1" size="6"
					onkeyup="if(this.value.length==6) userForm.m_jumin2.focus();">
				 -<input type="text" name="m_jumin2" id="m_jumin2" size="7"
					onkeyup="if(this.value.length==7) userForm.m_email.focus();">
				</td>
			</tr>

			<tr>
				<td>이메일</td>
				<td>
				 <input type="text" name="m_email" id="m_email" size="30">@
				 <input type="text" name="m_email2" id="m_email2" size="30">
				</td>
			</tr>

			<tr>
				<td align="center">우편번호</td>
				<td>
				    <input type="text" name="m_zipcode" id="m_zipcode" size="7">
					<input type="button" value="주소검색" onClick="openDaumPostcode()">
				</td>
			</tr>

			<tr>
				<td>주소</td>
				<td>
				 <input type="text" name="m_addr" id="m_addr" size="50" readonly />
					<br>상세주소:&nbsp;
				 <input type="text" name="m_addr2" id="m_addr2" size="30">
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				 <input type="submit" value="회원가입"> 
				 <input type="reset" value="취소"> 
				 <input type="button" value="가입안함" onClick="location='loginForm.do'">
				</td>
			</tr>
		</table>

	</form>
</body>
</html>