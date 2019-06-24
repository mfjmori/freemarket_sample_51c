$(document).on('turbolinks:load', function(){
  $('.slick-main').slick({
    dots:true,
    customPaging: function(slick,index) {
      var targetImage = $(slick.$slides[index]).attr('src');
      return '<img src=" ' + targetImage + ' "/>';
    }
  });
  $( '.slick-main' ).on( 'mouseenter', '.slick-dots > li', function() {
    $( this ).click();
  });
  $( '.slick-main' ).on( 'mouseover', '.slick-dots > li', function() {
    $( this ).css({
      opacity: "1",
      cursor: "pointer"
    });
  });
  $( '.slick-main' ).on( 'mouseout', '.slick-dots > li', function() {
    $( this ).css({
      opacity: "",
      cursor: ""
    });
  });
});