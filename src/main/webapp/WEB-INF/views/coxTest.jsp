<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cox Test</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type ="text/javascript">
	var page ;
	var newSearchBtn = false;
	var query = ''; 
	var iter = 0 ; 
	
	$( document ).ready(function() {
		page = 0 ;
		
		$( "#sbutton" ).click(function() {
			page = 0 ; 
			newSearchBtn = true;
			//resultAjax();
			
			checkInputs();
		});
		
		$( "#showMore" ).click(function() {
			resultAjax();
		});
		
	});
	
	function selectionInit(){
		$( "#lang_code" ).click(function() {
			var url = '../views/selection.php';
			$.ajax({
				type:"GET",
				url: url,
				success:function(response){
					var jsonObj = JSON.parse(response);
					
					$("#lang_code").empty();
					var el = '';
					for(var i = 0 ; i < jsonObj.length; i++){
						el += '<option value = "'+jsonObj[i].lang_code+'">'+jsonObj[i].lang_name+' </option> ' ;
					}
					
					
				}
			});
		});
		
		$( "#corp_id" ).click(function() {
			resultAjax();
		});
		
		$( "#made_con" ).click(function() {
			resultAjax();
		});
		
		$( "#whereabouts" ).click(function() {
			resultAjax();
		});
		
	}
	
	
	function resultAjax(){
		var url = '../views/video_search.php';
		$.ajax({
			type:"GET",
			url: url,
			success:function(response){
			video_result(response);
			}
		});
	}
	
	
	function video_result(response){
		var jsonObj = JSON.parse(response);
		
		if(newSearchBtn){
			newSearchBtn = false;
			$("#show").empty();
		}
		
		for(var i = 0 ; i < jsonObj.length ; i++){
			var  el = '';
			page++;
			el += '<div class="col-md-5">';
			el += '<div class="c-item">';
			el += '<a href="" class="ci-avatar">';
			el += '<img src="./runningman.JPG" alt="">';
			el += '</a></div>';
			el += '</div>';
			el += '<div class="col-md-7">';
			el += jsonObj[i].video_id+'<br><br>';
			el += '<br>';
			el += '<br>';
			el += '<br>';
			el += '<br>';
			el += '<br>';
			el += '<br>';
			el += '<br>';
			el += '<br>';
			el += '<br>';
			el += '</div>';
			$('#show').append(el);
		}
	}
	
	
	
	function createQuery(){
		checkInputs();
		
	}
	
	function checkInputs(){
		var video_title = document.getElementById('video_title');
		
		var director = document.getElementById('director');
		
		var genre = document.getElementById('genre');
		
		var bcategory = document.getElementById('bcategory'); 
		var scategory = document.getElementById('scategory'); 
		
		var lang_code = document.getElementById('lang_code'); 
		var corp_id = document.getElementById('corp_id'); 
		var made_con = document.getElementById('made_con');//whereabouts
		var whereabouts = document.getElementById('whereabouts');
		var gradeRadios = document.getElementsByName('gradeRadio');
		
		var selectedGenre = genre.options[genre.selectedIndex].value;
		
		var selectedBcategory = bcategory.options[bcategory.selectedIndex].value;
		var selectedScategory = scategory.options[scategory.selectedIndex].value;
		
		var selectedLangCode = lang_code.options[lang_code.selectedIndex].value;
		var selectedCorpId = corp_id.options[corp_id.selectedIndex].value;
		var selectedMadeCon = made_con.options[made_con.selectedIndex].value;
		var selectedWhereabouts = whereabouts.options[whereabouts.selectedIndex].value;
		var gradeRadio ;
		
		/* var tables = new Array(); */
				
		for(var i = 0 ; i < gradeRadios.length; i++){
			
			if(gradeRadios[i].checked){
				gradeRadio = gradeRadios[i].value;
			}
		}

		//tag잘라서 tags array에 저장.
		var videoHash = document.getElementById('video_hash').value;
		var tags = videoHash.trim().split('#');
		
		//#으로 자르면 무조건 맨앞 index는 공백이 들어가서 1부터 시작
		for(var i = 1 ; i < tags.length; i++){
			//alert(tags[i]);
		}
		
		var selects = new Array();
	   var tables = new Array();
	   var wheres = new Array();
		alert(isNull(director.value));
		if(!isNull(video_title.value) || !isNull(director.value) || selectedGenre != -1 
				|| selectedLangCode!= -1 || selectedCorpId != -1 || !isNull(gradeRadio)
				|| selectedMadeCon != -1 || selectedWhereabouts != -1)
		{
			alert('table org_video is setted');
			tables.push('original_video as ori_video');
			
			//하나하나 대 해주어야 하나?
			if(!isNull(video_title.value)){
				//selects.push('ori_video.video_title');
				wheres.push(' ori_video.video_title like \'%'+video_title.value+'%\' ');
			}
			
			if(selectedGenre != -1){
				wheres.push(' ori_video.genre = '+selectedGenre+' ');
			}
			
			if(selectedLangCode!= -1){
				wheres.push(' ori_video.lang_code = '+selectedLangCode+' '  );
			}
			
			if(selectedCorpId != -1){
				wheres.push(' ori_video.corp_id = '+selectedCorpId+' '  );
			}
			
			if(!isNull(gradeRadio)){
				wheres.push(' ori_video.grade = '+gradeRadio+'  ');
			}
			
			if(selectMadeCon != -1){
				wheres.push(' ori_video.made_con = '+selectedMadeCon+'  ');				
			}
			
			if(selectWhereAbouts != -1){
				wheres.push(' ori_video.whereabouts = '+selectedWhereabouts+'  ');
			}
			
		}
		
		
		//결과적으로 사람으로 검색하는 것이랑 똑같은거니깐.
		//자체적으로 쿼리를 만들자 이건 따로 빼고,,
		if(!isNull(director.value)){
			tables.push('role as role');
			tables.push('role_mapping as role_map');
			tables.push(' people as people ');
			
			wheres.push(' role.role_name like \'감독\' ');
			wheres.push(' role_map.peopleID = ');
			
		}
		
		if(selectedBcategory != -1 || selectedScategory != -1){
			tables.push('code_mapping as code_map');
			
			//작은 카테고리까지 정해진 경우에는 그것까지 사용해서 검색
			///아놔. 여기는 다시 해야한다.
			if( selectedScategory != -1 ){
				
				wheres.push(' code_map.code_num = '+selectedScategory+' ');
			} else { //큰 카테고리만 정해진 경우
				wheres.push('code_map.code_num between '+selectedScategory+' ');
			}
			
			
			
			
		}
		
		//alert(tables.join());
		alert(wheres.join('and'));
		
		
		
	}
	
	function isNull(elm){
		return (elm == null || elm == "" || elm == "undefined" || elm == " ") ? true : false;
	}
	
