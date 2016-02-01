$("#cards").jTinder({
	// dislike callback
  onDislike: function (item) {
    // set the status text
    $.ajax({
      url: '/swipe_no/' + item.attr('id'),
      type: 'GET',
      success: function(data) {
        console.log(data);
      },
      error: function(data) {
        console.log(data);
      },
    });

    },
	// like callback
  onLike: function (item) {
    $.ajax({
      url: '/swipe_yes/' + item.attr('id'),
      type: 'GET',
      success: function(data) {
        console.log(data);
      },
      error: function(data) {
        console.log(data);
      },
    });
    },
	animationRevertSpeed: 200,
	animationSpeed: 400,
	threshold: 1,
	likeSelector: '.like',
	dislikeSelector: '.dislike'
});

/**
 * Set button action to trigger jTinder like & dislike.
 */
$('.actions .like, .actions .dislike').click(function(e){
	e.preventDefault();
	$("#cards").jTinder($(this).attr('class'));
});