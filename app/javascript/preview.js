$(function() {
  // input要素の値に変更があった場合、関数が発火する
  $('#tweet-image').on('change', function(e) {
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const $img = $('img');
    if ($img) {
      $img.remove();
    }
    // 選択した画像を変数に格納し、URLを作成する
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    // 画像を表示するためのdiv要素を生成
    const imageElement = $(document.createElement('div'));
    // 表示する画像を生成
    const blobImage = $(document.createElement('img'));
    blobImage.attr('src', blob);
    blobImage.attr('class', 'preview-image');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.append(blobImage);
    $('#image-list').append(imageElement);
  });
});