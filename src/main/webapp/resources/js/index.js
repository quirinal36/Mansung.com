$(function(){
	var txt = 0;
	console.log(txt);
	$(".bt_cMore").click(function(){
		console.log(txt);
		if(txt == 0) {
			txt ++;
			$(this).html('카테고리 접기 <img src="/resources/img/comm/arrow_up.png" alt="아이콘">');
		} else {
			txt --;
			$(this).html('카테고리 전체보기 <img src="/resources/img/comm/arrow_down.png" alt="아이콘">');
		}
		$(".idx_category_more").slideToggle();
	});
});