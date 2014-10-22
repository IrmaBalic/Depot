$(document).ready(function() {
	$("#same_as_shipping").change(function() {
		if($(this).is(":checked"))
			$("#input_form_2").css("visibility","hidden");
		else
			$("#input_form_2").css("visibility","visible");
	});
});
