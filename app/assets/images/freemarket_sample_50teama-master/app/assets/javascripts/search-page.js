$(document).on('turbolinks:load', function(){

  $("#search").on('click', function(){
    var buildSearchOptions = `
    <div id="tablet-size">
      <div class="options">
        <h4 class="options__header icon-plus">キーワードを追加する</h4>
        <input class="text-field" placeholder="今の検索キーワード" type="text" name="keyword" id="keyword">
        <div class="select-box">
          <h4 class="options__header icon-list">カテゴリーを選択する</h4>
          <select class="select-box__inner" name="categories" id="categories"><option value="">すべて</option>
          <option value="01">カテゴリー１</option>
          <option value="02">カテゴリー２</option>
          <option value="03">カテゴリー３</option>
          <option value="04">カテゴリー４</option>
          <option value="05">カテゴリー５</option></select>
          <p class="icon-chevron-down"></p>
        </div>
      <h4 class="options__header icon-tag">ブランド名から探す</h4>
      <input class="text-field" placeholder="例）シャネル" type="text" name="keyword" id="keyword">
    <div class="select-box">
      <h4 class="options__header icon-ruler">サイズを指定する</h4>
      <select class="select-box__inner" name="categories" id="categories"><option value="">すべて</option>
      <option value="01">オプション１</option>
      <option value="02">オプション２</option>
      <option value="03">オプション３</option>
      <option value="04">オプション４</option>
      <option value="05">オプション５</option></select>
      <p class="icon-chevron-down"></p>
    </div>
    <div class="select-box">
      <h4 class="options__header icon-coins">価格</h4>
      <select class="select-box__inner" name="categories" id="categories"><option value="">すべて</option>
      <option value="01">オプション１</option>
      <option value="02">オプション２</option>
      <option value="03">オプション３</option>
      <option value="04">オプション４</option>
      <option value="05">オプション５</option></select>
      <p class="icon-chevron-down"></p>
    </div>
    <div class="options__price">
      <input class="text-field" placeholder="¥ Min" type="text" name="keyword" id="keyword">
      <span class="options__price__range">~</span>
      <input class="text-field" placeholder="¥ Max" type="text" name="keyword" id="keyword">
    </div>
    <h4 class="options__header icon-star">商品の状態</h4>
    <div class="check-box">
      <label>
      <input type="checkbox" name="items[condition][]" id="items_condition_" value="すべて">
      すべて
      </label>
      <label>
      <input type="checkbox" name="items[condition][]" id="items_condition_" value="状態１">
      状態１
      </label>
      <label>
      <input type="checkbox" name="items[condition][]" id="items_condition_" value="状態２">
      状態２
      </label>
    </div>
    <h4 class="options__header icon-truck">配送料の負担</h4>
    <div class="check-box">
    <label>
    <input type="checkbox" name="items[ship_from][]" id="items_ship_from_" value="すべて">
    すべて
    </label>
    <label>
    <input type="checkbox" name="items[ship_from][]" id="items_ship_from_" value="着払い">
    着払い
    </label>
    <label>
    <input type="checkbox" name="items[ship_from][]" id="items_ship_from_" value="送料込み">
    送料込み
    </label>
    </div>
    <h4 class="options__header icon-cart">販売状況</h4>
    <div class="check-box">
    <label>
    <input type="checkbox" name="items[buyer_id][]" id="items_buyer_id_" value="すべて">
    すべて
    </label>
    <label>
    <input type="checkbox" name="items[buyer_id][]" id="items_buyer_id_" value="販売中">
    販売中
    </label>
    <label>
    <input type="checkbox" name="items[buyer_id][]" id="items_buyer_id_" value="売り切れ">
    売り切れ
    </label>
    </div>
    <div class="btn-box">
    <button name="button" type="reset" class="btn-box__clear">クリア</button>
    <input type="submit" name="commit" value="完了" class="btn-box__search" data-disable-with="完了">
    </div>
    </div>
    </div>`

    $(".search-content-l").append(buildSearchOptions);
    $(".search-content-l").on('click', function(){
      console.log('click');
      $("#tablet-size").toggle();
    });
  }); // end search ボタンを押した時のアクション
});
