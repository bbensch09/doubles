$("#cards").jTinder({
	// dislike callback
  onDislike: function (item) {
    // set the status text
    $.ajax({
      url: '/swipes',
      type: 'POST',
      data: {type: "no", user_id: item.attr('id')},
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
      url: '/swipes',
      type: 'POST',
      data: {type: "yes", user_id: item.attr('id')},
      success: function(data) {
        $('.modal-body').html(data);
        $('#matchModal').modal('show');
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