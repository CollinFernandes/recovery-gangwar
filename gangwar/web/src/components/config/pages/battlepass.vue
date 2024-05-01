<template>
  <transition>
    <div class="battlepass" v-if="showed">
      <span class="title">BATTLEPASS</span>
      <div class="freeItems">
        <battlepassItem
          v-for="(item, index) in freeItems"
          :data="item"
          :key="index"
        />
      </div>
      <div class="premiumItems">
        <battlepassItem
          v-for="(item, index) in premiumItems"
          :data="item"
          :key="index"
        />
      </div>
    </div>
  </transition>
</template>

<script>
import battlepassItem from "@/components/config/battlepassItem.vue";

export default {
  components: {
    battlepassItem,
  },
  props: {
    showed: {
        type: Boolean,
        required: true,
        default: false,
    }
  },
  data() {
    return {
      freeItems: [
        {
          level: 1,
          type: "FREE",
          name: "WEAPON_PISTOL",
          icon: "images/weapons/weapon_pistol.png",
        },
      ],
      premiumItems: [
        {
          level: 1,
          type: "PREMIUM",
          name: "WEAPON_PISTOL",
          icon: "images/weapons/weapon_pistol.png",
        },
        {
          level: 2,
          type: "PREMIUM",
          name: "WEAPON_PISTOL",
          icon: "images/weapons/weapon_pistol.png",
        },
        {
          level: 3,
          type: "PREMIUM",
          name: "WEAPON_PISTOL",
          icon: "images/weapons/weapon_pistol.png",
        },
        {
          level: 4,
          type: "PREMIUM",
          name: "WEAPON_PISTOL",
          icon: "images/weapons/weapon_pistol.png",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
.battlepass {
  width: 93.0556vmin;
  height: 48.6111vmin;
  background: rgba($color: #000000, $alpha: 0.24);
  border-radius: 0.6481vmin;
  .freeItems {
    position: absolute;
    width: 85.5556vmin;
    height: 13.4722vmin;
    left: 3.7963vmin;
    top: 7.963vmin;
    overflow: hidden;
    white-space: nowrap;
    overflow-y: hidden;
    overflow-x: auto;
  }
  .premiumItems {
    position: absolute;
    width: 85.5556vmin;
    height: 13.4722vmin;
    left: 3.7963vmin;
    top: 26.4815vmin;
    overflow: hidden;
    white-space: nowrap;
    overflow-y: hidden;
    overflow-x: auto;
  }
  .title {
    position: absolute;
    font-family: "Brothership";
    font-size: 2.2222vmin;
    top: 1.5741vmin;
    left: 1.6667vmin;
    line-height: 3.1481vmin;

    background: radial-gradient(50% 50% at 50% 50%, #00c2ff 0%, #007499 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-fill-color: transparent;

    -webkit-text-stroke: 0.0463vmin #00c2ff;
    text-stroke: 0.0463vmin #00c2ff;
  }
}

.freeItems::-webkit-scrollbar {
  height: 0.1852vmin;
}

.freeItems::-webkit-scrollbar-track {
  background-color: #001217;
}

.freeItems::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.freeItems::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}

.premiumItems::-webkit-scrollbar {
  height: 0.1852vmin;
}

.premiumItems::-webkit-scrollbar-track {
  background-color: #001217;
}

.premiumItems::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.premiumItems::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>