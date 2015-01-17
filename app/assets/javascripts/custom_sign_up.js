//not working yet, this could replace duplicate views for Sign In and Sign Up

$(document).ready(function(){
		$("#custom_sign_up").on("click", function(){
			alert("This is running");
			window.location.replace("...)
			$("#first_tab").removeClass("active");
			$("#second_tab").addClass("active");
			$("#login").removeClass("active", "in");
			$("#register").addClass("active", "in");
		});
});