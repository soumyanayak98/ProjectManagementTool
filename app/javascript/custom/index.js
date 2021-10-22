$(document).on("turbolinks:load", function () {
	$("#currBtn").on("click", function () {
		$("#currItr").hide();
	});
	$("#backBtn").on("click", function () {
		$("#backlogs").hide();
	});
	$("#iceBtn").on("click", function () {
		$("#icebox").hide();
	});

	$("#menu-icon").on("click", openNav);
	$("#close-icon").on("click", closeNav);

	$("#currOpen").on("click", function () {
		$("#currItr").show();
	});
	$("#backOpen").on("click", function () {
		$("#backlogs").show();
	});
	$("#iceOpen").on("click", function () {
		$("#icebox").show();
	});

	$(".previous_page").html("<< Prev");
	$(".next_page").html("Next >>");
});

function openNav() {
	document.getElementById("mySidenav").style.width = "225px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}
