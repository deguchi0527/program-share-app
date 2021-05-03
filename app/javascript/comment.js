$(function() {
  $('.comment-list').on({
    'mouseenter': function() {
      $(this).css('background-color', '#FFDEAD');
    },
    'mouseleave': function() {
      $(this).css('background-color', '#ffebcd');
    }
  });

  $('.fa-ellipsis-h').on('click', function() {
    const clickIconIndex = $('.fa-ellipsis-h').index($(this));
    if ($('.more_list').eq(clickIconIndex).css('display') == 'block') {
      $('.more_list').eq(clickIconIndex).css('display', 'none');
    } else {
      $('.more_list').eq(clickIconIndex).css('display', 'block');
    }
  });
});