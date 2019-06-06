$(function() {
  var child_category_select = $('#child_category_select');
  var grandchild_category_select = $('#grandchild_category_select');
  var cloth_size_list = [14, 15, 16, 17, 18, 20, 21, 29, 30, 31, 33, 34, 35, 38, 43, 44, 45, 47, 48, 49, 50, 51, 52]
  var shoe_size_list =[19, 36, 53]

  // サイズのinputを消す
  function delete_size_input() {
    $('.set-page__fourth__size').hide();
    $('.set-page__fourth__mark--size').hide();
    $('#cloth_size_select').hide();
    $('#shoe_size_select').hide();
  }

  // 選択されたparent_categoryをコントローラーに送り、child_categoryを表示する
  $('#parent_category_select').change(function() {
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
      child_category_select.append(`<option value>---</option>`);
      // grandchild_categoryのselectをからにする
      grandchild_category_select.empty();
      grandchild_category_select.append(`<option value>---</option>`);
      grandchild_category_select.hide();
      delete_size_input();
      // child_categoryをselectに表示する
      child_category_select.show();
      $('.select-arrow--child').show();
      $.each(child_categories, function(index, child_category) {
        child_category_select.append(`<option value="${child_category.id}">${child_category.name}</option>`)
      })
    })
    .fail(function() {
      alert('error');
    })
  })

  // 選択されたchild_categoryをコントローラーに送り、grandchild_categoryを表示する
  $('#child_category_select').change(function() {
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
        // grandchild_categoryのselectをからにする
        grandchild_category_select.empty();
        grandchild_category_select.append(`<option value>---</option>`);
        // grandchild_categoryをselectに表示する
        grandchild_category_select.show();
        $('.select-arrow--grandchild').show();
        $.each(grandchild_categories, function(index, grandchild_category) {
          grandchild_category_select.append(`<option value="${grandchild_category.id}">${grandchild_category.name}</option>`)
        })
        delete_size_input();
      }
    })
    .fail(function() {
      alert('error');
    })

    // grandchild_categoryが選択された時, 服サイズ、靴サイズを表示する
    // サイズがない商品は表示しない
    $('#grandchild_category_select').change(function() {
      var grandchild_category_id = $(this).val();
      var url = '/api/categories';
      $.ajax({
        url: url,
        type: 'get',
        dataType : 'json',
        data: {grandchild_category_id: grandchild_category_id}
      })
      .done(function(grandchild_category_parent_id) {
        delete_size_input();
        if ($.inArray(grandchild_category_parent_id, cloth_size_list) >= 0) {
          $('.set-page__fourth__size').show();
          $('.set-page__fourth__mark--size').css('display', 'inline-block');
          $('#cloth_size_select').show();
        } else if ($.inArray(grandchild_category_parent_id, shoe_size_list) >= 0) {
          $('.set-page__fourth__size').show();
          $('.set-page__fourth__mark--size').css('display', 'inline-block');
          $('#shoe_size_select').show();
        }
      })
      .fail(function() {
        alert('error');
      })
    });
  })
})