$('.product__details__item__image__big-overflow-img').slick({
  arrows:false,
  asNavFor:'.product__details__item__image-show__box-image',
});
$('.product__details__item__image-show__box-image').slick({
  asNavFor:'.product__details__item__image__big-overflow-img',
  focusOnSelect: true,
  slidesToShow:3,
  slidesToScroll:1,
  centerMode: true,
});