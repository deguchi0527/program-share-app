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
    <div class="comment-list" id=${data.content.id}>
      <p>
        <strong><a href="/users/${data.content.user_id}">${data.nickname}</a></strong>
        <a href="/tweets/${data.content.tweet_id}/comments/${data.content.id}", data-method="delete">
          <i class="far fa-trash-alt"></i>
        </a>
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
  
  }
});
