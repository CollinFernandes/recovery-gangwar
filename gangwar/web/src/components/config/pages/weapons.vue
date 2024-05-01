<template>
  <transition>
    <div class="weapons" v-if="showed">
      <span class="header">WAFFEN</span>
      <div class="weaponsContainer">
        <weapon
          v-for="(weapon, index) in weapons"
          :key="index"
          :weapon="weapon"
        />
      </div>
    </div>
  </transition>
</template>

<script>
import weapon from "@/components/config/weapon.vue";
export default {
  components: {
    weapon,
  },
  props: {
    showed: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  data() {
    return {
      weapons: [
        {
          name: "SPEZIALKARABINER MK2",
          image: "images/weapons/weapon_pistol.png",
          components: [
            {
              name: "COMPRESSOR",
              state: false,
            },
            {
              name: "BREMSE",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
          ],
        },
        {
          name: "SPEZIALKARABINER MK2",
          image: "images/weapons/weapon_pistol.png",
          components: [
            {
              name: "COMPRESSOR",
              state: false,
            },
            {
              name: "BREMSE",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
          ],
        },
        {
          name: "SPEZIALKARABINER MK2",
          image: "images/weapons/weapon_specialcarbine_mk2.png",
          components: [
            {
              name: "COMPRESSOR",
              state: false,
            },
            {
              name: "BREMSE",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
          ],
        },
        {
          name: "SPEZIALKARABINER MK2",
          image: "images/weapons/weapon_pistol.png",
          components: [
            {
              name: "COMPRESSOR",
              state: false,
            },
            {
              name: "BREMSE",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
          ],
        },
        {
          name: "SPEZIALKARABINER MK2",
          image: "images/weapons/weapon_pistol.png",
          components: [
            {
              name: "COMPRESSOR",
              state: false,
            },
            {
              name: "BREMSE",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
            {
              name: "LASER",
              state: false,
            },
          ],
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
.weapons {
  width: 93.0556vmin;
  height: 48.6111vmin;
  background: rgba($color: #000000, $alpha: 0.24);
  .header {
    position: absolute;
    font-family: "Brothership";
    font-size: 2.2222vmin;
    top: 1.5741vmin;
    left: 1.6667vmin;
    width: 7.8704vmin;
    line-height: 3.1481vmin;

    background: radial-gradient(50% 50% at 50% 50%, #00c2ff 0%, #007499 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-fill-color: transparent;

    -webkit-text-stroke: 0.0463vmin #00c2ff;
    text-stroke: 0.0463vmin #00c2ff;
  }
  .weaponsContainer {
    width: 78.8889vmin;
    height: 37.3148vmin;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    position: absolute;
  }
}
</style>