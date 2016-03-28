jQuery(document).ready(function($){
	var timelineBlocks = $('.cd-timeline-block'),
		offset = 0.8;

	//hide timeline blocks which are outside the viewport
	hideBlocks(timelineBlocks, offset);

	//on scolling, show/animate timeline blocks when enter the viewport
	$(window).on('scroll', function(){
		(!window.requestAnimationFrame) 
			? setTimeout(function(){ showBlocks(timelineBlocks, offset); }, 100)
			: window.requestAnimationFrame(function(){ showBlocks(timelineBlocks, offset); });
	});

	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
		});
	}

	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.cd-timeline-img').hasClass('is-hidden') ) && $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
		});
	}
	
	
	
	
	///////////////////////////////////////////////////////////
	///edit edit edit edit edit edit 
	///////////////////////////////////////////////////////////
	$(window).scroll(
			function() {
				var scrollHeight = $(window).scrollTop() + $(window).height();
				var documentHeight = $(document).height();
				if(scrollHeight  + 200 >= documentHeight){
					alert('alert');//okay
					scrollShow();
				}
				
			});
	
});

function scrollShow(){
	function scrollShow() {
		$.get('${ctx}/main/newsfeed/json.do?limit=' + page, function(data) {
			page += 10;
			show(data);

		});

	}
}