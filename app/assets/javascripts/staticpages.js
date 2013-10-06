$(function () {
  var $container = $('#container');
  $container.masonry({
   columnWidth:50,
   itemSelector:'.tweetbox'
  });
});

$(function(){
    $('.tweetbox').resizable()
});
    