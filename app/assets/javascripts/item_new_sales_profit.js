$(function() {
  // priceが300〜10000000の場合に販売手数料と販売利益を表示する
  function set_comission_and_profit(price) {
    if (price > 299 && price < 10000000) {
      var comission = Math.floor(price / 10);
      var profit = price - comission;
      $('.set-page__sixth__comission__content').text(`¥${comission.toLocaleString()}`);
      $('.set-page__sixth__profit__content').text(`¥${profit.toLocaleString()}`);
    }
  }
  // ページを読み込んだ時
  $(document).ready(function(){
    var price = $('.set-page__sixth__form__box__input').val();
    set_comission_and_profit(price);
  })
  // priceを入力した時
  $('.set-page__sixth__form__box__input').on('keyup', function() {
    var price = $(this).val();
    $('.set-page__sixth__comission__content').text('-');
    $('.set-page__sixth__profit__content').text('-');
    set_comission_and_profit(price);
  })
})
