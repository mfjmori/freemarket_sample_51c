$(function() {
  $(".nav").hide();
  $(".header__box__bottom__nav-futoji").mouseover(function() {
    $('.nav', this).stop().show();
    })
    .mouseout(function() {
    $('.nav', this).stop().hide();
  });
  $(".btn-person").hide();
  $("li").mouseover(function() {
    $('.btn-person', this).stop().show();
    })
    .mouseout(function() {
    $('.btn-person', this).stop().hide();
  });
  $(".btn-child").hide();
  $(".liperson").mouseover(function() {
    $('.btn-child', this).stop().show();
    })
    .mouseout(function() {
    $('.btn-child', this).stop().hide();
  });
});
