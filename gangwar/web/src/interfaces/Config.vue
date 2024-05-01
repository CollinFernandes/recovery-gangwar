<template>
  <transition>
    <div class="config" v-if="showed">
      <img class="background" src="images/configBackground.png" />
      <div class="header">
        <img class="logo" src="images/configLogo.png" />
        <div class="head">
          <span class="recovery">RECOVERY</span>
          <span class="gangwar">GAMECONFIG</span>
        </div>
      </div>
      <div class="navigation">
        <navigationItem
          :text="'BATTLEPASS'"
          @navigate="navigate('battlepassState')"
          :state="battlepassState"
        />
        <navigationItem
          :text="'FFA'"
          @navigate="navigate('ffaState')"
          :state="ffaState"
        />
        <navigationItem
          :text="'WAFFEN'"
          @navigate="navigate('weaponsState')"
          :state="weaponsState"
        />
        <navigationItem
          :text="'HITMARKER'"
          @navigate="navigate('hitmarkerState')"
          :state="hitmarkerState"
        />
        <navigationItem
          :text="'GAMECONFIG'"
          @navigate="navigate('gameconfigState')"
          :state="gameconfigState"
        />
      </div>
      <div class="identifier">
        <div class="info">
          <span class="header">Willkommen zurück,</span>
          <span class="username">{{ username }}</span>
          <div class="group">
            <span class="header"
              >GROUP: <span class="value">DONATOR</span></span
            >
          </div>
        </div>
        <div class="img">
          <img class="ring" src="images/configRing.png" />
          <img class="profile" :src="profilepicture" />
        </div>
      </div>
      <div class="esc">
        <span class="text">X</span>
      </div>
      <div class="pages">
        <battlepass class="page" :showed="battlepassState" />
        <ffa class="page" :showed="ffaState" />
        <weapons class="page" :showed="weaponsState" />
        <hitmarker class="page" :showed="hitmarkerState" />
        <gameconfig class="page" :showed="gameconfigState" />
      </div>
    </div>
  </transition>
</template>

