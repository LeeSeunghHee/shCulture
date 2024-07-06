<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	const cpath = '${cpath}';
</script>
<link type="text/css" rel="stylesheet"
	href="${cpath }/resources/css/style.css">
<script src="${cpath }/resources/js/script.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- jQuery CDN 호스트 사용 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>