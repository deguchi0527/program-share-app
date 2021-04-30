$(function() {
  
  function changeBtn() {
    // 表示されている画像のインデック番号を取得する
    const imgIndex = $('.tweet-box-img').index($('.active'));
    // change-btn要素を表示してください
    $('.change-btn').show();
    // 「.change-btn」の表示/非表示をおこなってください
    if (imgIndex == 0) {
      $('.prev-btn').hide();
    } else if (imgIndex == $('.tweet-box-img').length - 1) {
      $('.next-btn').hide();
    }
  };
  
  // ボタンの番号と同じ画像を表示する
  $('.tweet-page-btn').on('click', function() {
    // 「.active」要素からactiveクラスを取り除く
    $('.active').removeClass('active');

    // クリックしたボタンのインデックス番号を取得
    const clickIndex = $('.tweet-page-btn').index($(this));
    // クリックしたボタンの画像を表示
    $('.tweet-box-img').eq(clickIndex).addClass('active');

    changeBtn();
  });

  // 画像を一枚送りでスライドする
  $('.change-btn').on('click', function() {
    // 表示されている画像の要素を取得する
     const $displayImg = $('.active');
     // 変数$displayImgからactiveクラスを取り除く
     $displayImg.removeClass('active');
    // $displayImgの前もしくは次の要素にactiveクラスをつける
    if ($(this).hasClass('next-btn')) {
      $displayImg.next().addClass('active');
    } else {
      $displayImg.prev().addClass('active');
    }

    changeBtn();
  });

  // 画像の表示枚数によってボタンを非表示にする
  if ($('.tweet-box-img').length == 3) {
    $('.tweet-page-btn').eq(3).hide();
  } else if ($('.tweet-box-img').length == 2) {
    $('.tweet-page-btn').eq(2).hide();
    $('.tweet-page-btn').eq(3).hide();
  } else if ($('.tweet-box-img').length == 1) {
    $('.change-btn').hide(); 
    $('.tweet-img-btn').hide();
  }

});
