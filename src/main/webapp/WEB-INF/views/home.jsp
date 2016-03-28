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
        /* var tl;
        function onLoad() {
            var eventSource = new Timeline.DefaultEventSource();
            
            var zones = [
                {   start:    "Fri Nov 22 1963 00:00:00 GMT-0600",
                    end:      "Mon Nov 25 1963 00:00:00 GMT-0600",
                    magnify:  10,
                    unit:     Timeline.DateTime.DAY
                },
                {   start:    "Fri Nov 22 1963 09:00:00 GMT-0600",
                    end:      "Sun Nov 24 1963 00:00:00 GMT-0600",
                    magnify:  5,
                    unit:     Timeline.DateTime.HOUR
                },
                {   start:    "Fri Nov 22 1963 11:00:00 GMT-0600",
                    end:      "Sat Nov 23 1963 00:00:00 GMT-0600",
                    magnify:  5,
                    unit:     Timeline.DateTime.MINUTE,
                    multiple: 10
                },
                {   start:    "Fri Nov 22 1963 12:00:00 GMT-0600",
                    end:      "Fri Nov 22 1963 14:00:00 GMT-0600",
                    magnify:  3,
                    unit:     Timeline.DateTime.MINUTE,
                    multiple: 5
                }
            ];
            var zones2 = [
                {   start:    "Fri Nov 22 1963 00:00:00 GMT-0600",
                    end:      "Mon Nov 25 1963 00:00:00 GMT-0600",
                    magnify:  10,
                    unit:     Timeline.DateTime.WEEK
                },
                {   start:    "Fri Nov 22 1963 09:00:00 GMT-0600",
                    end:      "Sun Nov 24 1963 00:00:00 GMT-0600",
                    magnify:  5,
                    unit:     Timeline.DateTime.DAY
                },
                {   start:    "Fri Nov 22 1963 11:00:00 GMT-0600",
                    end:      "Sat Nov 23 1963 00:00:00 GMT-0600",
                    magnify:  5,
                    unit:     Timeline.DateTime.MINUTE,
                    multiple: 60
                },
                {   start:    "Fri Nov 22 1963 12:00:00 GMT-0600",
                    end:      "Fri Nov 22 1963 14:00:00 GMT-0600",
                    magnify:  3,
                    unit:     Timeline.DateTime.MINUTE,
                    multiple: 15
                }
            ];
            
			
			
            var theme = Timeline.ClassicTheme.create();
			Timeline.ThemeName = 'dark-theme'
			
            theme.event.bubble.width = 250;
            
            var date = "Fri Nov 22 1963 13:00:00 GMT-0600"
            var bandInfos = [
                Timeline.createHotZoneBandInfo({
                    width:          "80%", 
                    intervalUnit:   Timeline.DateTime.WEEK, 
                    intervalPixels: 200,
                    zones:          zones,
                    eventSource:    eventSource,
                    date:           date,
                    timeZone:       -6
                  //  theme:          theme
                }),
                Timeline.createHotZoneBandInfo({
                    width:          "20%", 
                    intervalUnit:   Timeline.DateTime.MONTH, 
                    intervalPixels: 200,
                    zones:          zones2, 
                    eventSource:    eventSource,
                    date:           date, 
                    timeZone:       -6,
                    overview:       true
                   // theme:          theme
                })
            ];
            bandInfos[1].syncWith = 0;
            bandInfos[1].highlight = true;
            
            for (var i = 0; i < bandInfos.length; i++) {
                bandInfos[i].decorators = [
                    new Timeline.SpanHighlightDecorator({
                        startDate:  "Fri Nov 22 1963 12:30:00 GMT-0600",
                        endDate:    "Fri Nov 22 1963 13:00:00 GMT-0600",
                        color:      "#FFC080",
                        opacity:    50,
                        startLabel: "shot",
                        endLabel:   "t.o.d.",
                       // theme:      theme,
						cssClass: 't-highlight1'
                    }),
                    new Timeline.PointHighlightDecorator({
                        date:       "Fri Nov 22 1963 14:38:00 GMT-0600",
                        color:      "#FFC080",
                        opacity:    50,
                        //theme:      theme,
						cssClass: 'p-highlight1'
                    }),
                    new Timeline.PointHighlightDecorator({
                        date:       "Sun Nov 24 1963 13:00:00 GMT-0600",
                        color:      "#FFC080",
                        opacity:    50
                        //theme:      theme
                    })
                ];
            }
            
            tl = Timeline.create(document.getElementById("tl"), bandInfos, Timeline.HORIZONTAL);
            tl.loadXML("examples/jfk/jfk.xml", function(xml, url) { eventSource.loadXML(xml, url); });
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
		
		
		function themeSwitch(){
			var timeline = document.getElementById('tl');		
			timeline.className = (timeline.className.indexOf('dark-theme') != -1) ? timeline.className.replace('dark-theme', '') : timeline.className += ' dark-theme';
			
		} */
		var simpleTl;		
		function simpleOnLoad(){
			var eventSource = new Timeline.DefaultEventSource();
			var bandInfos = [
			                 Timeline.createBandInfo({
			                     width:          "70%", 
			                     intervalUnit:   Timeline.DateTime.MONTH, 
			                     intervalPixels: 20,
			                     date : "Jun 28 2015 00:00:00 GMT+0900",
			                     eventSource : eventSource
			                 }),
			                 Timeline.createBandInfo({
			                	 overview:       true,
			                     width:          "30%", 
			                     intervalUnit:   Timeline.DateTime.YEAR, 
			                     intervalPixels: 5,
			                     date : "Jun 28 2015 00:00:00 GMT+0900",
			                     eventSource : eventSource
			                 })
			               ];
			bandInfos[1].syncWith = 0;
			bandInfos[1].highlight = true;
			simpleTl = Timeline.create(document.getElementById("my-timeline"), bandInfos);
			Timeline.loadXML("timeline_source_v2.3.0/timeline_2.3.0/data/example1.xml",function(xml, url ){
				eventSource.loadXML(xml,url);
			});
			               
              var simpleResizeTimerID = null;
              function onResize() {
                  if (simpleResizeTimerID == null) {
                	  simpleResizeTimerID = window.setTimeout(function() {
                		  simpleResizeTimerID = null;
                          simpleTl.layout();
                      }, 500);
                  }
              }


		}
    </script>
    </head>
<body onload="simpleOnLoad();" >
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p> jsp 오랜만이군요</p>


<div id="my-timeline" style="height:500px; border : 1px; solid #aaa"></div>
</body>
</html>
