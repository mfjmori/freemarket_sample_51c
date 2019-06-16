$(function() {
  var child_category_select = $('#child_category_select-search');
  var grandchild_category_select = $('.search-form__detail__category__block');

  // ページを読み込んだ時
  $(document).ready(function(){
    // カテゴリーが選択されていれば表示する
    if ($('#parent_category_select-search').children('option:selected').val()) {
      $('.search-form__detail__category__pull-down--child').show();
    };
    if (child_category_select.children('option:selected').val()) {
      $('.search-form__detail__category__block').show();
    };
  });

  // 親カテゴリーが選択された時、選択されたparent_categoryをコントローラーに送り、child_categoryを表示する
  $('#parent_category_select-search').change(function() {
    var parent_category_id = $(this).val();
    var url = '/api/categories';

    $.ajax({
      url: url,
      type: 'get',
      dataType : 'json',
      data: {parent_category_id: parent_category_id}
    })
    .done(function(child_categories) {
      // child_categoryのselectをからにする
      child_category_select.empty();
      child_category_select.append(`<option value>すべて</option>`);
      // grandchild_categoryのselectをからにして隠す
      grandchild_category_select.empty();
      grandchild_category_select.hide();
      // child_categoryをselectに表示する
      $('.search-form__detail__category__pull-down--child').show();
      $.each(child_categories, function(index, child_category) {
        child_category_select.append(`<option value="${child_category.id}">${child_category.name}</option>`)
      })
    })
    .fail(function() {
      alert('error');
    })
  })

  // 小カテゴリーが選択された時、選択されたchild_categoryをコントローラーに送り、grandchild_categoryを表示する
  child_category_select.change(function() {
    var child_category_id = $(this).val();
    var url = '/api/categories';
    $.ajax({
      url: url,
      type: 'get',
      dataType : 'json',
      data: {child_category_id: child_category_id}
    })
    .done(function(grandchild_categories) {
      if (grandchild_categories != false) {
        // grandchild_categoryのselectをからにして隠す
        grandchild_category_select.empty();
        $(".search-form__detail__category__block").hide();
        // grandchild_categoryをselectに表示する
        $('.search-form__detail__category__block').show();
        $.each(grandchild_categories, function(index, grandchild_category) {
          grandchild_category_select.append(`
            <label class="search-form__detail__category__block__check-boxes__label" for="q_category_id_eq_any_${grandchild_category.id}">
              <input class="search-form__detail__category__block__check-boxes__label__input" type="checkbox" value="${grandchild_category.id}" name="q[category_id_eq_any][]" id="q_category_id_eq_any_${grandchild_category.id}">
              <i class="fas fa-check check-icon search-form__detail__category__block__check-boxes__label__icon"></i>
              <label class="search-form__detail__category__block__check-boxes__label__text" for="q_category_id_eq_any_${grandchild_category.id}">${grandchild_category.name}</label>
            </label>
          `)
        })
      }
    })
    .fail(function() {
      alert('error');
    })
  })
  // 価格の範囲が選択された時、MINとMAXを入力する
  $('.search-form__detail__price__pull-down__select').change(function() {
    var price_range = $(this).children('option:selected').val().split('~', 2);
    var min_price = price_range[0];
    var max_price = price_range[1];
    $('.search-form__detail__price__inputs__min').val(min_price);
    $('.search-form__detail__price__inputs__max').val(max_price);
  })
})
