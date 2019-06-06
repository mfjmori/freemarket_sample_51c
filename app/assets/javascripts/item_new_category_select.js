$(function() {
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
      var child_category_select = $('#child_category_select');
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
      var grandchild_category_select = $('#grandchild_category_select');
      grandchild_category_select.show();
      $('.select-arrow--grandchild').show();
      $.each(grandchild_categories, function(index, grandchild_category) {
        grandchild_category_select.append(`<option value="${grandchild_category.id}">${grandchild_category.name}</option>`)
      })
    })
    .fail(function() {
      alert('error');
    })
  })
})
