$(function() {
	$('.bxslider').bxSlider({
	  pagerCustom: '#bx-pager'
	});
	var category = $("#category");
	var category_sel = category.value;
	var product_title = $("#product_title");
	var product_price = $("#product_price");
	var submit = $("#submit_form");
	// Functions
	function show_warning(field) {
		field.css("border-color", "#dd4b39"); 
		var warning_label = null;
		if (locale  == "bs")
			warning_label = $("<p></p>").text("Ovo polje ne može ostati prazno.");
		else 
			warning_label = $("<p></p>").text("This field can't be empty.");
		warning_label.attr("class","warning");
		warning_label.css("color","#dd4b39");
		field.parent().append(warning_label);
	}
	function remove_warning(field) {
		field.parent().children("p").remove(".warning");
		field.css("border-color", "#b7b7b7");
	}
	function validate_field(field) {
		var number_of_children = field.parent().children().length;
		if (!field.val()) {
			if(number_of_children == 3) show_warning(field);
		}
		else {
			if (number_of_children > 3) remove_warning(field);
		}
	}
	//Onblur events	
	/*category.blur(function(){
		validate_field($(this));
	});*/
	product_title.blur(function(){
		validate_field($(this));
	});
	product_price.blur(function(){
		validate_field($(this));
	});
	// Onsubmit validation
	$("form").submit(function() {
		var has_empty = false;
		$("#product_title, #product_price", this).each(function() {
			if(!$(this).val()) {
				has_empty = true;
				validate_field($(this));			
			}
		});
		if(category_sel == -1) {
			has_empty = true;
		}
		if (has_empty)  {
			alert("Forma nije ispravno popunjena.");
			return false;
		}
		return true;
	});
});