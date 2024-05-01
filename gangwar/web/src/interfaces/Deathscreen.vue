<template>
  <transition>
    <div class="deathscreen" v-if="showed">
      <img class="pattern" src="images/deathscreenPattern.png" />
      <div class="circle">
        <img class="rotating" src="images/circle.png" />
        <img class="logo" src="images/logo.png" />
      </div>
      <div class="health">
        <span class="header">ENEMY HP</span>
        <div class="hp">
          <img class="maxhp" src="images/health.png" />
          <img class="hadhp" src="images/health2.png" />
        </div>
        <div class="armor">
          <img class="maxarmor" src="images/armor.png" />
          <img class="hadarmor" src="images/armor2.png" />
        </div>
      </div>
      <div class="text">
        <span class="span"
          >DU WURDEST VON <br /><span class="name">{{ data.name }}</span
          ><br />GEKILLT</span
        >
      </div>
    </div>
  </transition>
</template>
  
  <script>
export default {
  props: {
    showed: {
      type: Boolean,
      required: true,
    },
    data: {
      type: Object,
      required: true,
    },
  },
};
</script>
  
  <style lang="scss" scoped>
.deathscreen {
  height: 99.96%;
  width: 100%;
  top: 0vh;
  left: 0vh;
  position: absolute;
  background: linear-gradient(
    251.97deg,
    rgba(0, 9, 12, 0.95) 0%,
    rgba(0, 18, 23, 0.95) 100%
  );
  .pattern {
    position: absolute;
    width: 100%;
    height: 100%;
  }
  .circle {
    width: 223px;
    height: 223px;
    top: 50%;
    left: 50%;
    position: absolute;
    transform: translate(-50%, -50%);
    .rotating {
      width: 223px;
      height: 223px;
      position: absolute;
      animation: l6 3s infinite;
      aspect-ratio: 1;
    }
    .logo {
      width: 65px;
      height: 55.6px;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
  }
  .health {
    position: absolute;
    width: 151.5px;
    height: 37.5px;
    left: 884px;
    top: 343px;
    .header {
      width: 100%;
      text-align: center;
      position: absolute;
      font-family: "Rubrica";
      font-size: 14px;
      color: #00c2ff;
    }
    .hp {
      width: 74.5px;
      height: 19.5px;
      position: relative;
      top: 18px;
      left: 0px;
      .maxhp {
        position: absolute;
        width: 74.5px;
        height: 19.5px;
      }
      .hadhp {
        position: absolute;
        object-fit: cover;
        object-position: 25% 25%;
        width: v-bind("data.hp");
        height: 19.5px;
      }
    }
    .armor {
      width: 74.5px;
      height: 19.5px;
      position: relative;
      top: -1px;
      left: 77px;
      .maxarmor {
        position: absolute;
        width: 74.5px;
        height: 19.5px;
      }
      .hadarmor {
        position: absolute;
        object-fit: cover;
        object-position: 25% 25%;
        width: v-bind("data.armor");
        height: 19.5px;
      }
    }
  }
  .text {
    position: absolute;
    width: 1920px;
    height: 134px;
    left: 50%;
    transform: translate(-50%, 0%);
    top: 675px;
    text-align: center;
    .span {
      position: absolute;
      width: 100%;
      left: 0px;
      text-align: center;
      font-family: "Rubrica";
      font-size: 36px;
      color: #ffffff;
      .name {
        font-family: "Brothership";
        font-size: 48px;
        text-align: center;
        color: #00c2ff;
        text-transform: uppercase;
      }
    }
  }
}

@keyframes l6 {
  to {
    transform: rotate(1turn);
  }
}
</style>