<template>
  <div class="frakpickitem">
    <div class="top">
      <div class="frakbg">
        <div class="frakbghover">
          <img src="images/frakbg.png" class="frakbgimg" />
            <img :src="icon" class="fraklogo" />
          <div class="playerCount">
            <img src="images/reddot.png" />
            <div class="players">
              <span class="red"
                >{{ players.current }}/<span class="white">{{
                  players.max
                }}</span></span
              >
            </div>
          </div>
        </div>
      </div>
    </div>
    <button
      @mouseenter="opacity = 1"
      @mouseleave="opacity = 0.5"
      @click="select"
      class="join"
    >
      BETRETEN
    </button>
  </div>
</template>

<script>
export default {
  name: "Frakitem",
  methods: {
    select() {
      this.$emit("select", this.name);
    },
  },
  data() {
    return {
      opacity: 0.5,
    };
  },
  props: {
    colors: {
      type: Object,
      required: true,
      default() {
        return {
          firstcolor: "#FFF",
          secondcolor: "#000",
        };
      },
    },
    name: {
      type: String,
      required: true,
      default: "placeholder",
    },
    players: {
      type: Object,
      required: true,
      default() {
        return {
          max: 10,
          current: 5,
        };
      },
    },
    icon: {
      type: String,
      required: true,
      default: "images/factions/bloods.png",
    },
  },
};
</script>

<style lang="scss" scoped>
.frakpickitem {
  position: relative;
  float: left;
  margin-right: 0.9722vh;
  margin-left: 0.9722vh;
  border-radius: 0.463vh;
  margin-bottom: 5.6481vh;
  height: 28.3333vh;
  width: 24.7222vh;
  .top {
    height: 23.2407vh;
    width: 100%;
    .frakbg {
      height: 23.2407vh;
      width: 24.7222vh;
      position: absolute;
      background-color: black;
      border-radius: 0.463vh;
      .frakbghover {
        opacity: v-bind("opacity");
        transition: all 0.5s;
        .frakbgimg {
          height: 23.2407vh;
          width: 24.7222vh;
        }
        .fraklogo {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          height: 15.6481vh;
          width: 15.6481vh;
        }
        .frakbgimg {
          border-radius: 0.463vh;
        }
        .playerCount {
          position: absolute;
          width: 55px;
          height: 23px;
          left: 9px;
          bottom: 10px;

          background: radial-gradient(
            55.49% 55.49% at 50% 50%,
            rgba(255, 255, 255, 0.025) 0%,
            rgba(255, 255, 255, 0.125) 100%
          );
          backdrop-filter: blur(5.55px);
          border-radius: 11.5px;
          img {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            height: 18px;
            width: 18px;
            left: 2px;
          }
          .players {
            position: absolute;
            top: 53%;
            left: 61%;
            transform: translate(-50%, -50%);
            span {
              font-size: 15px;
              font-family: "Rubrica";
            }
            .red {
              color: red;
            }
            .white {
              color: white;
            }
          }
        }
      }
    }
  }
  .join {
    box-sizing: border-box;
    transition: all 0.5s;

    background: none;
    position: absolute;
    width: 24.7222vh;
    height: 4.6296vh;
    top: 23.7037vh;
    left: 0vh;
    font-family: "Rubrica";
    text-shadow: 0vh 0vh 1.6852vh #000000;
    font-size: 3.3333vh;
    color: #ffffff;
    line-height: 4.2593vh;
    font-weight: 400;
    border: none;
    cursor: pointer;
    &:hover ~ .frakbg .frakbghover {
      opacity: 1;
    }
  }
  .join:before {
    content: "";
    position: absolute;
    -moz-transition: opacity 0.5s;
    -webkit-transition: opacity 0.5s;
    background: radial-gradient(
      93.22% 93.22% at 50% 50%,
      #ffffff 0%,
      #000000 100%
    );
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: -1;
    border-radius: 0.463vh;
  }
  .join:hover:before {
    opacity: 0;
  }
  .join:after {
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
      93.22% 93.22% at 50% 50%,
      v-bind("colors.firstcolor") 0%,
      v-bind("colors.secondcolor") 100%
    );
    border-radius: 0.463vh;
  }
  .join:hover:after {
    opacity: 1;
  }
}
</style>