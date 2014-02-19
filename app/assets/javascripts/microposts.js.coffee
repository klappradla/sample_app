$(document).ready ->
	$("#micropost_content").on("focus change keyup keydown", updateCountdown)

updateCountdown = ->
	chars = 140 - $("#micropost_content").val().length
	$(".countdown").text chars
	$(".countdown").css "color", "gray"
	if chars < 0
		$(".countdown").css "color", "red"

