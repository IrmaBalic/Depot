//= require i18n
$(document).ready(function() {
	$("#same_as_shipping").change(function() {
		if($(this).is(":checked"))
			$("#input_form_2").css("display","none");
		else
			$("#input_form_2").css("display","block");
	});
});

