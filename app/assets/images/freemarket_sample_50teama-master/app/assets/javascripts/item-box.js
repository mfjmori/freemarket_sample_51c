$(document).on('turbolinks:load', function() {
  var imgHeight = $(".item-box__photo").width();
  $(".item-box__photo").height(imgHeight);

  $('.item-box__info__name').each(function(){
    if($(this).text().length > 22){
      var trim = $(this).text().substr(0, 21) + '...';
      $(this).text(trim);
    };
  });
});
