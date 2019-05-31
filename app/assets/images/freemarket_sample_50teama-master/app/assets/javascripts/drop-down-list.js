$(document).on('turbolinks:load', function() {

  $('#notification-list__root').on("mouseover", function(){
    $('#notification-list').css('display','block');
      $('#todo-list').css('display','none');
      $('#mypage-box').css('display','none');
      $(this).on("mouseout", function(){
        $('#notification-list').css('display','none');
      });
    }); //「お知らせ」ボタンに触るとリストが表示される
  });

  $(document).on('turbolinks:load', function() {
    $('#notification-list').on("mouseover", function(){
      $(this).css('display','block');
      }); //表示されたリストを触り続けている間はリストが表示され続ける

    $('#notification-list').delay(500).on("mouseout", function(){
      $(this).css('display','none');
    }); //リストからマウスを離すと、0.5秒後にリストは見えなくなる



//---------------------------------------------やることリストのJS
  $('#todo-list__root').on("mouseover", function(){
    $('#todo-list').css('display','block');
      $('#notification-list').css('display','none');
      $('#mypage-box').css('display','none');
      $(this).on("mouseout", function(){
        $('#todo-list').css('display','none');
      });
    }); // end #todo-list の dysplayがblockの時の処理
  }); // end mouse over 時の処理

  $(document).on('turbolinks:load', function() {
    $('#todo-list').on("mouseover", function(){
      $(this).css('display','block');
      });

    $('#todo-list').delay(500).on("mouseout", function(){
      $(this).css('display','none');
  });

//---------------------------------------------マイページBOXのJS
  $('#mypage-box__root').on("mouseover", function(){
    $('#mypage-box').css('display','block');
      $('#notification-list').css('display','none');
      $('#todo-list').css('display','none');
      $(this).on("mouseout", function(){
        $('#mypage-box').css('display','none');
      });
    }); // end #todo-list の dysplayがblockの時の処理
  }); // end mouse over 時の処理

  $(document).on('turbolinks:load', function() {
    $('#mypage-box').on("mouseover", function(){
      $(this).css('display','block');
      });

    $('#mypage-box').delay(500).on("mouseout", function(){
      $(this).css('display','none');
  });

});
