<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />
<c:set var="pageId" value="<%=session.getAttribute(\"pageId\")%>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, minimal-ui">

<title>한국사 위키백과 데이터마이닝</title>
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">-->
<link href="${ctx }/cytoscape/style.css" rel="stylesheet">
</head>
<body>
	<div id="cy"></div>
	<div id="loading">
		<span class="fa fa-refresh fa-spin"></span>
	</div>

	<div id="search-wrapper">
		<input type="text" class="form-control" id="search" autofocus
			placeholder="Search">
	</div>

	<div id="info"></div>

	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.3/fastclick.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

	<script
		src="http://cytoscape.github.io/cytoscape.js/api/cytoscape.js-latest/cytoscape.min.js"></script>
	<!--<script src="../cytoscape.js/build/cytoscape.js"></script>-->

	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/qtip2/2.2.0/jquery.qtip.min.js"></script>
	<link
		href="http://cdnjs.cloudflare.com/ajax/libs/qtip2/2.2.0/jquery.qtip.min.css"
		rel="stylesheet" type="text/css" />
	<script
		src="https://cdn.rawgit.com/cytoscape/cytoscape.js-qtip/2.2.3/cytoscape-qtip.js"></script>

	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/bluebird/1.2.2/bluebird.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.js"></script>
	<!--<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.2/handlebars.min.js"></script>-->
	<script src="${ctx }/cytoscape/handlebars.min.js"></script>
	<script type="text/javascript"> 
	///demojs
  $(function(){

    var layoutPadding = 50;
    var layoutDuration = 500;

  	var page = ${pageId}
  	//alert("page Id : "+page)
  	
	//page  = 225426; //나중에 이거 주석처리 해버리면 됨
	var jsonUrl = 'https://rawgit.com/phoenix2718/koreatime/master/koreatime_'+page+'.json'; //'http://localhost:11000/kw/data/koreatime_'+page+'.json'
    //alert(jsonUrl);
	var graphP = $.getJSON(jsonUrl);
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


	<button id="reset" class="btn btn-default">
		<i class="fa fa-arrows-h"></i>
	</button>

</body>
</html>
