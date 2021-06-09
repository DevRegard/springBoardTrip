<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%--layout.jsp --%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>템플릿작업</title>
		<!-- <link href="../styleMain.css" type="text/css" rel="stylesheet"> -->
		<link href="resources/styleMain.css" type="text/css" rel="stylesheet">
	</head>
	
		<div class="task-manager">
			
			<div class="left-bar">
				<tiles:insertAttribute name="leftBar" /> <!-- leftBar.jsp -->
			</div>
			
			<!-- section 사용하여 CONTENT 정상출력 -->
			<div class="page-content">
			
				<tiles:insertAttribute name="centerBar" /> <!-- centerBar.jsp -->
				<tiles:insertAttribute name="content"/> <!-- 컨텐츠 화면 -->
				
			</div>
		</div>
	
	<body>
	</body>
</html>