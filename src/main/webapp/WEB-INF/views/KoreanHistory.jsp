<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<%@ page session="false" %>
<head>
	<title>Home</title>
<script src="${ctx}/timeline_source_v2.3.0/timeline_2.3.0/src/webapp/api/timeline-api.js" type="text/javascript"></script>
<script>
        
        var tl;
		var centerYear = 1000;
		var expandValue = 70;
        function simpleOnLoad() {
            var eventSource = new Timeline.DefaultEventSource(0); //getEventSource
            
            var theme = Timeline.ClassicTheme.create();
            theme.event.bubble.width = 320;
            theme.event.bubble.height = 220;
            var d = Timeline.DateTime.parseGregorianDateTime(centerYear)
            var bandInfos = [
                Timeline.createBandInfo({
                    width:          "100%", 
                    intervalUnit:   Timeline.DateTime.DECADE,//CENTURY 
                    intervalPixels: 200,
                    eventSource:    eventSource,
                    date:           d,
                    theme:          theme
                })
            ];
            
            tl = Timeline.create(document.getElementById("tl"), bandInfos, Timeline.HORIZONTAL);
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

        function onYearSelection(){
       		var yearSelection = document.getElementById('yearSelection').value;
       		centerYear = yearSelection;
       		var expand = document.getElementsByName('expand');
       		
       		for(var i = 0 ; i < expand.length; i++){
       			if(expand[i].checked == true){
       				expandValue = expand[i].value;
       			}
       		}
       		
        	if(yearSelection == 2000){
        		alert('최대 선택은 1900년 까지 입니다!');
        		return false;
        	}
        	alert('on form submit' + yearSelection+' , expand : '+expandValue);
        	simpleOnLoad();
        }
        
        function checkDiv(){
        	alert('checkDiv');
        }
        
        
    </script>
    </head>
<body onload="simpleOnLoad();" onresize="onResize();">
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<%-- <form action="${ctx }/timestamp.do" method="get" onsubmit="return onYearSelection();"> --%>
<form action="" method="get" >
	<select id = "yearSelection" onchange="onYearSelection()">
		<option value = "000" >0 year</option>
		<option value = "100" >100 year</option>
		<option value = "200" >200 year</option>
		<option value = "300" >300 year</option>
		<option value = "400" >400 year</option>
		<option value = "500" >500 year</option>
		<option value = "600" >600 year</option>
		<option value = "700" >700 year</option>
		<option value = "800" >800 year</option>
		<option value = "900" >900 year</option>
		<option value = "1000"  selected="selected">1000 year</option>
		<option value = "1100" >1100 year</option>
		<option value = "1200" >1200 year</option>
		<option value = "1300" >1300 year</option>
		<option value = "1400" >1400 year</option>
		<option value = "1500" >1500 year</option>
		<option value = "1600" >1600 year</option>		
		<option value = "1700" >1700 year</option>
		<option value = "1800" >1800 year</option>
		<option value = "1900" >1900 year</option>
	</select>

	<input  type ="radio" name ="expand" value="100" onchange="onYearSelection()"> 100%
	<input  type ="radio" name ="expand" value="90" onchange="onYearSelection()"> 90%
	<input  type ="radio" name ="expand" value="80"  onchange="onYearSelection()"> 80%
	<input  type ="radio" name ="expand" value="70" checked="checked" onchange="onYearSelection()"> 70%
	
</form>

<div id="tl" style="height:600px; border : 1px; solid #aaa" ondblclick="checkDiv()" onscroll="checkDiv()"></div>
</body>
</html>
