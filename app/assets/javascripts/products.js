$(function() {
	$('.bxslider').bxSlider({
	  pagerCustom: '#bx-pager'
	});
	
	$(".entry").hover(function() {
		var mq = window.matchMedia( "(max-width: 991px)" );
		if(!mq.matches) {
			var element = $(".entry").index(this);
			var loading = $(".cart_button_loading").get(element);
			if($(loading).css("display") == "none") {
				var add_to_cart = $(".button_store").get(element);
				$(add_to_cart).css("display","inline-block");
			}
		}
	}, function() {
		var mq = window.matchMedia( "(max-width: 991px)" );
		if(!mq.matches) {
			var element = $(".entry").index(this);
			var add_to_cart = $(".button_store").get(element);
			$(add_to_cart).css("display","none");
		}
		}
	);
});