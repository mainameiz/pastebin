$(document).ready(function() {
	$('a.embed').click(function(event) {
		$(this).hide().next().show().select()
		event.preventDefault()
	})
	$('input.embed').focusout(function() {
		$(this).hide().prev().show()
	})
})
