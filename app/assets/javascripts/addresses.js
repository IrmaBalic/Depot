//= require i18n
$(document).ready(function() {
	$("#same_as_shipping").change(function() {
		if($(this).is(":checked"))
			$("#input_form_2").css("display","none");
		else
			$("#input_form_2").css("display","block");
	});
	
	// Textbox fields for validation
	var name = $("#user_name");
	var surname = $("#user_surname");
	var address_name = $("#address_name");
	var address_number = $("#address_number");
	var country = $("#country_name");
	var bl_address_name = $("#billing_address_name");
	var bl_address_number = $("#billing_address_number");
	var bl_country = $("#billing_address_country");
	var submit = $(".buy_button");
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
			if(number_of_children == 2) show_warning(field);
		}
		else {
			if (number_of_children > 2) remove_warning(field);
		}
	}
	// Onblur events	
	name.blur(function(){
		validate_field($(this));
	});
	surname.blur(function(){
		validate_field($(this));
	});
	address_name.blur(function(){
		validate_field($(this));
	});
	address_number.blur(function(){
		validate_field($(this));
	});
	country.blur(function(){
		validate_field($(this));
	});
	bl_address_name.blur(function(){
		if(!$("#same_as_shipping").is(":checked"))
			validate_field($(this));
	});
	bl_address_number.blur(function(){
		if(!$("#same_as_shipping").is(":checked"))
			validate_field($(this));
	});
	bl_country.blur(function(){
		if(!$("#same_as_shipping").is(":checked"))
			validate_field($(this));
	});
	// Onsubmit validation
	$("form").submit(function() {
		var has_empty = false;
		$("#user_name,#user_surname,#address_name,#address_number,#country_name", this).each(function() {
			if(!$(this).val()) {
				has_empty = true;
				validate_field($(this));			
			}
		});
		if(!$("#same_as_shipping").is(":checked")) {
			$("#billing_address_name, #billing_address_number, #billing_address_country", this).each(function() {
				if(!$(this).val()) {
					has_empty = true;
					validate_field($(this));			
				}
			});
		}
		if (has_empty)  {
			alert("Forma nije ispravno popunjena.");
			return false;
		}
		return true;
	});
});

