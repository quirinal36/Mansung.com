$(function(){
	txt = 0;
	$(".bt_cMore").click(function(){
		// console.log(txt);
		if(txt == 0) {
			txt ++;
			$(this).text("카테고리 접기");
		} else {
			txt --;
			$(this).text("카테고리 전체보기");
		}
		$(".idx_category_more").slideToggle();
	});
});