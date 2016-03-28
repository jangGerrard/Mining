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

<script>
	var tl;
	var centerYear = 1500;
	var expandValue = 1;
	var bandInfos;
	function simpleOnLoad() {
		var eventSource = new Timeline.DefaultEventSource(0); //getEventSource

		var theme = Timeline.ClassicTheme.create();
		theme.event.bubble.width = 320;
		theme.event.bubble.height = 220;
		var d = Timeline.DateTime.parseGregorianDateTime(centerYear)
		bandInfos = [ Timeline.createBandInfo({
			width : "100%",
			intervalUnit : Timeline.DateTime.DECADE,//CENTURY 
			intervalPixels : 200,
			eventSource : eventSource,
			date : d,
			theme : theme
		}) ];

		tl = Timeline.create(document.getElementById("tl"), bandInfos,
				Timeline.HORIZONTAL);
		onClassifySelecion();
	}
	var resizeTimerID = null;
	function onResize() {
		if (resizeTimerID == null) {
			resizeTimerID = window.setTimeout(function() {
				resizeTimerID = null;
				tl.layout();
			}, 500);
		}
	}

	function onYearSelection() {
		var yearSelection = document.getElementById('yearSelection').value;
		centerYear = yearSelection;

		if (yearSelection == 2000) {
			alert('최대 선택은 1900년 까지 입니다!');
			return false;
		}
		simpleOnLoad();
	}

	function onClassifySelecion() {

		var classified = document.getElementById('classify').value;
		bandInfos[0].ether._band.setPerson(classified);
		onResize();
	}
</script>
</head>
<body onload="simpleOnLoad();" onresize="onResize();">

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

				<%-- <form action="${ctx }/timestamp.do" method="get" onsubmit="return onYearSelection();"> --%>
				<form action="" method="get">
					<select id="yearSelection" class="selectpicker"
						data-style="btn-primary" data-live-search="true"
						onchange="onYearSelection()">
						<option value="000">0 year</option>
						<option value="100">100 year</option>
						<option value="200">200 year</option>
						<option value="300">300 year</option>
						<option value="400">400 year</option>
						<option value="500">500 year</option>
						<option value="600">600 year</option>
						<option value="700">700 year</option>
						<option value="800">800 year</option>
						<option value="900">900 year</option>
						<option value="1000">1000 year</option>
						<option value="1100">1100 year</option>
						<option value="1200">1200 year</option>
						<option value="1300">1300 year</option>
						<option value="1400">1400 year</option>
						<option value="1500" selected="selected">1500 year</option>
						<option value="1600">1600 year</option>
						<option value="1700">1700 year</option>
						<option value="1800">1800 year</option>
						<option value="1900">1900 year</option>
					</select> <select id="classify" class="selectpicker"
						data-style="btn-success" data-live-search="true"
						onchange="onClassifySelecion()">
						<option value="1" selected="selected">한국</option>
						<option value="2">인물</option>
						<option value="3">도시/기관/학교</option>
						<option value="4">문화</option>
						<option value="5">시사</option>
						<option value="6">국제</option>
						<option value="7">재난</option>
						<option value="8">스포츠</option>
					</select>

				</form>

				<div id="tl" style=" height: 600px; border: 1px; "></div>

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
