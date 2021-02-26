// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import consumer from "../channels/consumer"

require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", () => {
  let chatRoomChannel = consumer.subscriptions.create({
    channel: "ChatRoomChannel",
    chat_room_id: $("#chat-room-id")[0].value
    }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      $("#messages" + "-" + $("#chat-room-id")[0].value).prepend(data["message"]);
    },

    speak(message) {
      this.perform('speak', { message: message, chat_room_id: $("#chat-room-id")[0].value })
    }
  });

  $("#chat_room_speaker").keypress(function(event) {
    if (event.keyCode === 13) {
      chatRoomChannel.speak($("#chat_room_speaker")[0].value);
      $("#chat_room_speaker")[0].value = '';
    }
  });
})
