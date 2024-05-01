<template>
  <div>
    <Frakpick v-if="frakpickState" :teams="teams" />
    <hud v-if="hudState" />
    <Garage :showed="garageState" :vehicles="vehicles" />
    <Clothing
      :showed="clothingState"
      :clothes="clothes"
      :clothingTypes="clothingTypes"
    />
    <Deathscreen :showed="deathscreenStatus" :data="deathscreenData" />
    <!-- <Chat :chatShowed="chatState" @closeChat="closeChat" @message="message" /> -->
    <Config :showed="configState" />
    <div class="chat">
      <transition>
        <div class="chatInput" v-if="chatState">
          <img src="images/chatBackground.png" class="background" />
          <input
            class="input"
            type="text"
            ref="editButton"
            placeholder="Type a message..."
            v-model="message"
          />
        </div>
      </transition>
      <transition>
        <div ref="messagesDown" class="messages" v-if="messagesState">
          <chatMessage
            v-for="(message, index) in messages"
            :key="index"
            :data="message"
          />
        </div>
      </transition>
    </div>
  </div>
</template>

<script>
import Deathscreen from "./interfaces/Deathscreen.vue";
import Frakpick from "./interfaces/Frakpick.vue";
import hud from "./interfaces/hud.vue";
import Garage from "./interfaces/Garage.vue";
import Clothing from "./interfaces/Clothing.vue";
import Config from "./interfaces/Config.vue";
import chatMessage from "./components/chatMessage.vue";
// import Chat from "./interfaces/Chat.vue";
import { addNuiListener, fetchNui } from "./utils";

export default {
  name: "App",
  components: {
    Frakpick,
    hud,
    Garage,
    Clothing,
    Deathscreen,
    chatMessage,
    Config,
    // Chat,
  },
  data() {
    return {
      frakpickState: true,
      hudState: false,
      garageState: false,
      clothingState: false,
      deathscreenStatus: false,
      chatState: false,
      messagesState: false,
      configState: false,

      teams: [],
      deathscreenData: [],
      vehicles: [],
      clothes: [],
      clothingTypes: [],
      messages: [],
      message: "",
    };
  },
  mounted() {
    addNuiListener("ToggleHUD", (args) => {
      this.hudState = args.state;
    });
    addNuiListener("TogglePick", (args) => {
      this.frakpickState = args.state;
    });
    addNuiListener("loadTeam", (args) => {
      this.teams.push(args.team);
    });
    addNuiListener("ToggleGarage", (args) => {
      this.garageState = args.state;
    });
    addNuiListener("setVehicles", (args) => {
      this.vehicles = args.vehicles;
    });
    addNuiListener("ToggleClothing", (args) => {
      this.clothingState = args.state;
    });
    addNuiListener("setClothes", (args) => {
      this.clothes = args.clothes;
    });
    addNuiListener("setClothingTypes", (args) => {
      this.clothingTypes = args.clothingTypes;
    });
    addNuiListener("setDeathscreen", (args) => {
      this.deathscreenStatus = args.state;
      this.deathscreenData = args.data;
    });

    addNuiListener("ToggleChat", (args) => {
      this.chatState = args.state;
      this.messagesState = true;
      this.$nextTick(() => {
        const editButtonRef = this.$refs.editButton;
        editButtonRef.focus();
      });
    });

    addNuiListener("appendToChat", (args) => {
      this.messagesState = true;
      this.messages.push(args.message);
      setTimeout(() => {
        if (this.chatState) return;
        this.messagesState = false;
      }, 5000);
      const lastChildElement = this.$refs.messagesDown.lastChildElement;
      if (lastChildElement) {
        lastChildElement.scrollIntoView({
          behavior: "smooth",
        });
      }
    });

    addNuiListener("ToggleConfig", (args) => {
      this.configState = args.state;
    });

    document.onkeyup = (data) => {
      if (data.which == 27) {
        if (!this.deathscreenStatus) {
          this.garageState = false;
          this.clothingState = false;
          if (this.chatState) this.messagesState = false;
          this.chatState = false;
          this.configState = false
          fetchNui("close", {}, "");
        }
      } else if (data.which == 13) {
        if (this.chatState) {
          this.chatState = false;
          this.messagesState = false;
          fetchNui("sendMessage", { message: this.message }, "");
          this.message = "";
        }
      }
    };
  },
  methods: {
    closeChat() {
      this.chatState = false;
    },
  },
};
</script>

