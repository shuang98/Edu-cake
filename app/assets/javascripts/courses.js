$(document).on('click', '#edit-section', function(event) {
	event.preventDefault();
	/* Act on the event */
	$('#new-section-form').fadeToggle();
	$('.delete-section').fadeToggle();
});
$(document).on('click', '.section-link', function(event) {
	event.preventDefault();
	var section_id = $(this).attr('id');
	$('.section-link').css('background-color', 'white');
	$(this).css('background-color', 'lightgrey');
	$('.section-form').hide();
	$('#description').hide();
	$('#section-form-' + section_id).show();
});
$(document).on('click', '.add-body', function(event) {
	event.preventDefault();
	var section_id = $(this).attr('id');
	var course_id = $('.course-id').attr('id');
	$.get('/courses/' + course_id + '/sections/buildbody', {section_id: section_id}, function(data) {
		$('#section-form-' + section_id).html(data);
	});
});
$(document).on('click', '.add-video', function(event) {
	event.preventDefault();
	var section_id = $(this).attr('id');
	$('#new-video-form-' + section_id).fadeToggle();
});
$(document).on('click', '.delete-section', function(event) {
	event.preventDefault();
	var section_id = $(this).attr('id');
	var course_id = $('.course-id').attr('id');
	$('.section-form').hide();
	$.ajax({
    	url: '/courses/' + course_id + '/sections/' + section_id,
    	type: 'DELETE',
    	success: function(result) {
    		$('li#' + section_id).hide();
    	}
	});
});

$(document).on('click', '.show-answer', function(event) {
	event.preventDefault();
	var excersize_id = $(this).attr('id');
	$('#answer-' + excersize_id).show();

});




