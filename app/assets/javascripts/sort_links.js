function sortLinks() {
	$('#sort-button').on('click', function() {
		tinysort(document.querySelectorAll('li.link'), 'span');
	});
}