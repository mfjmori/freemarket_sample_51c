$(document).on('turbolinks:load', function() {
  var parent_id;
  link_blue = '#0099e8'
  base_red = '#ea352d'
  white = '#fff'
  gray_lv4 = '#333'
  gray_lv1 = '#f5f5f5'

  $('.parent-category').change(function(){
    $('.relative--hidden').css('display','none');
    $('.child-category').prop('disabled', true);
    $('.child-category').val("");
    $('.grandchild-category').prop('disabled', true);
    $('.grandchild-category').val("");
    child_id = $(this).val() + '-children-item';
    $('#' + child_id).css('display','block');
    $('#' + child_id).children().prop('disabled', false);
  });

  $('.child-category').change(function(){
    $('.relative--hidden').css('display','none');
    $('.grandchild-category').prop('disabled', true);
    $('.grandchild-category').val("");
    grandchild_id = $(this).val() + '-grandchildren-item';
    $('#' + child_id).css('display','block');
    $('#' + grandchild_id).css('display','block');
    $('#' + grandchild_id).children().prop('disabled', false);
  });

  $('.category-show').on("mouseover", function(){
    $('.category-list__parent').css('display','block');
    $(this).css({'opacity':'0,8','color':link_blue})
  });

  $('.category-list__parent a').on("mouseover", function(){
    $('.category-list__child').css('display','none');
    $('.category-list__grandchild').css('display','none');
    $('.category-list__parent a').css({'background-color':white,'color':gray_lv4});
    $(this).css({'background-color':base_red,'color':white});
    parent_id = $(this).data('parent') + '-children';
    $('#' + parent_id).css('display','block');
  });

  $('.category-list__child a').on("mouseover", function(){
    $('.category-list__grandchild').css('display','none');
    $('.category-list__child a').css('background-color',white);
    $(this).css('background-color',gray_lv1);
    child_id = $(this).data('child') + '-grandchildren';
    $('#' + child_id).css('display','block');
  });

  $('.category-list').on("mouseleave", function(){
    $('.category-list__parent').css('display','none');
    $('.category-list__child').css('display','none');
    $('.category-list__grandchild').css('display','none');
    $('.category-show').css({'opacity':'1','color':gray_lv4});
    $('.category-list__parent a').css({'background-color':white,'color':gray_lv4});
    $('.category-list__child a').css('background-color',white);
  });

  $('.category-list a').on("click", function(){
    $('.category-list__parent').css('display','none');
    $('.category-list__child').css('display','none');
    $('.category-list__grandchild').css('display','none');
    $('.category-show').css({'opacity':'1','color':gray_lv4});
    $('.category-list__parent a').css({'background-color':white,'color':gray_lv4});
    $('.category-list__child a').css('background-color',white);
  });
});
