$('.product__details__item__image-overflow').slick({
  arrows:false,
  asNavFor:'.product__details__item__image-show',
});
$('.product__details__item__image-show').slick({
  asNavFor:'.product__details__item__image-overflow',
  focusOnSelect: true,
  slidesToShow:3,
  slidesToScroll:1,
  centerMode: true,
});