<script>
import navigationItem from "@/components/config/navigationItem.vue";
import battlepass from "@/components/config/pages/battlepass.vue";
import ffa from "@/components/config/pages/ffa.vue";
import weapons from "@/components/config/pages/weapons.vue";
import hitmarker from "@/components/config/pages/hitmarker.vue";
import gameconfig from "@/components/config/pages/gameconfig.vue";
import { Sound } from "@/Sound";
export default {
  data() {
    return {
      battlepassState: false,
      ffaState: false,
      hitmarkerState: false,
      weaponsState: false,
      gameconfigState: true,
    };
  },
  methods: {
    navigate(tab) {
      this.battlepassState = false;
      this.ffaState = false;
      this.hitmarkerState = false;
      this.weaponsState = false;
      this.gameconfigState = false;
      this[tab] = true;
      Sound("notification.wav");
    },
  },
  components: {
    navigationItem,
    battlepass,
    ffa,
    hitmarker,
    weapons,
    gameconfig,
  },
  props: {
    username: {
      type: String,
      required: true,
      default: "Username",
    },
    profilepicture: {
      type: String,
      required: true,
      default:
        "https://cdn.discordapp.com/attachments/1202230750078836736/1220755489764151397/Outfit_gif2_1.png?ex=66101825&is=65fda325&hm=b1f4793d75c7d8cf89a23c2ea071f5b28e2de21525d27529da0e6d97988c5299&",
    },
    showed: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
};
</script>

<style lang="scss" scoped>
.config {
  position: absolute;
  width: 104.537vmin;
  height: 66.3889vmin;
  background: #ffffff;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: linear-gradient(248.03deg, #000a0e 0%, #011d25 100%);
  border-radius: 0.463vmin;
  .page {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  .esc {
    position: absolute;
    width: 2.3148vmin;
    height: 2.3148vmin;
    left: 100.8333vmin;
    top: 1.3889vmin;
    transition: all 0.3s ease;
    cursor: pointer;
    .text {
      position: absolute;
      font-family: "Rubrica";
      font-size: 1.2963vmin;
      color: #ffffff;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
    &:before {
      content: "";
      position: absolute;
      -moz-transition: opacity 0.3s ease;
      -webkit-transition: opacity 0.3s ease;
      background: radial-gradient(
        120% 120% at 50% 50%,
        #222222 0%,
        #ffffff 100%
      );
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: -1;
      border-radius: 0.2778vmin;
    }
    &:hover:before {
      opacity: 0;
    }
    &:after {
      content: "";
      opacity: 0;
      transition: opacity 0.3s ease;
      -moz-transition: opacity 0.3s ease;
      -webkit-transition: opacity 0.3s ease;
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: -1;
      background: radial-gradient(
        120% 120% at 50% 50%,
        #1f0000 0%,
        #ff0000 100%
      );
      border-radius: 0.2778vmin;
    }
    &:hover:after {
      opacity: 1;
    }
  }
  .identifier {
    position: absolute;
    width: 46.4815vmin;
    height: 4.6296vmin;
    left: 1.2037vmin;
    top: 60.463vmin;
    .info {
      width: 41.2963vmin;
      height: 3.3333vmin;
      top: 50%;
      transform: translateY(-50%);
      position: absolute;
      left: 4.9074vmin;
      .header {
        position: absolute;
        font-family: "Akrobat";
        font-size: 1.2963vmin;
        line-height: 1.5741vmin;
        color: #ffffff;
        text-shadow: 0vmin 0vmin 0.3704vmin rgba(255, 255, 255, 0.5);
        left: 0vmin;
        top: 0vmin;
      }
      .username {
        position: absolute;
        font-family: "Akrobat";
        font-size: 1.2963vmin;
        color: #00c2ff;
        text-shadow: 0vmin 0vmin 0.3704vmin rgba(0, 194, 255, 0.5);
        left: 0vmin;
        bottom: 0vmin;
      }
      .group {
        position: absolute;
        width: 36.1111vmin;
        height: 1.5741vmin;
        bottom: 0vmin;
        left: 7.4074vmin;
        .header {
          position: absolute;
          font-family: "Akrobat";
          font-size: 1.2963vmin;
          line-height: 1.5741vmin;
          color: #ffffff;
          text-shadow: 0vmin 0.3704vmin 0.3704vmin rgba(0, 0, 0, 0.25);
        }
        .value {
          color: #ffe500;
          text-shadow: 0vmin 0vmin 0.3704vmin #ffe500;
        }
      }
    }
    .img {
      height: 4.6296vmin;
      width: 4.6296vmin;
      position: absolute;
      left: 0vmin;
      top: 0vmin;
      .ring {
        height: 4.6296vmin;
        width: 4.6296vmin;
        position: absolute;
        left: 0vmin;
        top: 0vmin;
      }
      .profile {
        height: 3.7037vmin;
        width: 3.7037vmin;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        border-radius: 50%;
      }
    }
  }
  .navigation {
    position: absolute;
    width: 40.2778vmin;
    height: 2.3148vmin;
    left: 32.5vmin;
    top: 1.7593vmin;
    .navigate {
      float: left;
      margin-right: 0.3704vmin;
      margin-left: 0.3704vmin;
      position: relative;
      width: 7.3148vmin;
      height: 2.3148vmin;
      cursor: pointer;
      transition: all 0.5s;
      border: none;
      border-radius: 0.2778vmin;
      background: none;
      font-family: "Akrobat";
      font-size: 1.1111vmin;
      line-height: 1.2963vmin;
      color: #ffffff;
    }
    .navigate:before {
      content: "";
      position: absolute;
      -moz-transition: opacity 0.5s;
      -webkit-transition: opacity 0.5s;
      background: radial-gradient(
        120% 120% at 50% 50%,
        #222222 0%,
        #ffffff 100%
      );
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: -1;
      border-radius: 0.463vh;
    }
    .navigate:hover:before {
      opacity: 0;
    }
    .navigate:after {
      content: "";
      opacity: 0;
      transition: opacity 0.5s;
      -moz-transition: opacity 0.5s;
      -webkit-transition: opacity 0.5s;
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: -1;
      background: radial-gradient(
          120% 120% at 50% 50%,
          #00171f 0%,
          #00c2ff 100%
        ),
        radial-gradient(120% 120% at 50% 50%, #222222 0%, #ffffff 100%);
      border-radius: 0.463vh;
    }
    .navigate:hover:after {
      opacity: 1;
    }
  }
  .background {
    position: absolute;
    width: 104.537vmin;
    height: 66.3889vmin;
  }
  .header {
    position: absolute;
    width: 12.037vmin;
    height: 2.8574vmin;
    left: 1.4815vmin;
    top: 1.2037vmin;
    .logo {
      position: absolute;
      top: 0vmin;
      left: 0vmin;
      width: 3.3333vmin;
      height: 2.8574vmin;
    }
    .head {
      position: absolute;
      width: 7.963vmin;
      height: 2.3148vmin;
      top: 50%;
      transform: translateY(-50%);
      left: 4.0741vmin;
      .recovery {
        position: absolute;

        font-family: "Rubrica";
        font-size: 1.2963vmin;
        top: 0vmin;
        left: 0vmin;
      }
      .gangwar {
        position: absolute;
        top: 0.463vmin;
        left: 0.7407vmin;
        font-family: "Brothership";
        font-size: 1.2963vmin;
        line-height: 2.3148vmin;
        color: #00c2ff;
        text-shadow: 0vmin 0vmin 0.3704vmin #000000;
      }
    }
  }
}
</style>