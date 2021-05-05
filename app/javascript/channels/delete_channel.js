import consumer from "./consumer"

consumer.subscriptions.create("DeleteChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const $id = "#" + data.comment.id
    $($id).remove();
  }
});
