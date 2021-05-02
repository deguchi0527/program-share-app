import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // 非同期でコメントを投稿
    const html = `
    <div class="comment-list">
      <p>
        <strong>${data.nickname}</strong>
        <span><i class="fas fa-ellipsis-h"></i></span>
        <ul class="more_list">
          <li>
            <a href="/tweets/${data.content.tweet_id}/comments/${data.content.id}">削除</a>
          </li>
        </ul>
      </p>
      <p>
        ${data.content.text}
      </p>
    </div>`;
    $('#comments').prepend(html);
    $('#comment_text').val('')
    $('#comment-submit').removeAttr('data-disable-with');
    $('#comment-submit').prop('disabled', false);
    // /非同期でコメントを投稿

    // hover時背景色を変更する
    $('.comment-list').on({
      'mouseenter': function() {
        $(this).css('background-color', '#FFDEAD');
      },
      'mouseleave': function() {
        $(this).css('background-color', 'blanchedalmond');
      }
    });
    // /hover時背景色を変更する
  
    // クリックにより削除ボタンの表示/非表示
    $('.fa-ellipsis-h').on('click', function() {
      const clickIconIndex = $('.fa-ellipsis-h').index($(this));
      if ($('.more_list').eq(clickIconIndex).css('display') == 'block') {
        $('.more_list').eq(clickIconIndex).css('display', 'none');
      } else {
        $('.more_list').eq(clickIconIndex).css('display', 'block');
      }
    });
    // /クリックにより削除ボタンの表示/非表示
  }
});
