$(function() {
  var child_category_select = $('#child_category_select');
  var grandchild_category_select = $('#grandchild_category_select');
  // サイズのslectの選択肢を取得
  var size_select_options = $('#size_select').html().split(/\r\n|\r|\n/);
  // 服サイズのselectの内容を取得
  var cloth_size_select_options = size_select_options.slice(0, 10);
  // 靴サイズのselect内容を取得
  var shoe_size_select_options = size_select_options
  shoe_size_select_options.splice(1, 9);
  // 服サイズを持つ子カテゴリー
  var cloth_size_list = [14, 15, 16, 17, 18, 20, 21, 29, 30, 31, 33, 34, 35, 38, 43, 44, 45, 47, 48, 49, 50, 51, 52]
  // 靴サイズを持つ子カテゴリー
  var shoe_size_list =[19, 36, 53]

  // 配送方法のslectの選択肢を取得
  var shipping_methods_select_options = $('#shipping_method_select').html().split(/\r\n|\r|\n/);
  // 購入者負担のselectの内容を取得
  var buyer_cost_shipping_methods_select_options = [
    shipping_methods_select_options[0],
    shipping_methods_select_options[1],
    shipping_methods_select_options[3],
    shipping_methods_select_options[6],
    shipping_methods_select_options[7]
  ];

  // サイズのselectを消して選択状況をリセット
  function delete_size_input() {
    $('.set-page__fourth__size').hide();
    $('.set-page__fourth__mark--size').hide();
    $('#size_select').hide();
    $('#size_select').children('select').val("unanswered");
  }

  // サイズのselectを表示する
  function show_size_input() {
    $('.set-page__fourth__size').show();
    $('.set-page__fourth__mark--size').css('display', 'inline-block');
    $('.set-page__fourth__pull-down--size').show();
    $('#size_select').show();
  }

  // サイズのselectを取得してselectに挿入する
  function set_size_select() {
    var grandchild_category_id = grandchild_category_select.val();
    var url = '/api/categories';
    $.ajax({
      url: url,
      type: 'get',
      dataType : 'json',
      data: {grandchild_category_id: grandchild_category_id}
    })
    .done(function(grandchild_category_parent_id) {
      delete_size_input();
      // 服カテゴリーが選ばれた時
      if ($.inArray(grandchild_category_parent_id, cloth_size_list) >= 0) {
        show_size_input();
        $('#size_select').empty();
        $('#size_select').append(cloth_size_select_options);
      // 靴カテゴリーが選ばれた時
      } else if ($.inArray(grandchild_category_parent_id, shoe_size_list) >= 0) {
        show_size_input();
        $('#size_select').empty();
        $('#size_select').append(shoe_size_select_options);
      }
    })
    .fail(function() {
      alert('error');
    })
  }

    // ページを読み込んだ時
    $(document).ready(function(){
      // カテゴリーが選択されていれば表示する
      if (child_category_select.children('option:selected').val()) {
        child_category_select.show();
        child_category_select.next('.select-arrow--child').show();
      };
      if (grandchild_category_select.children('option:selected').val()) {
        grandchild_category_select.show();
        grandchild_category_select.next('.select-arrow--grandchild').show();
      };
      // サイズが選択されていればサイズを取得して表示する
      if ($('#size_select').children('option:selected').val() !== 'unanswered') {
        set_size_select();
      };

      $(".set-page__fifth__pull-down2--shipping-method").show();
      $('.set-page__fifth__method').show();
      $('.set-page__fifth__mark--method').css('display', 'inline-block');


    });

  // 親カテゴリーが選択された時、選択されたparent_categoryをコントローラーに送り、child_categoryを表示する
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
      // grandchild_categoryのselectをからにして隠す
      grandchild_category_select.empty();
      grandchild_category_select.append(`<option value>---</option>`);
      grandchild_category_select.hide();
      $(".select-arrow--grandchild").hide();
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
        grandchild_category_select.append(`<option value>---</option>`);
        grandchild_category_select.hide();
        $(".select-arrow--grandchild").hide();
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
  })
  // grandchild_categoryが選択された時
  grandchild_category_select.change(function() {
    // 服サイズあるいは靴サイズを表示する
    set_size_select();
  });

  // 配送料の負担を選択した時、配送の方法を表示させる
  $('#postage_select').change(function() {
    var postage_select = $(this).val();
    // 配送料の負担が選択された時、配送方法を隠す
    if (postage_select != "") {
      $("#shipping_method").hide();
    }
    // 配送方法の選択状況をリセット
    $("#shipping_method_select").empty();
    // selectとラベルと必須マークを表示する
    $(".set-page__fifth__pull-down2--shipping-method").show();
    $('.set-page__fifth__method').show();
    $('.set-page__fifth__mark--method').css('display', 'inline-block');
    // 出品者負担の配送方法を表示
    if (postage_select == 'seller_cost') {
      $("#shipping_method_select").append(shipping_methods_select_options);
    // 購入者負担の配送方法を表示
    } else if (postage_select == 'buyer_cost') {
      $("#shipping_method_select").append(buyer_cost_shipping_methods_select_options);
    }
  })
})
