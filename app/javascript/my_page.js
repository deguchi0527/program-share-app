$(function() {
  // アイコンをクリックするとプルダウンを表示/非表示にする
  $('#lists').on('click', function() {
    const $pullDown = $('#pull-down');
    if ($pullDown.css('display') == 'block') {
      $pullDown.css('display', 'none');
    } else {
      $pullDown.css('display', 'block');
    }
  });
  
  // リストをホバーすると背景色が変更する
  $('.user-show-list').on({
    'mouseenter': function() {
      $(this).css('background-color', '#eee');
    },
    'mouseleave': function() {
      $(this).css('background-color', '#fff');
    }
  });
});