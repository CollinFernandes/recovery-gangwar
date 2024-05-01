<template>
  <transition>
    <div class="hitmarker" v-if="showed">
      <div class="hitsounds">
        <div class="header">
          <span class="head">HITSOUNDS</span>
          <div class="deco"></div>
        </div>
        <div class="soundItems">
          <soundItem
            v-for="(sound, index) in hitSounds"
            :data="sound"
            :key="index"
            @toggle="toggle(sound)"
          />
        </div>
      </div>
      <div class="killsounds">
        <div class="header">
          <span class="head">KILLSOUNDS</span>
          <div class="deco"></div>
        </div>
        <div class="soundItems">
          <soundItem
            v-for="(sound, index) in killSounds"
            :data="sound"
            :key="index"
            @toggle="toggleKillsound(sound)"
          />
        </div>
      </div>
      <div class="fonts">
        <div class="header">
          <span class="head">FONTS</span>
          <div class="deco"></div>
        </div>
        <div class="fontItems">
          <fontItem
            v-for="(font, index) in hitFonts"
            :key="index"
            :data="font"
            @toggle="toggleFont(font)"
          />
        </div>
      </div>
      <div class="colors">
        <div class="header">
          <span class="head">COLORS</span>
          <div class="deco"></div>
        </div>
        <div class="colorItems">
          <colorItem
            v-for="(color, index) in hitColors"
            :key="index"
            :data="color"
            @toggle="toggleColor(color)"
          />
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import soundItem from "@/components/config/soundItem.vue";
import fontItem from "@/components/config/fontItem.vue";
import colorItem from "@/components/config/colorItem.vue";
export default {
  components: {
    soundItem,
    fontItem,
    colorItem
  },
  props: {
    showed: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  methods: {
    toggle(sound) {
      this.hitSounds.forEach((hitSound) => {
        if (hitSound.name === sound.name) hitSound.state = !hitSound.state;
        else hitSound.state = false;
      });
    },
    toggleFont(font) {
      this.hitFonts.forEach((hitFont) => {
        if (hitFont.name === font.name) hitFont.state = !hitFont.state;
        else hitFont.state = false;
      });
    },
    toggleColor(color) {
      this.hitColors.forEach((hitColor) => {
        if (hitColor.name === color.name) hitColor.state = !hitColor.state;
        else hitColor.state = false;
      });
    },
    toggleKillsound(sound) {
      this.killSounds.forEach((killSound) => {
        if (killSound.name === sound.name) killSound.state = !killSound.state;
        else killSound.state = false;
      });
    }
  },
  data() {
    return {
      hitSounds: [
        {
          name: "Rust",
          icon: "images/config/rust.png",
          audio: "hitSounds/rust.ogg",
          state: false,
        },
        {
          name: "COD",
          icon: "images/config/cod.png",
          audio: "hitSounds/cod.ogg",
          state: false,
        },
        {
          name: "CSGO",
          icon: "images/config/csgo.png",
          audio: "hitSounds/csgo.ogg",
          state: false,
        },
        {
          name: "Fortnite",
          icon: "images/config/fortnite.png",
          audio: "hitSounds/fortnite.ogg",
          state: false,
        },
        {
          name: "Minecraft",
          icon: "images/config/minecraft.png",
          audio: "hitSounds/minecraft.ogg",
          state: false,
        },
        {
          name: "Roblox",
          icon: "images/config/roblox.png",
          audio: "hitSounds/roblox.ogg",
          state: false,
        },
      ],
      killSounds: [
      {
          name: "Rust",
          icon: "images/config/rust.png",
          audio: "killSounds/rust.ogg",
          state: false,
        },
        {
          name: "COD",
          icon: "images/config/cod.png",
          audio: "killSounds/cod.ogg",
          state: false,
        },
        {
          name: "CSGO",
          icon: "images/config/csgo.png",
          audio: "killSounds/csgo.ogg",
          state: false,
        },
        {
          name: "Fortnite",
          icon: "images/config/fortnite.png",
          audio: "killSounds/fortnite.ogg",
          state: false,
        },
        {
          name: "Roblox",
          icon: "images/config/roblox.png",
          audio: "killSounds/roblox.ogg",
          state: false,
        },
      ],
      hitFonts: [
        {
          name: "1",
          font: "BOZART",
          state: false,
        },
        {
          name: "2",
          font: "metropolis.bold",
          state: false,
        },
        {
          name: "3",
          font: "Nuvel",
          state: false,
        },
        {
          name: "4",
          font: "Rubrica",
          state: false,
        },
        {
          name: "5",
          font: "TT Norms Pro",
          state: false,
        },
        {
          name: "6",
          font: "Druk Cyr",
          state: false,
        },
        {
          name: "7",
          font: "Akrobat",
          state: false,
        },
        {
          name: "8",
          font: "Brothership",
          state: false,
        },
      ],
      hitColors: [
        {
          name: "Red",
          color: "#FF0000",
          state: false,
        },
        {
          name: "Green",
          color: "#00FF00",
          state: false,
        },
        {
          name: "Blue",
          color: "#0000FF",
          state: false,
        },
        {
          name: "Yellow",
          color: "#FFFF00",
          state: false,
        },
        {
          name: "Purple",
          color: "#800080",
          state: false,
        },
        {
          name: "Orange",
          color: "#FFA500",
          state: false,
        },
        {
          name: "Pink",
          color: "#FFC0CB",
          state: false,
        },
        {
          name: "White",
          color: "#FFFFFF",
          state: false,
        },
        {
          name: "Black",
          color: "#000000",
          state: false,
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
.hitmarker {
  width: 87.1296vmin;
  height: 47.4074vmin;
  .hitsounds {
    position: absolute;
    width: 19.9074vmin;
    height: 44.4444vmin;
    .header {
      width: 5.0926vmin;
      height: 2.8704vmin;
      .head {
        position: absolute;
        left: 0vmin;
        top: 0vmin;

        font-family: "Rubrica";
        font-size: 2.2222vmin;

        color: #ffffff;
      }
      .deco {
        position: absolute;
        width: 2.4074vmin;
        height: 0.0926vmin;
        background: #00c2ff;
        border-radius: 0.2778vmin;
        top: 2.3148vmin;
        left: 0vmin;
      }
    }
    .soundItems {
      position: absolute;
      height: 44.1667vmin;
      width: 19.9074vmin;
    }
  }
  .killsounds {
    position: absolute;
    left: 22.5vmin;
    width: 19.9074vmin;
    height: 44.4444vmin;
    .header {
      width: 5.0926vmin;
      height: 2.8704vmin;
      .head {
        position: absolute;
        left: 0vmin;
        top: 0vmin;

        font-family: "Rubrica";
        font-size: 2.2222vmin;

        color: #ffffff;
      }
      .deco {
        position: absolute;
        width: 2.4074vmin;
        height: 0.0926vmin;
        background: #00c2ff;
        border-radius: 0.2778vmin;
        top: 2.3148vmin;
        left: 0vmin;
      }
    }
    .soundItems {
      position: absolute;
      height: 44.1667vmin;
      width: 19.9074vmin;
    }
  }
  .fonts {
    position: absolute;
    left: 44.9074vmin;
    width: 19.9074vmin;
    height: 44.4444vmin;
    .header {
      width: 5.0926vmin;
      height: 2.8704vmin;
      .head {
        position: absolute;
        left: 0vmin;
        top: 0vmin;

        font-family: "Rubrica";
        font-size: 2.2222vmin;

        color: #ffffff;
      }
      .deco {
        position: absolute;
        width: 2.4074vmin;
        height: 0.0926vmin;
        background: #00c2ff;
        border-radius: 0.2778vmin;
        top: 2.3148vmin;
        left: 0vmin;
      }
    }
    .fontItems {
      overflow-y: auto;
      position: absolute;
      height: 44.1667vmin;
      width: 19.9074vmin;
    }
  }
  .colors {
    position: absolute;
    left: 67.3148vmin;
    width: 19.9074vmin;
    height: 44.4444vmin;
    .header {
      width: 5.0926vmin;
      height: 2.8704vmin;
      .head {
        position: absolute;
        left: 0vmin;
        top: 0vmin;

        font-family: "Rubrica";
        font-size: 2.2222vmin;

        color: #ffffff;
      }
      .deco {
        position: absolute;
        width: 2.4074vmin;
        height: 0.0926vmin;
        background: #00c2ff;
        border-radius: 0.2778vmin;
        top: 2.3148vmin;
        left: 0vmin;
      }
    }
    .colorItems {
      overflow-y: auto;
      position: absolute;
      height: 44.1667vmin;
      width: 19.9074vmin;
    }
  }
}

.fontItems::-webkit-scrollbar {
  width: 0vmin;
}

.fontItems::-webkit-scrollbar-track {
  background-color: #001217;
}

.fontItems::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.fontItems::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}

.colorItems::-webkit-scrollbar {
  width: 0vmin;
}

.colorItems::-webkit-scrollbar-track {
  background-color: #001217;
}

.colorItems::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.colorItems::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>