$(document).on('turbolinks:load', function() {
  // もし、画像の数が５個か9個なら、ドラッグ&ドロップエリアを小さくする
  var size = $(".upload-item").length;
  if (size == 5 || size == 9){
    $("#drop_zone").css("width","18%");
  }
  if (size == 10){
    $("#drop_zone").remove();
  }
  // 「削除」ボタンがクリックされると、見えないチェックボックスにチェックが入り、アイテムを見えなくする
  // データベースには、「送信」ボタンを押した時に反映される
  // 参考URL: https://note.mu/hajime38/n/ne2650fdf4559
  $(document).on('click', '.delete-check-box', function(){
    if($(this).prop('checked') == true){
      $(this).parents(".upload-item").css({
        "visibility": "hidden",
        "width": "0",
        "height": "0",
        "margin": "0",
      });
    };
  });

  $('.image-uploader').change(function(e){
    var files = e.target.files;
    var i = 0;
    function readAndPreview(file) {
      var reader = new FileReader();
      reader.addEventListener("load", function () {
        var image = new Image();
        var html = `<div class="upload-item">
                      <img class="upload-item__photo">
                      <div class="upload-item__nav">
                        <div class="upload-item__nav__edit">
                          <p>編集</p>
                        </div>
                        <label class="upload-item__nav__delete" for="item_${i}">
                          <input name="item_${i}" type="hidden" value="0">
                          <input class="hidden delete-check-box check-box" type="checkbox" value="1" name="item_${i}" id="item_${i}">
                          <p>削除</p>
                        </label>
                      </div>
                    </div>`
        $('#img_prev').html($('#img_prev').html() + html);
        image.height = 111.5;
        image.width = 111.5;
        image.title = file.name;
        image.src = this.result;
        $('.upload-item:last-child img').remove();
        $('.upload-item:last-child').prepend( image );
        i = i+1;
      }, false);
      reader.readAsDataURL(file);
    }
    if (files) {
      [].forEach.call(files, readAndPreview);
    }
  });

  $('.input-part__input').on("keyup", function(){
    if($(this).val() >= 300 && $(this).val() <= 9999999) {
      var fee_output = Math.floor($(this).val() * 0.1);
      $('.input-part__price--fee--output').text(fee_output);
      $('.input-part__price--total--output').text($(this).val() - fee_output);
    }else {
      $('.input-part__price--fee--output').text('-');
      $('.input-part__price--total--output').text('-');
    }
  });
});
