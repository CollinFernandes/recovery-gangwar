<template>
  <div class="chat">
    <div class="chatInput" v-if="chatShowed">
      <img src="images/chatBackground.png" class="background" />
      <input
        class="input"
        type="text"
        ref="editButton"
        placeholder="Type a message..."
        v-bind="message"
      />
    </div>
    <div class="messages">
      <chatMessage
        v-for="(message, index) in messages"
        :key="index"
        :data="message"
      />
    </div>
  </div>
</template>
  
  <script>
import { addNuiListener, fetchNui } from "@/utils";
import chatMessage from "../components/chatMessage.vue";
export default {
  components: {
    chatMessage,
  },
  data() {
    return {
      message: "",
      messages: [
        {
          group: "Sklave",
          groupColor: "#00FF0A",
          playerName: "Kera",
          message: "Dein Anne",
        },
        {
          group: "Administrator",
          groupColor: "#FF0000",
          playerName: "Besic",
          message: "Dein Anne",
        },
        {
          group: "Sklave",
          groupColor: "#00FF0A",
          playerName: "Kera",
          message: "Dein Anne",
        },
        {
          group: "Administrator",
          groupColor: "#FF0000",
          playerName: "Besic",
          message: "Dein Anne",
        },
        {
          group: "Sklave",
          groupColor: "#00FF0A",
          playerName: "Kera",
          message: "Dein Anne",
        },
        {
          group: "Administrator",
          groupColor: "#FF0000",
          playerName: "Besic",
          message: "Dein Anne",
        },
        {
          group: "Donator",
          groupColor: "#FFF500",
          playerName: "Razo865",
          message: "Dein Anne",
        },
      ],
    };
  },
  props: {
    chatShowed: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    focusInput() {
      this.$nextTick(() => {
        const editButtonRef = this.$refs.editButton;
        editButtonRef.focus();
      });
    },
  },
  watch: {
    chatShowed(newVal) {
      if (newVal) {
        this.focusInput();
      }
    },
  },
};
</script>
  
  <style lang="scss" scoped>
.chat {
  width: 500px;
  height: 246px;
  position: absolute;
  top: 40px;
  left: 15px;
  .messages {
    overflow-y: auto;
    width: 498px;
    height: 200px;
  }
  .chatInput {
    width: 358px;
    height: 42px;
    position: absolute;
    bottom: 0px;
    left: 1px;
    .background {
      width: 358px;
      height: 42px;
      position: absolute;
    }
    .input {
      position: absolute;
      width: 353px;
      top: 50%;
      transform: translateY(-50%);
      left: 10px;
      background: transparent;
      border: none;
      color: white;
      font-family: "Gilroy-Regular";
      &:focus {
        outline: none;
      }
    }
  }
}

.messages::-webkit-scrollbar {
  height: 0vmin;
  width: 0px;
}

.messages::-webkit-scrollbar-track {
  background-color: #001217;
}

.messages::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.messages::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>