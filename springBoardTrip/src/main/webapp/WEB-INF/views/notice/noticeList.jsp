<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>
<%--noticeList.jsp --%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>noticeList.jsp</title>
		<link href="resources/styleMain.css" type="text/css" rel="stylesheet">
	</head>
	
	
	<body>
		
		<div class="header" align="center"><font size="5" color="#4169E1"><b>공지사항</b></font></div>
		<center><b>글목록(전체 글갯수: ${count})</b></center> 
		
		<br>		

		
		<c:if test="${count == 0}">
			<table border="1">
				<tr>
					<td align="center">
						공지사항 게시판에 저장된 글이 없습니다.
					</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${count > 0 }">
	
			<table align="center" class="table_main">
				<tr class="tr_field">
					<td width="60" id="td_line"><b>글번호</b></td>
					<td width="250" id="td_line"><b>공지 제목</b></td>
					<td width="100" id="td_line"><b>작성자</b></td>
					<td width="150" id="td_line"><b>공지날짜</b></td>
					<td width="60" id="td_line"><b>조회수</b></td>
				<!-- 	<td width="100" align="center">IP</td> -->
				</tr>
				
				<c:forEach var="dto" items="${list}"> <!-- model.addAttribute("list",list); -->
					<tr height="30">
						<%--글번호 --%>
						<td align="center"  id="td_line">
							<c:out value="${number }"/>
							<c:set var="number" value="${number - 1 }"/>
						</td>
					
						
						<%--글제목 --%>
						<td id="td_line">
							<%-- content.do --%>
							<a href="noticeContent.do?n_num=${dto.n_num}&pageNum=${currentPage}">
								${dto.n_subject}
							</a>
							
							<%-- 30이상 조회 하면 <span>표시--%>
							<c:if test="${dto.n_readcount>30 }"> <!-- readcount -->
								&nbsp&nbsp&nbsp&nbsp&nbsp<span class="tag review">HOT</span>
							</c:if>							
						</td>
						
						<%--작성자 --%>
						<td align="center" id="td_line">
							<a href="mailto:hong@naver.com">${dto.user}</a>
						</td>
					
						<%--날짜 --%>
						<td align="center" id="td_line">
							<fmt:formatDate value="${dto.wdate}" pattern="yyyy-MM-dd"/>
							<%-- <fmt:formatDate value="${dto.wdate}" pattern="yyyy-MM-dd hh:mm:ss"/> --%>
						</td>
						
						<%--조회수 --%>
						<td align="center" id="td_line">
							${dto.n_readcount }
						</td>
						
						<td>
						<!-- 30이상 조회 하면 <span>표시 -->
							<c:if test="${dto.n_readcount>30 }"> <!-- readcount -->
								<span class="tag review" align="right">HOT 정보</span>
							</c:if>		
						</td>
						<!-- IP, 표시안함 -->
						<%-- <td> ${dto.ip} </td> --%>
					</tr>	
				</c:forEach>
			</table>
		</c:if>
		
		<%--실행 --%>
		<%--이전블럭 페이지처리 다음블럭 --%>
		
		<%--
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		 --%>
		 
		<c:if test="${count > 0 }">
		
			<table align="center">
				<tr><td>
				<%--
				<fmt:parseNumber var="result" value="${currentPage/10}" integerOnly="true"/>
				<c:set var="startPage" value="${result * 10 + 1 }"/>
				<c:set var="endPage" value="${startPage + pageBlock - 1 }"/>
				 --%>
				 
				<%--에러방지 --%>
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				
				<%--이전블럭 --%>
				<c:if test="startPage > 10">
					<a href="noticeList.do?pageNum=${startPage - 10}">
					[이전블럭]
					</a>
				</c:if>
				
				<%--페이지 처리 --%>
				<c:forEach var="i" begin="${startPage }" end="${endPage}">
					<a href="noticeList.do?pageNum=${i}">
						[${i}]
					</a>
				</c:forEach>
				
				<%--다음 블럭 --%>
				<c:if test="${endPage < pageCount }">
					<a href="notice/noticeList.do?pageNum=${startPage + 10}">
					[다음블럭]
					</a>
				</c:if>
				</td></tr>
			</table>
		</c:if>
				<table align="center">
			<tr>
				<td class="tag approved">
					<a href="noticeWriteForm.do"><b class="tag approved">공지 등록</b></a>
				</td>
			</tr>
		</table>
		
	</body>
</html>