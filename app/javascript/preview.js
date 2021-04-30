$(function() {
  // 画像1のプレビュー機能
  // input要素の値に変更があった場合、関数が発火する
  $('#tweet-image').on('change', function(e) {
    // 画像2のボタンを表示する
    $('#btn-two').addClass('display');
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const $imgOne = $('#preview-one');
    if ($imgOne) {
      $imgOne.remove();
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
    blobImage.attr('id', 'preview-one');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.append(blobImage);
    $('#image-list-one').append(imageElement);
  });
  
  
  // 画像2のプレビュー機能
  // input要素の値に変更があった場合、関数が発火する
  $('#tweet-image-two').on('change', function(e) {
    // 画像3のボタンを表示する
    $('#btn-three').addClass('display');
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const $imgTwo = $('#preview-two');
    if ($imgTwo) {
      $imgTwo.remove();
    }
    // 選択した画像を変数に格納し、URLを作成する
    const fileTwo = e.target.files[0];
    const blobTwo = window.URL.createObjectURL(fileTwo);

    // 画像を表示するためのdiv要素を生成
    const imageElementTwo = $(document.createElement('div'));
    // 表示する画像を生成
    const blobImageTwo = $(document.createElement('img'));
    blobImageTwo.attr('src', blobTwo);
    blobImageTwo.attr('class', 'preview-image');
    blobImageTwo.attr('id', 'preview-two');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElementTwo.append(blobImageTwo);
    $('#image-list-two').append(imageElementTwo);
  });
  
  
  // 画像3のプレビュー機能
  // input要素の値に変更があった場合、関数が発火する
  $('#tweet-image-three').on('change', function(e) {
    // 画像4のボタンを表示する
    $('#btn-four').addClass('display');
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const $imgThree = $('#preview-three');
    if ($imgThree) {
      $imgThree.remove();
    }
    // 選択した画像を変数に格納し、URLを作成する
    const fileThree = e.target.files[0];
    const blobThree = window.URL.createObjectURL(fileThree);

    // 画像を表示するためのdiv要素を生成
    const imageElementThree = $(document.createElement('div'));
    // 表示する画像を生成
    const blobImageThree = $(document.createElement('img'));
    blobImageThree.attr('src', blobThree);
    blobImageThree.attr('class', 'preview-image');
    blobImageThree.attr('id', 'preview-three');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElementThree.append(blobImageThree);
    $('#image-list-three').append(imageElementThree);
  });
  
  
  // 画像4のプレビュー機能
  // input要素の値に変更があった場合、関数が発火する
  $('#tweet-image-four').on('change', function(e) {
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const $imgFour = $('#preview-four');
    if ($imgFour) {
      $imgFour.remove();
    }
    // 選択した画像を変数に格納し、URLを作成する
    const fileFour = e.target.files[0];
    const blobFour = window.URL.createObjectURL(fileFour);

    // 画像を表示するためのdiv要素を生成
    const imageElementFour = $(document.createElement('div'));
    // 表示する画像を生成
    const blobImageFour = $(document.createElement('img'));
    blobImageFour.attr('src', blobFour);
    blobImageFour.attr('class', 'preview-image');
    blobImageFour.attr('id', 'preview-four');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElementFour.append(blobImageFour);
    $('#image-list-four').append(imageElementFour);
  });
});