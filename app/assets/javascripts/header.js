$(function() {
  $(".header__box__bottom__futoji").mouseover(function() {
    $('ul', this).stop().show();
    })
    .mouseout(function() {
    $('ul', this).stop().hide();
  });
});
