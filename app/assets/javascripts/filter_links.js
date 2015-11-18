function filterLinks() {
	var $links = $('.link');

	$('#filter_status').on('change', function () {
    var currentStatus = this.value;
    if (currentStatus === "all") {
      $links.each(function (index, link){
        $link = $(link);
        $link.show();
      });
    } else {
      $links.each(function (index, link) {
        $link = $(link);
        if ($link.attr('data-read') === currentStatus) {
          $link.show();
        } else {
          $link.hide();
        }
      });
    }
  });

  $('#filter_title').on('keyup', function (){
    var searchTerm = this.value.toLowerCase();
    $('.link').each(function (index, link) {
      var title = $(link).children('span.link-body').text().toLowerCase();
      var matches = title.indexOf(searchTerm) !== -1;
      $(link).toggle(matches);
    });
  });
}