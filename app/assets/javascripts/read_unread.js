function readAndUnread() {

	function changeStatusToRead(id_of_link) {
		console.log('Changing status of ' + id_of_link);
		$.ajax({
			type: 'PATCH',
			url:  '/api/v1/links/' + id_of_link,
			data: {
				link: {
					read: true
				}
			},
			success: function() {
				var modifyLink = $("[data-id=" + id_of_link + "]");
				modifyLink.addClass('read');
				modifyLink.attr('data-read', 'read');
				var button = $(modifyLink.children('button'))
				button.prop('innerText', 'Mark as Unread');
				button.one('click', function () {
					changeStatusToUnread(id_of_link);
				});
			}
		});
	}

	function changeStatusToUnread(id_of_link) {
		$.ajax({
			type: 'PATCH',
			url:  '/api/v1/links/' + id_of_link,
			data: {
				link: {
					read: false
				}
			},
			success: function () {
				var modifyLink = $("[data-id=" + id_of_link + "]");
				modifyLink.removeClass('read');
				modifyLink.attr('data-read', 'unread');
				var button = $(modifyLink.children('button'))
				button.prop('innerText', 'Mark as Read');
				button.one('click', function () {
					changeStatusToRead(id_of_link);
				});
			}
		});
	}

	$('.status-change').each( function (index, button) {
		if($(button).attr('data-read') == 'false') {
			$(button).one('click', function () {
				changeStatusToRead($(button).parent().attr('data-id'));
			});
		} else {
			$(button).one('click', function () {
				changeStatusToUnread($(button).parent().attr('data-id'));
			});
		}
	})
}