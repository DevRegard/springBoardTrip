<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

		<!-- 로고 -->
		<div class="header"> 
	    	<a href="main.do">
				<!-- <img src="../imgs/teamTripLogo.jpg" width="200" height="70"> -->
				<img src="resources/imgs/teamTripLogo.jpg" width="200" height="70">
			</a>
		</div> 
	
		<!-- 센터 카테고리  -->
		<div class="page-content">
		
		    <div class="content-categories">
		      <div class="label-wrapper">
		        <input class="nav-item" name="nav" type="radio" id="opt-1">
		        <label class="category" for="opt-1"><a href="travel_list.do"><span class="span_gray">나라 정보</span></a></label>
		      </div>
		      <div class="label-wrapper">
		        <input class="nav-item" name="nav" type="radio" id="opt-2">
		        <label class="category" for="opt-2"><a href="noticeList.do"><span class="span_gray"> 공지사항</span></a></label>
		      </div>
		      <div class="label-wrapper">
		        <input class="nav-item" name="nav" type="radio" id="opt-3">
		        <label class="category" for="opt-3"><a href="faq_list_.do"><span class="span_gray"> 자주 묻는 질문</span></a></label>
		      </div>
		      <div class="label-wrapper">
		        <input class="nav-item" name="nav" type="radio" id="opt-4">
		        <label class="category" for="opt-4"><a href="/trip_qna/list.do"><span class="span_gray"> Q&A</span></a></label>
		      </div>
		   </div> <!-- content-categories end -->
		    
		</div> <!-- page-content end -->
	
	</body>
	
</html>