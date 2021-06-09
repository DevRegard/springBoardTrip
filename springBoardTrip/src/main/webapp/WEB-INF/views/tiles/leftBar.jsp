<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<!-- 왼쪽 메뉴바, left.jsp -->
<html>
	<head>
		<meta charset="UTF-8">
		<title>leftBar.jsp</title>
		<!-- <link href="../styleMain.css" type="text/css" rel="stylesheet"> -->
		<link href="resources/styleMain.css" type="text/css" rel="stylesheet">
	</head>
	
	
	<body>
		<div class="left-bar">
		    <div class="upper-part">
		      <div class="actions">
		        <div class="circle"></div>
		        <div class="circle-2"></div>
		      </div>
		    </div>
		    
		    <!-- 왼쪽메뉴바 -->
		    <div class="left-content">
		      <ul class="action-list">
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-inbox"
		            viewBox="0 0 24 24">
		            <path d="M22 12h-6l-2 3h-4l-2-3H2" />
		            <path
		              d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z" />
		          </svg>
		          <a href="main.do"><span> 메인화면</span></a>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-star">
		            <polygon
		              points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
		            </svg>
		          <a href="travel_list.do"><span> 나라정보</span></a>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-calendar"
		            viewBox="0 0 24 24">
		            <rect width="18" height="18" x="3" y="4" rx="2" ry="2" />
		            <path d="M16 2v4M8 2v4m-5 4h18" />
		          </svg>
		          <a href="noticeList.do"><span> 공지사항</span></a>
		        </li>
		        
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-hash">
		            <line x1="4" y1="9" x2="20" y2="9" />
		            <line x1="4" y1="15" x2="20" y2="15" />
		            <line x1="10" y1="3" x2="8" y2="21" />
		            <line x1="16" y1="3" x2="14" y2="21" /></svg>
		           
		          <a href="faq_list_.do"><span> 자주묻는질문</span></a>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-users">
		            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
		            <circle cx="9" cy="7" r="4" />
		            <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
		            <path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
		          <a href="${ctxpath}/trip_qna/list.do"><span> Q&A</span></a>
		        </li>
		        
		      </ul>
		      <ul class="category-list">
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-users">
		            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
		            <circle cx="9" cy="7" r="4" />
		            <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
		            <path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
		          <a href="loginForm.do"><span class="span_gray">로그인</span></a>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-sun"
		            viewBox="0 0 24 24">
		            <circle cx="12" cy="12" r="5" />
		            <path
		              d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"/>
		          </svg>
		          <a href="https://m.kma.go.kr/m/world/city.jsp"><span class="span_gray">날씨정보</span></a>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-trending-up">
		            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18" />
		            <polyline points="17 6 23 6 23 12" /></svg>
		          <a href="https://finance.daum.net/exchanges"><span class="span_gray">환율정보</span></a>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-zap">
		            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" /></svg>
		           <a href="faq_list.do"><span class="span_gray">개발자</span></a>
		        </li>
	     	 </ul>
	   	 </div> <!-- 왼쪽메뉴바 끝 -->
	  </div> <!--왼쪽DIV 전체 끝 -->
	</body>
</html>