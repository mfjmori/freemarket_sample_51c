$(function(){
  $lists = $('.set-page__secound__preview');
  $('form').on('change', '.set-page__secound__form__text__drop', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        t = this;
    // ファイルがドロップされたインデックスを取得
    var preview_index = $(this).data('preview');

    // ドロップされたインデックスのドロップエリアを隠す
    $('.set-page__secound__form').hide();
    $(this).parent().hide();
    $(this).parent().addClass('file-full');

    // 全ドロップゾーンを取得
    $all_drop_zone = $('.set-page__secound__form__text');
    // ファイルが保存されていないドロップゾーンを１つだけ表示する
    $all_drop_zone.each(function(i, drop_zone) {
      if ($(drop_zone).hasClass('file-full') == false) {
        $('.set-page__secound__form').show();
        $(drop_zone).show();
        return false;
      }
    });

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {

        //liとfigureと削除ボタンを追加
        $lists.append(`<div class="set-page__secound__preview__list" id="preview-${preview_index}"><figure class="set-page__secound__preview__list__figure"></figure><div class="set-page__secound__preview__list__delete-button" data-preview="${preview_index}">削除</div></div>`);
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview = $(".set-page__secound__preview__list" + `#preview-${preview_index}`).children('figure');
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "set-page__secound__preview__list__figure__image",
                  title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
  // 削除ボタンが押されたとき
  $lists.on('click', '.set-page__secound__preview__list__delete-button' ,function() {
    // 削除ボタンのインデックスデータを取得する
    var delete_preview_index = $(this).data('preview');
    // 同じインデックスの画像プレビューを消す
    $('.set-page__secound__preview__list' + `#preview-${delete_preview_index}`).remove();
    // 同じインデックスのフォームデータを空にする
    $('.set-page__secound__form__text__drop' + `#preview-${delete_preview_index}`).val("");
    // 同じインデックスのフォームのクラスを削除する
    $('.set-page__secound__form__text__drop' + `#preview-${delete_preview_index}`).parent().removeClass('file-full');
    // 表示されているドロップエリアを隠す
    $(`.set-page__secound__form__text`).hide();
    // 同じインデックスのドロップエリアを表示する
    $('.set-page__secound__form').show();
    $(`.set-page__secound__form__text--${delete_preview_index}`).show();
  })
})