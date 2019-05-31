Dropzone.options.itemDropzone = {
  autoProcessQueue: false,
  addRemoveLinks: true,
  uploadMultiple: true,
  chunking: false,
  maxFiles: 10,
  parallelUploads: 10,
  acceptedFiles: 'image/*',
  // resizeMimeType: 'image/png, image/jpeg, image/gif',
  // acceptedMimeTypes: 'image/png, image/jpeg, image/gif',
  // 10個同時にアップロードできるが、並んだ順に処理するわけでない、従ってレコードの並びは概ね並び順にできるが後のファイルほど順番が変わることがある。

  init: function() {
    var submitButton = document.querySelector("#submit-button")
        itemDropzone = this;
    submitButton.addEventListener("click", function() {
      itemDropzone.processQueue();
    });
    this.on("addedfile", function() {
    });
  }
};

$(function(){
  $("#form-item-name").change(function() {
    const itemName = $(this).val();
    $('input:hidden[id="hidden-item-name"]').val(itemName);
  });
  $("#form-item-detail").change(function() {
    const itemDetail = $(this).val();
    $('textarea[id="hidden-item-detail"]').val(itemDetail);
  });

  $("#form-item-parent_category_id").change(function() {
    const itemParentCategoryId = $(this).val();
    $('input:hidden[id="hidden-item-parent_category_id"]').val(itemParentCategoryId);
    $('input:hidden[id="hidden-item-child_category_id"]').val();
    $('input:hidden[id="hidden-item-grandchild_category_id"]').val();

    $("#categories_container").on("change", $("#form-item-child_category_id"), function () {
      const itemChildCategoryId = $("#" + itemParentCategoryId + "-children-item select").val();
      $('input:hidden[id="hidden-item-child_category_id"]').val(itemChildCategoryId);
      $('input:hidden[id="hidden-item-grandchild_category_id"]').val();

      $("#categories_container").on("change", $("#form-item-grandchild_category_id"), function () {
        const itemGrandchildCategoryId = $("#" + itemChildCategoryId + "-grandchildren-item select").val();
        $('input:hidden[id="hidden-item-grandchild_category_id"]').val(itemGrandchildCategoryId);
      });
    });
  });

  $("#form-item-condition").change(function() {
    const itemCondition = $(this).val();
    $('input:hidden[id="hidden-item-condition"]').val(itemCondition);
  });
  $("#form-item-delivery_cost").change(function() {
    const itemDeliveryCost = $(this).val();
    $('input:hidden[id="hidden-item-delivery_cost"]').val(itemDeliveryCost);
  });
  $("#form-item-delivery_method").change(function() {
    const itemDeliveryMethod = $(this).val();
    $('input:hidden[id="hidden-item-delivery_method"]').val(itemDeliveryMethod);
  });
  $("#form-item-delivery_prefecture").change(function() {
    const itemDeliveryPrefecture = $(this).val();
    $('input:hidden[id="hidden-item-delivery_prefecture"]').val(itemDeliveryPrefecture);
  });
  $("#form-item-delivery_day").change(function() {
    const itemDeliveryDay = $(this).val();
    $('input:hidden[id="hidden-item-delivery_day"]').val(itemDeliveryDay);
  });
  $("#form-item-price").change(function() {
    const itemPrice = $(this).val();
    $('input:hidden[id="hidden-item-price"]').val(itemPrice);
  });
})
