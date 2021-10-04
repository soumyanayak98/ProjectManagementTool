// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import "jquery";
import "popper.js";
import "bootstrap";

$(document).on("turbolinks:load", function () {
	let tasks = Array.from($(".tasks"));
	tasks.forEach(function (task) {
		let lastChild = task.lastElementChild;
		lastChild.style.display = "none";
	});

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
