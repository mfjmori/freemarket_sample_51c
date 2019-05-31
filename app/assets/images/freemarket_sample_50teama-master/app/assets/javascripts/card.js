$(document).on('turbolinks:load', function(){
  var form = $(".charge-form"); //フォーム全体をセレクタに。
  Payjp.setPublicKey('pk_test_bd6af6f7d2f00fbfda8c3ae1'); //公開鍵
  $(".charge-form").submit(function(e) {
    e.preventDefault();
    var card = {
      number: parseInt($("#payment-card-number").val()),
      cvc: parseInt($("#payment-card-cvc").val()),
      exp_month: parseInt($("#payment-card-exp-month").val()),
      exp_year: parseInt($("#payment-card-exp-year").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
      }
      else {
        var token = response.id;
        $(".charge-form").append($('<input type="hidden" name="payjp_token" class="payjp-token"/>').val(token));
      }
      $(".charge-form").get(0).submit();
    });
  });
});