<style lang="scss" scoped>
.chat {
  width: 500px;
  height: 246px;
  position: absolute;
  top: 50px;
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

<style lang="scss">
@import "./transitions.scss";
* {
  margin: 0vh;
  overflow: hidden;
}
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@100..900&family=League+Spartan:wght@100..900&display=swap");

#app {
  user-select: none;
  font-family: "Montserrat-Bold", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: white;
  overflow: hidden;
  top: 0vh;
  left: 0vh;
}

@font-face {
  font-family: "Norms-Bold";
  src: url("../public/fonts/TTNormsPro.otf");
}
@font-face {
  font-family: "Druk";
  src: url(../public/fonts/DrukCyr-Medium.ttf);
}
@font-face {
  font-family: "Montserrat-Bold";
  src: url("../public/fonts/Montserrat-Bold.a8958d1a.ttf");
}
@font-face {
  font-family: "Montserrat-Medium";
  src: url("../public/fonts/Montserrat-Medium.50ba2624.ttf");
}
@font-face {
  font-family: "Montserrat-SemiBold";
  src: url("../public/fonts/Montserrat-SemiBold.39bc7b11.ttf");
}
@font-face {
  font-family: "RegularM";
  src: url("../public/fonts/MonumentExtended-Regular.otf");
}
@font-face {
  font-family: "OxaniumExtra";
  src: url("../public/fonts/Oxanium-ExtraBold.ttf");
}
@font-face {
  font-family: "OxaniumMedium";
  src: url("../public/fonts/Oxanium-Medium.ttf");
}
@font-face {
  font-family: "Regular";
  src: url("../public/fonts/PPMonumentExtended-Regular.ttf");
}
@font-face {
  font-family: "Medium";
  src: url("../public/fonts/PPMonumentExtended-Medium.ttf");
}
@font-face {
  font-family: "Book";
  src: url("../public/fonts/PPMonumentExtended-Book.ttf");
}

@font-face {
  font-family: "Gilroy-Bold";
  src: url("../public/fonts/Gilroy-Bold.ttf");
}

@font-face {
  font-family: "Gilroy-Medium";
  src: url("../public/fonts/Gilroy-Medium.ttf");
}

@font-face {
  font-family: "Gilroy-Semibold";
  src: url("../public/fonts/Gilroy-Semibold.ttf");
}

@font-face {
  font-family: "Gilroy-Regular";
  src: url("../public/fonts/Gilroy-Regular.otf");
}

@font-face {
  font-family: "Rubrica";
  src: url(../public/fonts/rubrica.ttf);
}

@font-face {
  font-family: "Monument Extended";
  src: url("../public/fonts/MonumentExtended-Regular.otf");
}

@font-face {
  font-family: "Brothership";
  src: url("../public/fonts/brothership.regular.ttf");
}

@font-face {
  font-family: "Akrobat";
  src: url("../public/fonts/Akrobat-Regular.otf");
}

@font-face {
  font-family: "Druk Cyr";
  src: url("../public/fonts/DrukCyr-Bold.ttf");
}

@font-face {
  font-family: "TT Norms Pro";
  src: url("../public/fonts/TTNormsPro.otf");
}

@font-face {
  font-family: "Jarvitts";
  src: url("../public/fonts/Jarvitts.ttf");
}

@font-face {
  font-family: "BOZART";
  src: url("../public/fonts/BOZART.ttf");
}

@font-face {
  font-family: "metropolis.bold";
  src: url("../public/fonts/metropolis.bold.otf");
}

@font-face {
  font-family: "docallismeonstreet";
  src: url("../public/fonts/docallismeonstreet.ttf");
}

@font-face {
  font-family: "Nuvel";
  src: url("../public/fonts/Nuvel.otf");
}

@font-face {
  font-family: "Porter";
  src: url("../public/fonts/Porter.ttf");
}
</style>