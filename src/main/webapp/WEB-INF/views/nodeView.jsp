<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<c:set var = "pageId" value = "<%=session.getAttribute(\"pageId\")%>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, minimal-ui">

<title>한국사 위키백과 데이터마이닝</title>
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">-->
  <link href="${ctx }/cytoscape/style.css" rel="stylesheet">
</head>
<body>
  <div id="cy"></div>
  <div id="loading">
    <span class="fa fa-refresh fa-spin"></span>
  </div>
  
  <div id="search-wrapper">
    <input type="text" class="form-control" id="search" autofocus placeholder="Search">
  </div>
  
  <div id="info">
  </div>

  <script src="http://cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.3/fastclick.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  
  <script src="http://cytoscape.github.io/cytoscape.js/api/cytoscape.js-latest/cytoscape.min.js"></script>
  <!--<script src="../cytoscape.js/build/cytoscape.js"></script>-->
  
  <script src="http://cdnjs.cloudflare.com/ajax/libs/qtip2/2.2.0/jquery.qtip.min.js"></script>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/qtip2/2.2.0/jquery.qtip.min.css" rel="stylesheet" type="text/css" />
  <script src="https://cdn.rawgit.com/cytoscape/cytoscape.js-qtip/2.2.3/cytoscape-qtip.js"></script>
  
  <script src="http://cdnjs.cloudflare.com/ajax/libs/bluebird/1.2.2/bluebird.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.js"></script>
  <!--<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.2/handlebars.min.js"></script>-->
  <script src="${ctx }/cytoscape/handlebars.min.js"></script>
  
  
<%--   <script src="${ctx }/cytoscape/data.js"></script>			<!-- 이게 dataSource이다. --> --%>
  <script type="text/javascript">
  	var page = ${pageId}
  	//alert('nodeview : '+page);

