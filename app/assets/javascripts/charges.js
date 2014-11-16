$(document).ready(function() {
	$("#change_shipping_button").click(function() {
		$("#change_billing_button").css("display","none");
		$("#order_details_shipping").css("display","none");
		$("#old_shipping_addresses").css("display","block");
		$("#order_details_shipping").css("border", "rgb(204, 204, 204) solid 1px");
		$("#order_details_shipping").css("box-shadow", "none");
    
	});
	$("#change_billing_button").click(function() {
		$("#change_shipping_button").css("display","none");
		$("#order_details_billing").css("display","none");
		$("#order_details_shipping").css("margin-left", "100px");
		$("#old_billing_addresses").css("display","block");
		$("#order_details_billing").css("border", "rgb(204, 204, 204) solid 1px");
		$("#order_details_billing").css("box-shadow", "none");
	});
});