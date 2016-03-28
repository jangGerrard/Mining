<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<%@ page session="false"%>
<head>
<title>Home</title>
<script
	src="${ctx}/timeline_source_v2.3.0/timeline_2.3.0/src/webapp/api/timeline-api.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/historyCss/style.css" media="screen" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ctx}/selection_bootstrap/silviomoreto-bootstrap/dist/css/bootstrap-select.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="${ctx}/selection_bootstrap/silviomoreto-bootstrap/dist/js/bootstrap-select.js"
	type="text/javascript"></script>


</head>
<body >

	<div id="content">
		<div id="header">
			<div class="left">
				<h2>Korean History</h2>
			</div>
		</div>
		<div id="main">
			<div class="pad">
				<h2>Korean History Timeline</h2>
				<h4>Timeline from wikipedia</h4>
				<img src="${ctx}/historyCss/images/img1.jpg" alt="" />
					<p><b style="font-size: 20;">404, 요청하신 Page가 없습니다.</b></p>

			</div>
		</div>


		<div id="footer">
			<div id="r">
				&copy; Copyright 2006, Your Website - RSS Feed<br /> Designed by <a
					href="http://www.free-css-templates.com/">Free CSS Templates</a>,
				Thanks to <a href="http://www.openwebdesign.org/">Website Design</a>
				- Credits: <a href="http://theinspirationgallery.com"
					title="The Inspiration Gallery">Inspiration Gallery</a>
			</div>
			<div id="l">
				<a href="http://validator.w3.org/check?uri=referer" title="Validate">XHTML</a>
				- <a href="http://jigsaw.w3.org/css-validator/check/referer"
					title="Validate">CSS</a> Valid

			</div>
		</div>

	</div>
</body>
</html>
