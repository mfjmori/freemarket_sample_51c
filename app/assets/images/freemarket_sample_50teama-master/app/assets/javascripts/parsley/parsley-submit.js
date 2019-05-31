// 該当するIDをつけたformの要素クリック時にparsleyバリデーションを実施
// 参考記事
// https://qiita.com/mekemo_dao/items/4875a45c971091401ff1
// https://qiita.com/Coolucky/items/e3ee9e0997785c38f2e9

$(function(){
  $("#submit-button").on('click', function(){
    $('#item-new-visible').parsley().validate();
  });
});

$(function(){
  $('form.parsley').parsley({
    // レンダーされるエラーのul,liタグの指定
    errorsWrapper: '<ul class="parsley-error-list"></ul>',
    errorTemplate: '<li class="parsley-error-item"></li>',
    // parsleyを適用するフォームの種類の指定（デフォルトだとhiddenが使えないので指定する）
    excluded: 'input[type=button],' +
              'input[type=submit],' +
              'input[type=reset],' +
              '[disabled]',
    inputs: 'input, textarea, select, :hidden',
    // 入力に変更があった場合にバリデーションを走らせる
    trigger: 'change'
  });
});