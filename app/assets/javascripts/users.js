$(function() {
	var user_name = $("#user_name");
	var user_surname = $("#user_surname");
	var user_email = $("#user_surname");
	var user_password = $("#user_surname");
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
	user_name.blur(function(){
		validate_field($(this));
	});
	user_surname.blur(function(){
		validate_field($(this));
	});
	user_email.blur(function(){
		validate_field($(this));
	});
	user_password.blur(function(){
		validate_field($(this));
	});
	// Onsubmit validation
	$("form").submit(function() {
		var has_empty = false;
		$("#user_name, #user_surname, #user_password, #user_email", this).each(function() {
			if(!$(this).val()) {
				has_empty = true;
				validate_field($(this));			
			}
		});
		if (has_empty)  {
			alert("Forma nije ispravno popunjena.");
			return false;
		}
		return true;
	});
});