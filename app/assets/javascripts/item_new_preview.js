$(function(){
  // $(document).ready(function(){
  //   $('form')[0].reset();
  // });
  // ファイルが登録されているドロップゾーンの数を取得して、次に表示するドロップゾーンのwidthの値を返す
  function get_drop_zone_width() {
    // 全ドロップゾーンを取得
    $all_drop_zone = $('.set-page__secound__form__text__drop');
    var file_full_number = 0;
    $all_drop_zone.each(function(i, drop_zone) {
      // ファイルが登録されているドロップゾーンをカウント
      if ($(drop_zone).hasClass('file-full')) {
        file_full_number++;
      }
    });
    // ファイル登録数によってwidthを返す
    switch(file_full_number) {
      case 0:
      case 5:
        var width = 620;
        break;
      case 1:
      case 6:
        var width = 494;
        break;
      case 2:
      case 7:
        var width = 372;
        break;
      case 3:
      case 8:
        var width = 248;
        break;
      case 4:
      case 9:
        var width = 124;
        break;
    }
    return width;
  }

  $lists = $('.set-page__secound__preview');
  // ファイルが登録された時
  $('form').on('change', '.set-page__secound__form__text__drop', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        t = this;
    // ファイルがドロップされたインデックスを取得
    var preview_index = $(this).data('preview');
    // ドロップされたインデックスのドロップエリアを隠す
    $('.set-page__secound__form').hide();
    $(this).parent().hide();
    $(this).addClass('file-full');
    // 全ドロップゾーンを取得
    $all_drop_zone = $('.set-page__secound__form__text__drop');
    // ファイルが保存されていないドロップゾーンを１つだけ表示する、widthも設定する
    $all_drop_zone.each(function(i, drop_zone) {
      if ($(drop_zone).hasClass('file-full') == false) {
        var drop_zone_width = get_drop_zone_width();
        $('.set-page__secound__form').show().css('width', `${drop_zone_width}px`);;
        $(drop_zone).show().css('width', `${drop_zone_width}px`);;
        $(drop_zone).parent().show().css('width', `${drop_zone_width}px`);;
        return false;
      }
    });
    // ファイル読み込みが完了した時
    reader.onload = (function(file) {
      return function(e) {
        //liとfigureと削除ボタンを追加
        $('.set-page__secound__form').before(`
          <div class="set-page__secound__preview__list" id="preview-img-${preview_index}">
            <figure class="set-page__secound__preview__list__figure">
            </figure>
            <div class="set-page__secound__preview__list__delete-button" data-preview="${preview_index}">
              削除
            </div>
          </div>
        `);
        // .figureの中に画像を表示するimageタグを追加
        $preview = $(".set-page__secound__preview__list" + `#preview-img-${preview_index}`).children('figure');
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
    $(`#preview-img-${delete_preview_index}`).remove();
    // 同じインデックスのフォームデータを空にする
    $(`#preview-${delete_preview_index}`).val("");
    // 同じインデックスのフォームのクラスを削除する
    $(`#preview-${delete_preview_index}`).removeClass('file-full');
    // 表示されているドロップエリアを隠す
    $(`.set-page__secound__form__text`).hide();
    // 同じインデックスのドロップエリアを表示する,widthも設定する
    var drop_zone_width = get_drop_zone_width();
    $('.set-page__secound__form').show().css('width', `${drop_zone_width}px`);
    $(`#preview-${delete_preview_index}`).parent().show().css('width', `${drop_zone_width}px`);
    $(`#preview-${delete_preview_index}`).css('width', `${drop_zone_width}px`);
  })
})
