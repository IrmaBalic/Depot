/*$(document).ready(function() {
	$(".cart_button_buy").click(function() {
		$(this).css("display","none");
		var element = $(".cart_button_buy").index(this);
		var loading = $(".cart_button_loading").get(element);
		$(loading).css("display","inline-block");
		$(loading).addClass("click_loading");
		var done = $(".cart_button_buy").get(element);
		setTimeout(function(){ 
			$(loading).addClass("click_checked").removeClass("click_loading");
		}, 2000);
		setTimeout(function(){
			$(loading).removeClass("click_checked");
			$(loading).css("display","none");
			$(".cart_button_buy").css("display","inline-block");
		}, 5000);
	});
});*/
$(function() {
	$('.bxslider').bxSlider({
	  pagerCustom: '#bx-pager'
	});
});