$(function(){

  var layoutPadding = 50;
  var layoutDuration = 500;

    // get exported json from cytoscape desktop via ajax
  /*
  var graphP = $.ajax({
    url: 'https://cdn.rawgit.com/maxkfranz/3d4d3c8eb808bd95bae7/raw', // wine-and-cheese.json
    type: 'GET',
    dataType: 'json'
  });
  */
  /*
    // var graphP = $.getJSON('https://cdn.rawgit.com/maxkfranz/3d4d3c8eb808bd95bae7/raw'); 
  var graphP = { "elements": { "nodes": [{ "position": { "x": 0, "y": 0 }, "data": { "depth": "0", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 100.0, "y": 0.0 }, "data": { "depth": "1", "selected": false, "id": "320261", "name": "\uc784\uc9c4\uc65c\ub780_\uc804\ud22c_\ubaa9\ub85d", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 80.90169943749474, "y": 58.778525229247315 }, "data": { "depth": "1", "selected": false, "id": "10037", "name": "\ubcd1\uc790\ud638\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 30.901699437494745, "y": 95.10565162951535 }, "data": { "depth": "1", "selected": false, "id": "106408", "name": "\uc815\ubb18\ud638\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -30.901699437494734, "y": 95.10565162951536 }, "data": { "depth": "1", "selected": false, "id": "67129", "name": "\uacfd\uc7ac\uc6b0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -80.90169943749473, "y": 58.77852522924732 }, "data": { "depth": "1", "selected": false, "id": "265363", "name": "\uae40\ucc9c\uc77c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -100.0, "y": 1.2246467991473532e-14 }, "data": { "depth": "1", "selected": false, "id": "263235", "name": "\uace0\uacbd\uba85", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -80.90169943749474, "y": -58.7785252292473 }, "data": { "depth": "1", "selected": false, "id": "44088", "name": "\uad8c\uc728", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -30.901699437494756, "y": -95.10565162951535 }, "data": { "depth": "1", "selected": false, "id": "74496", "name": "\uc774\uc5ec\uc1a1", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 30.901699437494724, "y": -95.10565162951536 }, "data": { "depth": "1", "selected": false, "id": "222679", "name": "\uc744\ubb18\uc65c\ubcc0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 80.90169943749473, "y": -58.778525229247336 }, "data": { "depth": "1", "selected": false, "id": "266553", "name": "\ucd5c\uacbd\ud68c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 1000.0, "y": 0.0 }, "data": { "depth": "2", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 998.0267284282716, "y": 62.79051952931337 }, "data": { "depth": "2", "selected": false, "id": "41274", "name": "\ud55c\uc0b0\ub3c4_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 992.1147013144779, "y": 125.33323356430427 }, "data": { "depth": "2", "selected": false, "id": "322655", "name": "\uc6c5\uce58_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 982.2872507286887, "y": 187.38131458572462 }, "data": { "depth": "2", "selected": false, "id": "241951", "name": "\uc65c\uad50\uc131_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 968.5831611286311, "y": 248.68988716485478 }, "data": { "depth": "2", "selected": false, "id": "336995", "name": "\ub3c5\uc131\uc0b0\uc131_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 951.0565162951535, "y": 309.0169943749474 }, "data": { "depth": "2", "selected": false, "id": "316118", "name": "\ubd80\uc0b0\uc9c4_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 929.7764858882515, "y": 368.12455268467795 }, "data": { "depth": "2", "selected": false, "id": "323500", "name": "\ub0a8\uc6d0_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 904.8270524660195, "y": 425.7792915650727 }, "data": { "depth": "2", "selected": false, "id": "337465", "name": "\uc601\uc6d0\uc0b0\uc131_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 876.3066800438636, "y": 481.7536741017153 }, "data": { "depth": "2", "selected": false, "id": "332738", "name": "\ud3c9\uc591_\uc804\ud22c_(1592\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 844.3279255020151, "y": 535.8267949789966 }, "data": { "depth": "2", "selected": false, "id": "334187", "name": "\uccad\uc8fc_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 809.0169943749474, "y": 587.7852522924732 }, "data": { "depth": "2", "selected": false, "id": "106408", "name": "\uc815\ubb18\ud638\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 770.5132427757893, "y": 637.4239897486897 }, "data": { "depth": "2", "selected": false, "id": "723956", "name": "\uc815\ucd95\ud558\uc131", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 728.9686274214115, "y": 684.5471059286887 }, "data": { "depth": "2", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 684.5471059286887, "y": 728.9686274214115 }, "data": { "depth": "2", "selected": false, "id": "69299", "name": "\uc778\uc870\ubc18\uc815", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 637.4239897486898, "y": 770.5132427757893 }, "data": { "depth": "2", "selected": false, "id": "261151", "name": "\uae40\uc790\uc810", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 587.7852522924732, "y": 809.0169943749474 }, "data": { "depth": "2", "selected": false, "id": "73063", "name": "\uc18c\ud604\uc138\uc790", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 535.8267949789965, "y": 844.3279255020151 }, "data": { "depth": "2", "selected": false, "id": "11026", "name": "\uc870\uc120_\ud6a8\uc885", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 481.75367410171515, "y": 876.3066800438637 }, "data": { "depth": "2", "selected": false, "id": "199826", "name": "\ud638\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 425.77929156507264, "y": 904.8270524660196 }, "data": { "depth": "2", "selected": false, "id": "137480", "name": "\uc2ec\uae30\uc6d0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 368.12455268467806, "y": 929.7764858882514 }, "data": { "depth": "2", "selected": false, "id": "182515", "name": "\uae40\uc0c1\ud5cc", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 309.01699437494744, "y": 951.0565162951535 }, "data": { "depth": "2", "selected": false, "id": "10037", "name": "\ubcd1\uc790\ud638\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 248.68988716485475, "y": 968.5831611286311 }, "data": { "depth": "2", "selected": false, "id": "723956", "name": "\uc815\ucd95\ud558\uc131", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 187.38131458572474, "y": 982.2872507286886 }, "data": { "depth": "2", "selected": false, "id": "69299", "name": "\uc778\uc870\ubc18\uc815", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 125.33323356430427, "y": 992.1147013144779 }, "data": { "depth": "2", "selected": false, "id": "261151", "name": "\uae40\uc790\uc810", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 62.79051952931353, "y": 998.0267284282716 }, "data": { "depth": "2", "selected": false, "id": "260766", "name": "\uac15\ud64d\ub9bd", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 6.123233995736766e-14, "y": 1000.0 }, "data": { "depth": "2", "selected": false, "id": "73063", "name": "\uc18c\ud604\uc138\uc790", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -62.7905195293134, "y": 998.0267284282716 }, "data": { "depth": "2", "selected": false, "id": "137480", "name": "\uc2ec\uae30\uc6d0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -125.33323356430436, "y": 992.1147013144778 }, "data": { "depth": "2", "selected": false, "id": "261150", "name": "\uae40\ub958_(1571\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -187.3813145857246, "y": 982.2872507286887 }, "data": { "depth": "2", "selected": false, "id": "182515", "name": "\uae40\uc0c1\ud5cc", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -248.68988716485464, "y": 968.5831611286312 }, "data": { "depth": "2", "selected": false, "id": "729478", "name": "\uc548\ubc29\uc900_(1573\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -309.01699437494733, "y": 951.0565162951536 }, "data": { "depth": "2", "selected": false, "id": "143355", "name": "\uae40\ub355\ub839", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -368.12455268467795, "y": 929.7764858882515 }, "data": { "depth": "2", "selected": false, "id": "44088", "name": "\uad8c\uc728", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -425.7792915650727, "y": 904.8270524660195 }, "data": { "depth": "2", "selected": false, "id": "74488", "name": "\uae40\uc2dc\ubbfc", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -481.75367410171503, "y": 876.3066800438637 }, "data": { "depth": "2", "selected": false, "id": "247876", "name": "\uc870\ud5cc", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -535.8267949789964, "y": 844.3279255020152 }, "data": { "depth": "2", "selected": false, "id": "86918", "name": "\uc2e0\ub9bd", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -587.785252292473, "y": 809.0169943749474 }, "data": { "depth": "2", "selected": false, "id": "267390", "name": "\uc815\uc778\ud64d", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -637.4239897486898, "y": 770.5132427757893 }, "data": { "depth": "2", "selected": false, "id": "343158", "name": "\ub958\uc131\ub8e1", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -684.5471059286888, "y": 728.9686274214115 }, "data": { "depth": "2", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -728.9686274214114, "y": 684.5471059286889 }, "data": { "depth": "2", "selected": false, "id": "162757", "name": "\uc774\uc0b0\ud574", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -770.5132427757892, "y": 637.4239897486899 }, "data": { "depth": "2", "selected": false, "id": "265278", "name": "\uc774\uc218\uad11", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -809.0169943749473, "y": 587.7852522924733 }, "data": { "depth": "2", "selected": false, "id": "266553", "name": "\ucd5c\uacbd\ud68c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -844.3279255020151, "y": 535.8267949789966 }, "data": { "depth": "2", "selected": false, "id": "263235", "name": "\uace0\uacbd\uba85", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -876.3066800438636, "y": 481.7536741017152 }, "data": { "depth": "2", "selected": false, "id": "67129", "name": "\uacfd\uc7ac\uc6b0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -904.8270524660194, "y": 425.77929156507287 }, "data": { "depth": "2", "selected": false, "id": "263237", "name": "\uace0\uc885\ud6c4", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -929.7764858882514, "y": 368.1245526846781 }, "data": { "depth": "2", "selected": false, "id": "247876", "name": "\uc870\ud5cc", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -951.0565162951535, "y": 309.0169943749475 }, "data": { "depth": "2", "selected": false, "id": "143355", "name": "\uae40\ub355\ub839", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -968.5831611286311, "y": 248.6898871648548 }, "data": { "depth": "2", "selected": false, "id": "44088", "name": "\uad8c\uc728", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -982.2872507286887, "y": 187.38131458572457 }, "data": { "depth": "2", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -992.1147013144778, "y": 125.33323356430454 }, "data": { "depth": "2", "selected": false, "id": "86918", "name": "\uc2e0\ub9bd", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -998.0267284282716, "y": 62.790519529313585 }, "data": { "depth": "2", "selected": false, "id": "69113", "name": "\uc774\uacbd\ub85d_(1543\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -1000.0, "y": 1.2246467991473532e-13 }, "data": { "depth": "2", "selected": false, "id": "247876", "name": "\uc870\ud5cc", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -998.0267284282716, "y": -62.79051952931334 }, "data": { "depth": "2", "selected": false, "id": "265363", "name": "\uae40\ucc9c\uc77c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -992.1147013144779, "y": -125.33323356430428 }, "data": { "depth": "2", "selected": false, "id": "266553", "name": "\ucd5c\uacbd\ud68c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -982.2872507286887, "y": -187.3813145857243 }, "data": { "depth": "2", "selected": false, "id": "67129", "name": "\uacfd\uc7ac\uc6b0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -968.5831611286312, "y": -248.68988716485458 }, "data": { "depth": "2", "selected": false, "id": "620839", "name": "\uc774\uacbd\uc720", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -951.0565162951536, "y": -309.0169943749473 }, "data": { "depth": "2", "selected": false, "id": "143355", "name": "\uae40\ub355\ub839", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -929.7764858882515, "y": -368.1245526846779 }, "data": { "depth": "2", "selected": false, "id": "263237", "name": "\uace0\uc885\ud6c4", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -904.8270524660195, "y": -425.77929156507264 }, "data": { "depth": "2", "selected": false, "id": "86918", "name": "\uc2e0\ub9bd", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -876.3066800438637, "y": -481.753674101715 }, "data": { "depth": "2", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -844.3279255020152, "y": -535.8267949789964 }, "data": { "depth": "2", "selected": false, "id": "64562", "name": "\uc815\ucca0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -809.0169943749474, "y": -587.785252292473 }, "data": { "depth": "2", "selected": false, "id": "225426", "name": "\ud589\uc8fc\ub300\ucca9", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -770.5132427757893, "y": -637.4239897486897 }, "data": { "depth": "2", "selected": false, "id": "265343", "name": "\uae40\uba85\uc6d0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -728.9686274214115, "y": -684.5471059286888 }, "data": { "depth": "2", "selected": false, "id": "67129", "name": "\uacfd\uc7ac\uc6b0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -684.5471059286889, "y": -728.9686274214114 }, "data": { "depth": "2", "selected": false, "id": "242350", "name": "\uc6d0\uade0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -637.4239897486896, "y": -770.5132427757893 }, "data": { "depth": "2", "selected": false, "id": "86918", "name": "\uc2e0\ub9bd", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -587.7852522924733, "y": -809.0169943749473 }, "data": { "depth": "2", "selected": false, "id": "74413", "name": "\uc774\ud56d\ubcf5", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -535.8267949789971, "y": -844.3279255020148 }, "data": { "depth": "2", "selected": false, "id": "331865", "name": "\uae40\uc751\uc11c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -481.75367410171526, "y": -876.3066800438636 }, "data": { "depth": "2", "selected": false, "id": "247876", "name": "\uc870\ud5cc", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -425.7792915650729, "y": -904.8270524660194 }, "data": { "depth": "2", "selected": false, "id": "210860", "name": "\uc774\uc21c\uc2e0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -368.1245526846778, "y": -929.7764858882515 }, "data": { "depth": "2", "selected": false, "id": "336995", "name": "\ub3c5\uc131\uc0b0\uc131_\uc804\ud22c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -309.01699437494756, "y": -951.0565162951535 }, "data": { "depth": "2", "selected": false, "id": "331865", "name": "\uae40\uc751\uc11c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -248.6898871648553, "y": -968.583161128631 }, "data": { "depth": "2", "selected": false, "id": "265343", "name": "\uae40\uba85\uc6d0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -187.38131458572462, "y": -982.2872507286887 }, "data": { "depth": "2", "selected": false, "id": "265363", "name": "\uae40\ucc9c\uc77c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -125.33323356430459, "y": -992.1147013144778 }, "data": { "depth": "2", "selected": false, "id": "65768", "name": "\ud55c\ud638", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -62.79051952931321, "y": -998.0267284282716 }, "data": { "depth": "2", "selected": false, "id": "274699", "name": "\uc774\uc131\ub7c9", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": -1.8369701987210297e-13, "y": -1000.0 }, "data": { "depth": "2", "selected": false, "id": "343158", "name": "\ub958\uc131\ub8e1", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 62.79051952931283, "y": -998.0267284282716 }, "data": { "depth": "2", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 125.33323356430424, "y": -992.1147013144779 }, "data": { "depth": "2", "selected": false, "id": "74437", "name": "\uc774\ub355\ud615_(1561\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 187.38131458572425, "y": -982.2872507286887 }, "data": { "depth": "2", "selected": false, "id": "332738", "name": "\ud3c9\uc591_\uc804\ud22c_(1592\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 248.68988716485492, "y": -968.5831611286311 }, "data": { "depth": "2", "selected": false, "id": "367568", "name": "\ucc9c\ub9cc\ub9ac", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 309.0169943749472, "y": -951.0565162951536 }, "data": { "depth": "2", "selected": false, "id": "136874", "name": "\uae30\ubb18\uc0ac\ud654", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 368.12455268467744, "y": -929.7764858882516 }, "data": { "depth": "2", "selected": false, "id": "489524", "name": "\uc0bc\ud3ec_\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 425.7792915650726, "y": -904.8270524660196 }, "data": { "depth": "2", "selected": false, "id": "291127", "name": "\uc774\uc900\uacbd", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 481.7536741017149, "y": -876.3066800438638 }, "data": { "depth": "2", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 535.8267949789968, "y": -844.327925502015 }, "data": { "depth": "2", "selected": false, "id": "155217", "name": "\ucd5c\uba85\uae38_(1586\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 587.7852522924729, "y": -809.0169943749476 }, "data": { "depth": "2", "selected": false, "id": "106882", "name": "\ub300\ub9c8\ub3c4_\uc815\ubc8c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 637.4239897486893, "y": -770.5132427757895 }, "data": { "depth": "2", "selected": false, "id": "329800", "name": "\uc2ec\uc5f0\uc6d0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 684.5471059286887, "y": -728.9686274214115 }, "data": { "depth": "2", "selected": false, "id": "6547", "name": "\uc870\uc120_\uba85\uc885", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 728.9686274214113, "y": -684.5471059286889 }, "data": { "depth": "2", "selected": false, "id": "48898", "name": "\uc6b4\uc694\ud638_\uc0ac\uac74", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 770.5132427757893, "y": -637.4239897486897 }, "data": { "depth": "2", "selected": false, "id": "153786", "name": "\uc774\uad11\uc2dd_(1493\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 809.0169943749473, "y": -587.7852522924734 }, "data": { "depth": "2", "selected": false, "id": "265363", "name": "\uae40\ucc9c\uc77c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 844.3279255020148, "y": -535.8267949789971 }, "data": { "depth": "2", "selected": false, "id": "263235", "name": "\uace0\uacbd\uba85", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 876.3066800438636, "y": -481.7536741017153 }, "data": { "depth": "2", "selected": false, "id": "67129", "name": "\uacfd\uc7ac\uc6b0", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 904.8270524660194, "y": -425.779291565073 }, "data": { "depth": "2", "selected": false, "id": "263237", "name": "\uace0\uc885\ud6c4", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 929.7764858882515, "y": -368.12455268467784 }, "data": { "depth": "2", "selected": false, "id": "259349", "name": "\ub17c\uac1c", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 951.0565162951535, "y": -309.01699437494767 }, "data": { "depth": "2", "selected": false, "id": "143355", "name": "\uae40\ub355\ub839", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 968.583161128631, "y": -248.68988716485535 }, "data": { "depth": "2", "selected": false, "id": "74067", "name": "\uc784\uc9c4\uc65c\ub780", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 982.2872507286887, "y": -187.38131458572468 }, "data": { "depth": "2", "selected": false, "id": "365430", "name": "\uc591\uc0b0\uc219", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 992.1147013144778, "y": -125.33323356430465 }, "data": { "depth": "2", "selected": false, "id": "296196", "name": "\ud669\uc9c4_(1550\ub144)", "nodeType": "\uc778\ubb3c" } }, { "position": { "x": 998.0267284282716, "y": -62.790519529313265 }, "data": { "depth": "2", "selected": false, "id": "86918", "name": "\uc2e0\ub9bd", "nodeType": "\uc778\ubb3c" } }], "edges": [{ "data": { "id": "74067-320261", "interaction": "cw", "ranking": 1, "source": "74067", "width": 26, "target": "320261", "selected": false, "similarity": 0.6256437368297176 } }, { "data": { "id": "74067-10037", "interaction": "cw", "ranking": 2, "source": "74067", "width": 21, "target": "10037", "selected": false, "similarity": 0.5124704524916142 } }, { "data": { "id": "74067-106408", "interaction": "cw", "ranking": 3, "source": "74067", "width": 18, "target": "106408", "selected": false, "similarity": 0.43660440213776974 } }, { "data": { "id": "74067-67129", "interaction": "cw", "ranking": 4, "source": "74067", "width": 17, "target": "67129", "selected": false, "similarity": 0.40710336314875745 } }, { "data": { "id": "74067-265363", "interaction": "cw", "ranking": 5, "source": "74067", "width": 16, "target": "265363", "selected": false, "similarity": 0.39738273189114076 } }, { "data": { "id": "74067-263235", "interaction": "cw", "ranking": 6, "source": "74067", "width": 16, "target": "263235", "selected": false, "similarity": 0.3935071537187138 } }, { "data": { "id": "74067-44088", "interaction": "cw", "ranking": 7, "source": "74067", "width": 16, "target": "44088", "selected": false, "similarity": 0.38717340092280694 } }, { "data": { "id": "74067-74496", "interaction": "cw", "ranking": 8, "source": "74067", "width": 15, "target": "74496", "selected": false, "similarity": 0.3664017301254043 } }, { "data": { "id": "74067-222679", "interaction": "cw", "ranking": 9, "source": "74067", "width": 15, "target": "222679", "selected": false, "similarity": 0.3654016726773764 } }, { "data": { "id": "74067-266553", "interaction": "cw", "ranking": 10, "source": "74067", "width": 15, "target": "266553", "selected": false, "similarity": 0.36336287938169 } }, { "data": { "id": "320261-74067", "interaction": "cw", "ranking": 1, "source": "320261", "width": 26, "target": "74067", "selected": false, "similarity": 0.6256437368297176 } }, { "data": { "id": "320261-41274", "interaction": "cw", "ranking": 2, "source": "320261", "width": 24, "target": "41274", "selected": false, "similarity": 0.5995657835308381 } }, { "data": { "id": "320261-322655", "interaction": "cw", "ranking": 3, "source": "320261", "width": 24, "target": "322655", "selected": false, "similarity": 0.5890898730539709 } }, { "data": { "id": "320261-241951", "interaction": "cw", "ranking": 4, "source": "320261", "width": 24, "target": "241951", "selected": false, "similarity": 0.5757273053998367 } }, { "data": { "id": "320261-336995", "interaction": "cw", "ranking": 5, "source": "320261", "width": 23, "target": "336995", "selected": false, "similarity": 0.5573615813478842 } }, { "data": { "id": "320261-316118", "interaction": "cw", "ranking": 6, "source": "320261", "width": 23, "target": "316118", "selected": false, "similarity": 0.5511053324142657 } }, { "data": { "id": "320261-323500", "interaction": "cw", "ranking": 7, "source": "320261", "width": 22, "target": "323500", "selected": false, "similarity": 0.5484899636024518 } }, { "data": { "id": "320261-337465", "interaction": "cw", "ranking": 8, "source": "320261", "width": 22, "target": "337465", "selected": false, "similarity": 0.5381956351553322 } }, { "data": { "id": "320261-332738", "interaction": "cw", "ranking": 9, "source": "320261", "width": 21, "target": "332738", "selected": false, "similarity": 0.5048924384372141 } }, { "data": { "id": "320261-334187", "interaction": "cw", "ranking": 10, "source": "320261", "width": 21, "target": "334187", "selected": false, "similarity": 0.5040223862315348 } }, { "data": { "id": "10037-106408", "interaction": "cw", "ranking": 1, "source": "10037", "width": 27, "target": "106408", "selected": false, "similarity": 0.6735687174645834 } }, { "data": { "id": "10037-723956", "interaction": "cw", "ranking": 2, "source": "10037", "width": 21, "target": "723956", "selected": false, "similarity": 0.5219677906319816 } }, { "data": { "id": "10037-74067", "interaction": "cw", "ranking": 3, "source": "10037", "width": 21, "target": "74067", "selected": false, "similarity": 0.5124704524916142 } }, { "data": { "id": "10037-69299", "interaction": "cw", "ranking": 4, "source": "10037", "width": 18, "target": "69299", "selected": false, "similarity": 0.43763280275148725 } }, { "data": { "id": "10037-261151", "interaction": "cw", "ranking": 5, "source": "10037", "width": 16, "target": "261151", "selected": false, "similarity": 0.39883361881051216 } }, { "data": { "id": "10037-73063", "interaction": "cw", "ranking": 6, "source": "10037", "width": 15, "target": "73063", "selected": false, "similarity": 0.36919919316233707 } }, { "data": { "id": "10037-11026", "interaction": "cw", "ranking": 7, "source": "10037", "width": 15, "target": "11026", "selected": false, "similarity": 0.36736426505173475 } }, { "data": { "id": "10037-199826", "interaction": "cw", "ranking": 8, "source": "10037", "width": 15, "target": "199826", "selected": false, "similarity": 0.36041415395806337 } }, { "data": { "id": "10037-137480", "interaction": "cw", "ranking": 9, "source": "10037", "width": 15, "target": "137480", "selected": false, "similarity": 0.355263892242622 } }, { "data": { "id": "10037-182515", "interaction": "cw", "ranking": 10, "source": "10037", "width": 15, "target": "182515", "selected": false, "similarity": 0.3521818029295821 } }, { "data": { "id": "106408-10037", "interaction": "cw", "ranking": 1, "source": "106408", "width": 27, "target": "10037", "selected": false, "similarity": 0.6735687174645834 } }, { "data": { "id": "106408-723956", "interaction": "cw", "ranking": 2, "source": "106408", "width": 24, "target": "723956", "selected": false, "similarity": 0.5870638649910996 } }, { "data": { "id": "106408-69299", "interaction": "cw", "ranking": 3, "source": "106408", "width": 21, "target": "69299", "selected": false, "similarity": 0.500531687199693 } }, { "data": { "id": "106408-261151", "interaction": "cw", "ranking": 4, "source": "106408", "width": 19, "target": "261151", "selected": false, "similarity": 0.4644933999098433 } }, { "data": { "id": "106408-260766", "interaction": "cw", "ranking": 5, "source": "106408", "width": 17, "target": "260766", "selected": false, "similarity": 0.4145183779318192 } }, { "data": { "id": "106408-73063", "interaction": "cw", "ranking": 6, "source": "106408", "width": 16, "target": "73063", "selected": false, "similarity": 0.3837834835810936 } }, { "data": { "id": "106408-137480", "interaction": "cw", "ranking": 7, "source": "106408", "width": 16, "target": "137480", "selected": false, "similarity": 0.38157609267455844 } }, { "data": { "id": "106408-261150", "interaction": "cw", "ranking": 8, "source": "106408", "width": 16, "target": "261150", "selected": false, "similarity": 0.3809838889046266 } }, { "data": { "id": "106408-182515", "interaction": "cw", "ranking": 9, "source": "106408", "width": 16, "target": "182515", "selected": false, "similarity": 0.3796511200252686 } }, { "data": { "id": "106408-729478", "interaction": "cw", "ranking": 10, "source": "106408", "width": 16, "target": "729478", "selected": false, "similarity": 0.37782270729983974 } }, { "data": { "id": "67129-143355", "interaction": "cw", "ranking": 1, "source": "67129", "width": 22, "target": "143355", "selected": false, "similarity": 0.5431458153079723 } }, { "data": { "id": "67129-44088", "interaction": "cw", "ranking": 2, "source": "67129", "width": 20, "target": "44088", "selected": false, "similarity": 0.48161257309213135 } }, { "data": { "id": "67129-74488", "interaction": "cw", "ranking": 3, "source": "67129", "width": 19, "target": "74488", "selected": false, "similarity": 0.456330188228188 } }, { "data": { "id": "67129-247876", "interaction": "cw", "ranking": 4, "source": "67129", "width": 18, "target": "247876", "selected": false, "similarity": 0.4337626303330896 } }, { "data": { "id": "67129-86918", "interaction": "cw", "ranking": 5, "source": "67129", "width": 17, "target": "86918", "selected": false, "similarity": 0.41845146205065775 } }, { "data": { "id": "67129-267390", "interaction": "cw", "ranking": 6, "source": "67129", "width": 17, "target": "267390", "selected": false, "similarity": 0.4109278599498673 } }, { "data": { "id": "67129-343158", "interaction": "cw", "ranking": 7, "source": "67129", "width": 17, "target": "343158", "selected": false, "similarity": 0.40937371040542647 } }, { "data": { "id": "67129-74067", "interaction": "cw", "ranking": 8, "source": "67129", "width": 17, "target": "74067", "selected": false, "similarity": 0.40710336314875745 } }, { "data": { "id": "67129-162757", "interaction": "cw", "ranking": 9, "source": "67129", "width": 15, "target": "162757", "selected": false, "similarity": 0.3673258971048783 } }, { "data": { "id": "67129-265278", "interaction": "cw", "ranking": 10, "source": "67129", "width": 15, "target": "265278", "selected": false, "similarity": 0.35574445910704944 } }, { "data": { "id": "265363-266553", "interaction": "cw", "ranking": 1, "source": "265363", "width": 24, "target": "266553", "selected": false, "similarity": 0.5823504905295456 } }, { "data": { "id": "265363-263235", "interaction": "cw", "ranking": 2, "source": "265363", "width": 22, "target": "263235", "selected": false, "similarity": 0.5381610110431443 } }, { "data": { "id": "265363-67129", "interaction": "cw", "ranking": 3, "source": "265363", "width": 22, "target": "67129", "selected": false, "similarity": 0.5346299094065493 } }, { "data": { "id": "265363-263237", "interaction": "cw", "ranking": 4, "source": "265363", "width": 18, "target": "263237", "selected": false, "similarity": 0.449461372971816 } }, { "data": { "id": "265363-247876", "interaction": "cw", "ranking": 5, "source": "265363", "width": 18, "target": "247876", "selected": false, "similarity": 0.44042595321939126 } }, { "data": { "id": "265363-143355", "interaction": "cw", "ranking": 6, "source": "265363", "width": 18, "target": "143355", "selected": false, "similarity": 0.44030863471961135 } }, { "data": { "id": "265363-44088", "interaction": "cw", "ranking": 7, "source": "265363", "width": 18, "target": "44088", "selected": false, "similarity": 0.42675115197383917 } }, { "data": { "id": "265363-74067", "interaction": "cw", "ranking": 8, "source": "265363", "width": 16, "target": "74067", "selected": false, "similarity": 0.39738273189114076 } }, { "data": { "id": "265363-86918", "interaction": "cw", "ranking": 9, "source": "265363", "width": 16, "target": "86918", "selected": false, "similarity": 0.3924527413573117 } }, { "data": { "id": "265363-69113", "interaction": "cw", "ranking": 10, "source": "265363", "width": 16, "target": "69113", "selected": false, "similarity": 0.3764899256356549 } }, { "data": { "id": "263235-247876", "interaction": "cw", "ranking": 1, "source": "263235", "width": 23, "target": "247876", "selected": false, "similarity": 0.5601847237966607 } }, { "data": { "id": "263235-265363", "interaction": "cw", "ranking": 2, "source": "263235", "width": 22, "target": "265363", "selected": false, "similarity": 0.5381610110431443 } }, { "data": { "id": "263235-266553", "interaction": "cw", "ranking": 3, "source": "263235", "width": 22, "target": "266553", "selected": false, "similarity": 0.5260945129524652 } }, { "data": { "id": "263235-67129", "interaction": "cw", "ranking": 4, "source": "263235", "width": 21, "target": "67129", "selected": false, "similarity": 0.5197586919539979 } }, { "data": { "id": "263235-620839", "interaction": "cw", "ranking": 5, "source": "263235", "width": 19, "target": "620839", "selected": false, "similarity": 0.4641950682499303 } }, { "data": { "id": "263235-143355", "interaction": "cw", "ranking": 6, "source": "263235", "width": 19, "target": "143355", "selected": false, "similarity": 0.4596141937205078 } }, { "data": { "id": "263235-263237", "interaction": "cw", "ranking": 7, "source": "263235", "width": 19, "target": "263237", "selected": false, "similarity": 0.4531473881234634 } }, { "data": { "id": "263235-86918", "interaction": "cw", "ranking": 8, "source": "263235", "width": 17, "target": "86918", "selected": false, "similarity": 0.42289932228843874 } }, { "data": { "id": "263235-74067", "interaction": "cw", "ranking": 9, "source": "263235", "width": 16, "target": "74067", "selected": false, "similarity": 0.3935071537187138 } }, { "data": { "id": "263235-64562", "interaction": "cw", "ranking": 10, "source": "263235", "width": 16, "target": "64562", "selected": false, "similarity": 0.3772190449214935 } }, { "data": { "id": "44088-225426", "interaction": "cw", "ranking": 1, "source": "44088", "width": 21, "target": "225426", "selected": false, "similarity": 0.5230398960606524 } }, { "data": { "id": "44088-265343", "interaction": "cw", "ranking": 2, "source": "44088", "width": 21, "target": "265343", "selected": false, "similarity": 0.5124075965858058 } }, { "data": { "id": "44088-67129", "interaction": "cw", "ranking": 3, "source": "44088", "width": 20, "target": "67129", "selected": false, "similarity": 0.48161257309213135 } }, { "data": { "id": "44088-242350", "interaction": "cw", "ranking": 4, "source": "44088", "width": 19, "target": "242350", "selected": false, "similarity": 0.4682527524897865 } }, { "data": { "id": "44088-86918", "interaction": "cw", "ranking": 5, "source": "44088", "width": 19, "target": "86918", "selected": false, "similarity": 0.45399855336041683 } }, { "data": { "id": "44088-74413", "interaction": "cw", "ranking": 6, "source": "44088", "width": 18, "target": "74413", "selected": false, "similarity": 0.43493902055563693 } }, { "data": { "id": "44088-331865", "interaction": "cw", "ranking": 7, "source": "44088", "width": 17, "target": "331865", "selected": false, "similarity": 0.4239592574006253 } }, { "data": { "id": "44088-247876", "interaction": "cw", "ranking": 8, "source": "44088", "width": 16, "target": "247876", "selected": false, "similarity": 0.3999192339883423 } }, { "data": { "id": "44088-210860", "interaction": "cw", "ranking": 9, "source": "44088", "width": 16, "target": "210860", "selected": false, "similarity": 0.39682888752070916 } }, { "data": { "id": "44088-336995", "interaction": "cw", "ranking": 10, "source": "44088", "width": 16, "target": "336995", "selected": false, "similarity": 0.3948814315219964 } }, { "data": { "id": "74496-331865", "interaction": "cw", "ranking": 1, "source": "74496", "width": 19, "target": "331865", "selected": false, "similarity": 0.46497095796903715 } }, { "data": { "id": "74496-265343", "interaction": "cw", "ranking": 2, "source": "74496", "width": 18, "target": "265343", "selected": false, "similarity": 0.4354346652133872 } }, { "data": { "id": "74496-265363", "interaction": "cw", "ranking": 3, "source": "74496", "width": 18, "target": "265363", "selected": false, "similarity": 0.4351307766895531 } }, { "data": { "id": "74496-65768", "interaction": "cw", "ranking": 4, "source": "74496", "width": 16, "target": "65768", "selected": false, "similarity": 0.3842711868809286 } }, { "data": { "id": "74496-274699", "interaction": "cw", "ranking": 5, "source": "74496", "width": 15, "target": "274699", "selected": false, "similarity": 0.3714278777806336 } }, { "data": { "id": "74496-343158", "interaction": "cw", "ranking": 6, "source": "74496", "width": 15, "target": "343158", "selected": false, "similarity": 0.36758463433723 } }, { "data": { "id": "74496-74067", "interaction": "cw", "ranking": 7, "source": "74496", "width": 15, "target": "74067", "selected": false, "similarity": 0.3664017301254043 } }, { "data": { "id": "74496-74437", "interaction": "cw", "ranking": 8, "source": "74496", "width": 14, "target": "74437", "selected": false, "similarity": 0.3478219406053426 } }, { "data": { "id": "74496-332738", "interaction": "cw", "ranking": 9, "source": "74496", "width": 14, "target": "332738", "selected": false, "similarity": 0.3337155059501054 } }, { "data": { "id": "74496-367568", "interaction": "cw", "ranking": 10, "source": "74496", "width": 14, "target": "367568", "selected": false, "similarity": 0.3304784754634956 } }, { "data": { "id": "222679-136874", "interaction": "cw", "ranking": 1, "source": "222679", "width": 18, "target": "136874", "selected": false, "similarity": 0.433292701212949 } }, { "data": { "id": "222679-489524", "interaction": "cw", "ranking": 2, "source": "222679", "width": 17, "target": "489524", "selected": false, "similarity": 0.4213295880493251 } }, { "data": { "id": "222679-291127", "interaction": "cw", "ranking": 3, "source": "222679", "width": 15, "target": "291127", "selected": false, "similarity": 0.36983013032732703 } }, { "data": { "id": "222679-74067", "interaction": "cw", "ranking": 4, "source": "222679", "width": 15, "target": "74067", "selected": false, "similarity": 0.3654016726773764 } }, { "data": { "id": "222679-155217", "interaction": "cw", "ranking": 5, "source": "222679", "width": 14, "target": "155217", "selected": false, "similarity": 0.33570706311412973 } }, { "data": { "id": "222679-106882", "interaction": "cw", "ranking": 6, "source": "222679", "width": 14, "target": "106882", "selected": false, "similarity": 0.3313388111459223 } }, { "data": { "id": "222679-329800", "interaction": "cw", "ranking": 7, "source": "222679", "width": 13, "target": "329800", "selected": false, "similarity": 0.30108569077928204 } }, { "data": { "id": "222679-6547", "interaction": "cw", "ranking": 8, "source": "222679", "width": 12, "target": "6547", "selected": false, "similarity": 0.29710779453596475 } }, { "data": { "id": "222679-48898", "interaction": "cw", "ranking": 9, "source": "222679", "width": 11, "target": "48898", "selected": false, "similarity": 0.2724355836265852 } }, { "data": { "id": "222679-153786", "interaction": "cw", "ranking": 10, "source": "222679", "width": 11, "target": "153786", "selected": false, "similarity": 0.27229699247700095 } }, { "data": { "id": "266553-265363", "interaction": "cw", "ranking": 1, "source": "266553", "width": 24, "target": "265363", "selected": false, "similarity": 0.5823504905295456 } }, { "data": { "id": "266553-263235", "interaction": "cw", "ranking": 2, "source": "266553", "width": 22, "target": "263235", "selected": false, "similarity": 0.5260945129524652 } }, { "data": { "id": "266553-67129", "interaction": "cw", "ranking": 3, "source": "266553", "width": 21, "target": "67129", "selected": false, "similarity": 0.5007828346260167 } }, { "data": { "id": "266553-263237", "interaction": "cw", "ranking": 4, "source": "266553", "width": 19, "target": "263237", "selected": false, "similarity": 0.46391296417607586 } }, { "data": { "id": "266553-259349", "interaction": "cw", "ranking": 5, "source": "266553", "width": 17, "target": "259349", "selected": false, "similarity": 0.40304922157960077 } }, { "data": { "id": "266553-143355", "interaction": "cw", "ranking": 6, "source": "266553", "width": 17, "target": "143355", "selected": false, "similarity": 0.40162273332882414 } }, { "data": { "id": "266553-74067", "interaction": "cw", "ranking": 7, "source": "266553", "width": 15, "target": "74067", "selected": false, "similarity": 0.36336287938169 } }, { "data": { "id": "266553-365430", "interaction": "cw", "ranking": 8, "source": "266553", "width": 15, "target": "365430", "selected": false, "similarity": 0.35559996102392405 } }, { "data": { "id": "266553-296196", "interaction": "cw", "ranking": 9, "source": "266553", "width": 14, "target": "296196", "selected": false, "similarity": 0.3495194501188624 } }, { "data": { "id": "266553-86918", "interaction": "cw", "ranking": 10, "source": "266553", "width": 14, "target": "86918", "selected": false, "similarity": 0.34625130907946555 } }] }, "data": { "shared_name": "WineCheeseNetwork", "__Annotations": [], "name": "WineCheeseNetwork", "selected": true } };
*/
    
  // also get style via ajax
  var graphP = $.ajax({
      url: 'http://localhost:11000/kw/data/koreatime_225426.json', // wine-and-cheese-style.cycss
    type: 'GET',
    dataType: 'text'
  });


  var styleP = cytoscape.stylesheet()
    .selector('core')
        .css({
            'active-bg-color': '#fff',
            'active-bg-opacity': '0.333'
        }) 
    .selector('edge')
        .css({
            'curve-style': 'haystack',
            'haystack-radius': '0',
            'opacity': '0.333',
            'width': 'data(width)',
            'z-index': '0',
            'overlay-opacity': '0'
        })
    .selector('node')
        .css({
            'width': '40',
            'height': '40',
            'font-size': '10',
            'font-weight': 'bold',
            'min-zoomed-font-size': '4',
            'content': 'data(name)', // data name in json
            'text-valign': 'center',
            'text-halign': 'center',
            'color': '#000', // Black
            'text-outline-width': '2',
            'text-outline-color': '#fff',
            'text-outline-opacity': '1',
            'overlay-color': '#fff'
        })
    .selector('edge[interaction = "cc"]') // yellow edge
        .css({
            'line-color': '#FACD37',
            'target-arrow-shape': 'none',
            'opacity': '0.666',
            'z-index': '9',
            'width': '4',
            'target-arrow-shape': 'triangle',
            'target-arrow-color': '#FACD37' // yellow
        })
    .selector('node[nodeType = "Event"], node[nodeType = "CheeseType"]')
        .css({
            'background-color': '#FACD37',
            'text-outline-color': '#FACD37'
        })
    .selector('node[depth = "0"]')
        .css({
            'background-color': '#ff3333',
        })
    .selector('node[depth = "1"]')
        .css({
            'background-color': '#ffb3b3',
        })
    .selector('node[depth = "2"]')
        .css({
            'background-color': 'white',
        })
    //.selector('node[nodeType = "인물"]') // white node
    //    .css({
    //        'background-color': 'white',
    //        'text-outline-color': 'white'     - 
    //    })
    .selector('edge[interaction = "cw"]')
        .css({
            'curve-style': 'haystack',
            'line-color': 'white'
        })
    .selector('node[nodeType = "RedWine"]')
        .css({
            'background-color': '#DE3128',
            'text-outline-color': '#DE3128'      
        })
    .selector('edge[interaction = "cr"]')
        .css({
            'line-color': '#DE3128'        
        })
    .selector('node[nodeType = "Cider"]')
        .css({
            'background-color': '#A4EB34',
            'text-outline-color': '#A4EB34'
        })
    .selector('node.highlighted')
        .css({
            'min-zoomed-font-size': '0',
            'font-size': '10',
            'text-outline-width': '2',
            'text-outline-opacity': '1',
            'z-index': '9999'
        })
    .selector('edge.highlighted')
        .css({
            'opacity': '0.8',
            //'width': '10',
            //'width': 'data(width)',
            'z-index': '9999',
            //'label': 'data(ranking)',
            //'font-size': '6',
            //'text-opacity': '100',
            //'text-outline-width': '5'
        })
    .selector('edge.faded')
        .css({
            'opacity': '0.1'
        })
    .selector('node.faded')
        .css({
            'opacity': '0.5',
            'text-opacity': '0'
        })
    .selector('node:selected')
        .css({
            'width': '40',
            'height': '40',
            'border-color': 'rgb(187, 219, 247)', // rgb(187, 219, 247)
            'border-opacity': '0.5', //
            'border-width': '10' //
        })
    .selector('.filtered')
        .css({
            'display': 'none'
        })
        ;

  // infoTemplate in search lists
  var infoTemplate = Handlebars.compile([
    '<p class="ac-name">{{name}}</p>',
    //'<p class="ac-node-type"><i class="fa fa-info-circle"></i> {{nodeTypeFormatted}} {{#if Type}}({{Type}}){{/if}}</p>',
    //'{{#if Milk}}<p class="ac-milk"><i class="fa fa-angle-double-right"></i> {{Milk}}</p>{{/if}}',
    //'{{#if Country}}<p class="ac-country"><i class="fa fa-map-marker"></i> {{Country}}</p>{{/if}}',
    '<p class="ac-more"><i class="fa fa-external-link"></i> <a target="_blank" href="https://ko.wikipedia.org/wiki/{{name}}">위키백과</a></p>'
  ].join(''));

  // when both graph export json and style loaded, init cy
  Promise.all([ graphP, styleP ]).then(initCy);

  // highlight : maybe clicked
  function highlight(node) {
      var nhood = node.closedNeighborhood();

      cy.batch(function () {
          cy.elements().not(nhood).removeClass('highlighted').addClass('faded');
          nhood.removeClass('faded').addClass('highlighted');

          var npos = node.position();
          var w = window.innerWidth;
          var h = window.innerHeight;

          cy.stop().animate({
              fit: {
                  eles: cy.elements(),
                  padding: layoutPadding
              }
          }, {
              duration: layoutDuration
          }).delay(layoutDuration, function () {
              nhood.layout({
                  name: 'concentric',
                  padding: layoutPadding,
                  animate: true,
                  animationDuration: layoutDuration,
                  boundingBox: {
                      x1: npos.x - w / 2,
                      x2: npos.x + w / 2,
                      y1: npos.y - w / 2,
                      y2: npos.y + w / 2
                  },
                  fit: true,
                  concentric: function (n) {
                      if (node.id() === n.id()) {
                          return 2;
                      } else {
                          return 1;
                      }
                  },
                  levelWidth: function () {
                      return 1;
                  }
              });
              cy.style()
                  .selector('edge')
                    .style({
                        'width': 'data("similarity")'
                     })

                  .update() // update the elements in the graph with the new style
              ;
          });

      });
  }

  function clear(){
    cy.batch(function(){
      cy.$('.highlighted').forEach(function(n){
        n.animate({
          position: n.data('orgPos')
        });

      });
      
      cy.elements().removeClass('highlighted').removeClass('faded');
    });
  }

  function showNodeInfo( node ){
    $('#info').html( infoTemplate( node.data() ) ).show();
  }
  
  function hideNodeInfo(){
    $('#info').hide();
  }

  function initCy( then ){
    var loading = document.getElementById('loading');
    var expJson = then[0];
    var styleJson = then[1];
    var elements = expJson.elements;

    elements.nodes.forEach(function(n){
      var data = n.data;
      
      data.nodeTypeFormatted = data.nodeType;
      
      if( data.nodeTypeFormatted === 'RedWine' ){
        data.nodeTypeFormatted = 'Red Wine';
      } else if( data.nodeTypeFormatted === '인물' ){
        data.nodeTypeFormatted = '인물';
      }
      
      n.data.orgPos = {
        x: n.position.x,
        y: n.position.y
      };
    });

    loading.classList.add('loaded');
    var cy = window.cy = cytoscape({
      container: document.getElementById('cy'),
      layout: { name: 'preset', padding: layoutPadding },
      style: styleJson,
      elements: elements,
      motionBlur: true,
      selectionType: 'single',
      boxSelectionEnabled: false
    });
    
    cy.on('free', 'node', function( e ){
      var n = e.cyTarget;
      var p = n.position();
      
      n.data('orgPos', {
        x: p.x,
        y: p.y
      });
    });
    
    cy.on('tap', function(){
      $('#search').blur();
    });

    cy.on('select', 'node', function(e){
      var node = this;

      highlight( node );
      showNodeInfo( node );
    });

    cy.on('unselect', 'node', function(e){
      var node = this;

      clear();
      hideNodeInfo();
    });

  }
  
  $('#search').typeahead({
    minLength: 2,
    highlight: true,
  },
  {
    name: 'search-dataset',
    source: function( query, cb ){
      function matches( str, q ){
        str = (str || '').toLowerCase();
        q = (q || '').toLowerCase();
        
        return str.match( q );
      }
      
      var fields = ['name', 'nodeType', 'Country', 'Type', 'Milk']; // search fieleds
      
      // search
      function anyFieldMatches( n ){
        for( var i = 0; i < fields.length; i++ ){
          var f = fields[i];
          
          if( matches( n.data(f), query ) ){
            return true;
          }
        }
        
        return false;
      }
      
      function getData(n){
        var data = n.data();
        
        return data;
      }
      
      function sortByName(n1, n2){
        if( n1.data('name') < n2.data('name') ){
          return -1;
        } else if( n1.data('name') > n2.data('name') ){
          return 1;
        }
        
        return 0;
      }
      
      var res = cy.nodes().stdFilter( anyFieldMatches ).sort( sortByName ).map( getData );
      
      cb( res );
    },
    templates: {
      suggestion: infoTemplate
    }
  }).on('typeahead:selected', function(e, entry, dataset){
    var n = cy.getElementById(entry.id);
    
    n.select();
    showNodeInfo( n );
  });
  
  $('#reset').on('click', function(){
    cy.animate({
      fit: {
        eles: cy.elements(),
        padding: layoutPadding
      },
      duration: layoutDuration
    });
  });
  
  // if filters are clicked.
  //$('#filters').on('click', 'input', function(){
    
  //  var soft = $('#soft').is(':checked');
  //  var semiSoft = $('#semi-soft').is(':checked');
  //  var na = $('#na').is(':checked');
  //  var semiHard = $('#semi-hard').is(':checked');
  //  var hard = $('#hard').is(':checked');
    
  //  var red = $('#red').is(':checked');
  //  var white = $('#white').is(':checked');
  //  var cider = $('#cider').is(':checked');
    
  //  cy.batch(function(){
      
  //    cy.nodes().forEach(function( n ){
  //      var type = n.data('nodeType');
        
  //      n.removeClass('filtered');
        
  //      var filter = function(){
  //        n.addClass('filtered');
  //      };
        
  //      if( type === 'Event' ){
          
  //        var cType = n.data('Type');
          
  //        if( 
  //             (cType === 'Soft' && !soft)
  //          || (cType === 'Semi-soft' && !semiSoft)
  //          || (cType === undefined && !na)
  //          || (cType === 'Semi-hard' && !semiHard)
  //          || (cType === 'Hard' && !hard)
  //        ){
  //          filter();
  //        }
          
  //      } else if( type === 'RedWine' ){
          
  //        if( !red ){ filter(); }
          
  //      } else if( type === '인물' ){
          
  //        if( !white ){ filter(); }
          
  //      } else if( type === 'Cider' ){
          
  //        if( !cider ){ filter(); }
          
  //      }
        
  //    });
      
  //  });
    
  //});
  
  $('#filter').qtip({
    position: {
      my: 'top center',
      at: 'bottom center'
    },
    
    show: {
      event: 'click'
    },
    
    hide: {
      event: 'unfocus'
    },
    
    style: {
      classes: 'qtip-bootstrap',
      tip: {
        width: 16,
        height: 8
      }
    },

    content: $('#filters')
  });
});

  	</script>


  
  <button id="reset" class="btn btn-default"><i class="fa fa-arrows-h"></i></button>
  
</body>
</html>
