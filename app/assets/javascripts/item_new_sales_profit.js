$(function() {
  $('.set-page__sixth__form__box__input').on('keyup', function() {
    var price = $(this).val();
    $('.set-page__sixth__comission__content').text('-');
    $('.set-page__sixth__profit__content').text('-');
    if (price > 299 && price < 10000000) {
      var comission = Math.floor(price / 10);
      var profit = price - comission;
      $('.set-page__sixth__comission__content').text(`¥${comission.toLocaleString()}`);
      $('.set-page__sixth__profit__content').text(`¥${profit.toLocaleString()}`);
    }
  })
})