</script>




</head>
<body>


<section id="main">
	<aside id="sidebar">
		<div class="sidebar-inner c-overflow">
			<ul class="main-menu">
				<li><a href="/index.php"><i class="zmdi zmdi-home"></i> Home</a></li>				
				<li class="active"><a href="/views/interactive.php"><i class="zmdi zmdi-videocam-switch"></i> Interactive 1</a></li>
				<li><a href="/views/interactive.php"><i class="zmdi zmdi-videocam-switch"></i> Interactive 2</a></li>
				<li><a href="/views/contents_upload.php"><i class="zmdi zmdi-videocam-switch"></i> Contents Upload</a></li>
				<li><a href="/views/contents_result.php"><i class="zmdi zmdi-videocam-switch"></i> Contents Result</a></li>
			</ul>
		</div>
	</aside>
	<form name="input_form" method="POST" action="form_submit.php">
	<section id="content">
		
		<div class="container">			
			<div class="col-sm-8">
				<div class="card" id="haha1">
					<div class="card-header">
						<h2>Contents Information<small>영상 검색</small></h2>
					</div>
					<br>
					<div class="card-body card-padding">
						<div id="original_video">
							<div class="form-group fg-float">
								<div class="row">
									<div class="col-sm-6">
											 <div class="form-group fg-float">
											<div class="fg-line">
												<input type="text" class="input-sm form-control fg-input" id="video_title">
											</div>
											<label class="fg-label">영상 제목</label>
											</div>
									</div>
										<div class="col-sm-6">
											 <div class="form-group fg-float">
												<div class="fg-line">
													<input type="text" class="input-sm form-control fg-input"  id="director">
												</div>
													<label class="fg-label">감독</label>
											</div>
										</div>	
										<script type="text/javascript">
											function test(testbox){
												var objDiv = document.getElementById(testbox);
												if(objDiv.style.display=="none"){ objDiv.style.display = "block"; }
											}
										</script>
										<div class="col-md-6">
											<input onClick="return test('testbox')" type="button" text="searchBtn" id="sbutton" class="btn btn-default waves-effect" text="찾기">
										</div>
								</div>
							</div>
							<div class="form-group fg-float">
								<div class="row">
									<div class="col-sm-4">
										<p class="f-500 c-black m-b-15">장르</p>
										<select class="tag-select" id="genre" data-placeholder="Select Genre">
												<option value = "-1" >장르</option>
												<option value="1010000">SF</option>
												<option value="1020000">공포</option>
												<option value="1030000">느와르</option>
												<option value="1040000">로맨스</option>
												<option value="1050000">뮤직</option>
												<option value="1060000">사회물</option>
												<option value="1070000">신파</option>
												<option value="1080000">어드벤처</option>
												<option value="1090000">옴니버스</option>
												<option value="1100000">전기</option>
												<option value="1110000">청춘</option>
												<option value="1120000">해양액션</option>
												<option value="1130000">과학</option>
												<option value="1140000">무협</option>
												<option value="1150000">미스터리</option>
												<option value="1160000">서부</option>
												<option value="1170000">실험</option>
												<option value="1180000">에로</option>
												<option value="1190000">인권</option>
												<option value="1200000">전쟁</option>
												<option value="1210000">코메디</option>
												<option value="1220000">활극</option>
												<option value="1230000">가족</option>
												<option value="1240000">교육</option>
												<option value="1250000">동성애</option>
												<option value="1260000">문예</option>
												<option value="1270000">반공/분단</option>
												<option value="1280000">스릴러</option>
												<option value="1290000">아동</option>
												<option value="1300000">역사</option>
												<option value="1310000">인물</option>
												<option value="1320000">종교</option>
												<option value="1330000">판타지</option>
												<option value="1340000">갱스터</option>
												<option value="1350000">군사</option>
												<option value="1360000">드라마</option>
												<option value="1370000">문화</option>
												<option value="1380000">범죄</option>
												<option value="1390000">스포츠</option>
												<option value="1400000">자연/환경</option>
												<option value="1410000">지역</option>
												<option value="1420000">하이틴</option>
												<option value="1430000">애니메이션</option>
												<option value="1440000">액션</option>
										</select>
									</div>
									<div class="col-sm-4">
										<p class="f-500 c-black m-b-15">대분류</p>
										<select class="tag-select" id="bcategory" data-placeholder="Choose a Country...">
												<option value="-1">해당 없음</option>
												<option value="MOVIE_MASTER">영화</option>
												<option value="NEWS_MASTER">뉴스</option>
										</select>
									</div>
									<div class="col-sm-4">
										 <p class="f-500 c-black m-b-15">소분류</p>
										<select class="tag-select" id="scategory" data-placeholder="Choose a Country...">
												<option value="-1">해당 없음</option>
												<option value="독립">독립 영화</option>
												<option value="상업">상업 영화</option>
										</select>
									</div>
								</div>
							</div>
							<br>
							<div class="form-group fg-float">
								<div class="row">
									<div class="col-sm-3">
										<p class="f-500 c-black m-b-15">언어</p>
										<select class="tag-select" id="lang_code" data-placeholder="Choose a Country...">
												<option value = -1>언어</option>
												<option value="한국어">한국어</option>
												<option value="프랑스어">프랑스어</option>
												<option value="영어">영어</option>
										</select>
									</div>
									<div class="col-sm-3">
										 <p class="f-500 c-black m-b-15">제작사</p>
										<select class="tag-select" id="corp_id" data-placeholder="Choose a Country...">
												<option value = -1>제작사</option>
												<option value="2">한국방송공사</option>
												<option value="17">워너브라더스</option>
												<option value="19">시네마서비스</option>
										</select>
									</div>
									<div class="col-sm-3">
										<p class="f-500 c-black m-b-15">제작국가</p>
										<select class="tag-select" id="made_con" data-placeholder="Choose a Country...">
												<option value="-1">제작국가</option>
												<option value="1001000000">가봉</option>
												<option value="1006000000">그리스(Greece)</option>
												<option value="1020000000">대한민국(Republic of Korea)</option>
										</select>
									</div>
									<div class="col-sm-3">
										<p class="f-500 c-black m-b-15">소재국가</p>
										<select class="tag-select" id="whereabouts" data-placeholder="Choose a Country...">
												<option value="-1">소재국가</option>
												<option value="1001000000">가봉</option>
												<option value="1006000000">그리스(Greece)</option>
												<option value="1020000000">대한민국(Republic of Korea)</option>
										</select>
									</div>
								</div>
							</div>
							<br>
							 <div class="checkbox m-b-15">
						
								<b> 등&nbsp;&nbsp;&nbsp;&nbsp;급</b>
								<br>
								<br>
								<div class="row">
								
									<div class="col-sm-3">
										<label class="radio radio-inline m-r-22">
											<input type="radio" name="gradeRadio" value="0">
											<i class="input-helper"></i>  
											전체 이용가
										</label>
									</div>
								<div class="col-sm-3">
										<label class="radio radio-inline m-r-22">
											<input type="radio" name="gradeRadio" value="12">
											<i class="input-helper"></i>  
											12세 이용가
										</label>
									</div>
								<div class="col-sm-3">
										<label class="radio radio-inline m-r-22">
											<input type="radio" name="gradeRadio" value="15">
											<i class="input-helper"></i>  
											15세 이용가
										</label>
									</div>
								<div class="col-sm-3">
										<label class="radio radio-inline m-r-22">
											<input type="radio" name="gradeRadio" value="19">
											<i class="input-helper"></i>  
											청소년 관람불가
										</label>
									</div>
								</div>
							</div>
							<br>
							
							<!-- 줄거리는 버려야 한다. result에서..
							<div class="form-group fg-float">
											<p class="f-500 c-black m-b-15">영상 줄거리</p>
											 <div class="form-group fg-float">
											<textarea class="form-control" id="content" rows="5" placeholder="줄거리를 입력하세요"></textarea>
											</div>
							</div>
							
							-->
							<div class="form-group fg-float">
								<div class="row">
									<div class="col-sm-12">
											<p class="f-500 c-black m-b-15">해시태그</p>
										<div class="form-group fg-float">
											<div class="fg-line">
												<input type="text" id="video_hash" class="input-sm form-control fg-input">
											</div>
										</div>	
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="form-group fg-float">
							<div class="row">
								<div class="col-sm-4">
									<p class="f-500 c-black m-b-15">추가 키워드 입력</p>
									<select class="tag-select" id="adcontent" data-placeholder="Choose a Country...">
											<option value="배경">배경</option>
											<option value="행동">행동</option>
											<option value="출연자">출연자</option>
									</select>	
								</div>
								<div class="col-sm-8">
									<p class="f-500 c-black m-b-30"></p>
									<button class="btn btn-default waves-effect" type="button" id="adbutton"><i class="zmdi zmdi-plus"></i></button>
								</div>
							</div>
							<script>
										   var video_title = $('#video_title').val();
										   var genre = $('#genre').val();
										   var bcategory = $('#bcategory').val();
										   var scategory = $('#scategory').val();
										   var lang_code = $('#lang_code').val();
										   var corp_id = $('#corp_id').val();
										   var made_con = $('#made_con').val();
										   var whereabouts = $('#whereabouts').val();
										   var content = $('content').text();
									</script>
							<script>
							    $count = 0;										
								count = 0;
								var element = document.getElementById('adcontent');
									$('#adbutton').click(function() {
							
										if(element.value == "배경"){
											
											$('#div1').append('<div class="row" id="addrow0"><div class="col-sm-3"><p class="f-500 c-black m-b-15">배경</p><select class="tag-select" data-placeholder="Choose a Country..."><option value="United States">시간적 배경</option><option value="United Kingdom">공간적 배경</option></select></div><div class="col-sm-3"><p class="f-500 c-black m-b-15">중분류</p><select class="tag-select" data-placeholder="Choose a Country..."><option value="United States">계절</option><option value="United Kingdom">시간</option></select></div><div class="col-sm-3"><p class="f-500 c-black m-b-15">소분류</p><select class="tag-select" data-placeholder="Choose a Country..."><option value="United States">봄</option><option value="United Kingdom">여름</option></select></div><div class="col-sm-3"><p class="f-500 c-black m-b-30"></p><button class="btn btn-default waves-effect" type="button" id="minusbutton0"><i class="zmdi zmdi-minus"></i></button></div></div>');
											$('.tag-select').chosen({
												width: '100%',
												allow_single_deselect: true
											});
										}
										else if(element.value =="행동"){
											$('#div2').append('<div class="row" id="addrow1"><div class="col-sm-3"><p class="f-500 c-black m-b-15">행동</p><select class="tag-select" data-placeholder="Choose a Country..."><option value="United States">개인과 개인</option><option value="United Kingdom">공간적 배경</option></select></div><div class="col-sm-3"><p class="f-500 c-black m-b-15">중분류</p><select class="tag-select" data-placeholder="Choose a Country..."><option value="United States">던지기</option><option value="United Kingdom">시간</option></select></div><div class="col-sm-3"><p class="f-500 c-black m-b-15">소분류</p><select class="tag-select" data-placeholder="Choose a Country..."><option value="United States">봄</option><option value="United Kingdom">여름</option></select></div><div class="col-sm-3"><p class="f-500 c-black m-b-30"></p><button class="btn btn-default waves-effect" type="button" id="minusbutton1"><i class="zmdi zmdi-minus"></i></button></div></div>');
											$('.tag-select').chosen({
												width: '100%',
												allow_single_deselect: true
											});
										}
										else if(element.value =="출연자"){
											$('#div3').append('<div class="row" id="addrow2"><div class="col-sm-3"><p class="f-500 c-black m-b-15">출연자</p><select class="tag-select" data-placeholder="Choose a Country..."><option value="United States">배우</option><option value="United Kingdom">공간적 배경</option></select></div><div class="col-sm-3"><p class="f-500 c-black m-b-15">중분류</p><select class="tag-select" data-placeholder="Choose a Country..."><option value="United States">경찰</option><option value="United Kingdom">시간</option></select></div><div class="col-sm-3"><p class="f-500 c-black m-b-15">배우 이름</p><div class="fg-line"><input type="text" class="input-sm form-control fg-input"></div></div><div class="col-sm-3"><p class="f-500 c-black m-b-30"></p><button class="btn btn-default waves-effect" type="button" id="minusbutton2"><i class="zmdi zmdi-minus"></i></button></div></div>');
											$('.tag-select').chosen({
												width: '100%',
												allow_single_deselect: true
											});
										}
										else if(element.value == "감정"){
											
										}
									});
								$(document).on("click", ("#minusbutton0"), function(){
										$('#addrow0').remove();
								});
								$(document).on("click", ("#minusbutton1"), function(){
										$('#addrow1').remove();				
								});
								$(document).on("click", ("#minusbutton2"), function(){
										$('#addrow2').remove();
								});
								function register() {
									$(document).on("click", ("#minusbutton2"), function(){
										$('#addrow2').remove();
									});
								};
							</script>	

						</div>
						<div class="form-grupp fg-float" id="div1">
							
						</div>
							<br>
						<div class="form-grupp fg-float" id="div2">
						
						</div>
							<br>
						<div class="form-grupp fg-float" id="div3">
						
						</div>
							<br>
						<div id = "testbox" class="form-group fg-float" style="display:none">
							<div  class="row">
								<div id ="show">
									
								</div>
								
								<input  class="btn btn-primary btn-block waves-effect"  id = "showMore" type = "button" text="더보기">더 보기
							</div>
						</div>
					</div>	
				</div>
								
			</div>
			<div class="col-sm-4">
				<!-- Tabs -->
				<div class="card">
					<div class="card-header">
						<h2>Contents Upload<small>File, WebCam, Youtube</small></h2>
					</div>
					
					<div class="card-body">
						<ul class="tab-nav tn-justified tn-icon" role="tablist" tabindex="1" style="overflow: hidden; outline: none;">
							<li role="presentation" class="active">
								<a class="col-sx-4" href="#tab-1" aria-controls="tab-1" role="tab" data-toggle="tab">
									<i class="zmdi zmdi-cloud-upload icon-tab"></i>
								</a>
							</li>
							<li role="presentation">
								<a class="col-xs-4" href="#tab-2" aria-controls="tab-2" role="tab" data-toggle="tab">
									<i class="zmdi zmdi-videocam icon-tab"></i>
								</a>
							</li>
							<li role="presentation">
								<a class="col-xs-4" href="#tab-3" aria-controls="tab-3" role="tab" data-toggle="tab">
									<i class="zmdi zmdi-share icon-tab"></i>
								</a>
							</li>
						</ul>
						
						<div class="tab-content p-20">
							<div role="tabpanel" class="tab-pane animated fadeIn in active" id="tab-1">
	
						
							</div>
							
							<div role="tabpanel" class="tab-pane animated fadeIn" id="tab-2">		


							</div>
							
							<div role="tabpanel" class="tab-pane animated fadeIn" id="tab-3">

							</div>
						</div>
					</div>
				</div>	
	
			</div>
			
			
			
		</div>
		</form>
	</section>
	
</section>


</body>
</html>