$(document).ready(function(){
  initJTinder();
});

var totalSwipes = 0;
var totalCards = $('#cards ul li').length;

console.log("totalCards: " + totalCards);

function checkForMore() {
  if (totalSwipes == totalCards) {
    $.ajax({
      url: '/feed',
      type: 'GET',
      success: function(data) {
        $('#cards ul').append(data);
        initJTinder();
      },
      error: function(data) {
        console.error(data);
      },
    });
    totalSwipes = 0;
  }
  totalCards = $('#cards ul li').length;
  console.log("totalCards: " + totalCards);
};

function initJTinder() {
  $("#cards").jTinder({

  	// dislike callback
    onDislike: function (item) {
      totalSwipes++;
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
      checkForMore();
    },
  	// like callback
    onLike: function (item) {
      totalSwipes++;
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
      checkForMore();
    },

  	animationRevertSpeed: 200,
  	animationSpeed: 400,
  	threshold: 1,
  	likeSelector: '.like',
  	dislikeSelector: '.dislike'
  });
};

/**
 * Set button action to trigger jTinder like & dislike.
 */
$('.actions .like, .actions .dislike').click(function(e){
	e.preventDefault();
	$("#cards").jTinder($(this).attr('class'));
});