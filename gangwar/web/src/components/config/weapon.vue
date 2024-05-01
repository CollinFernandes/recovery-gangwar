<!-- eslint-disable vue/require-component-is -->
<template>
  <div class="item">
    <div class="weapon">
      <svg
        class="pattern"
        width="140"
        height="107"
        viewBox="0 0 140 107"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M228.148 121.574C228.148 163.763 193.948 197.963 151.759 197.963C109.571 197.963 75.3704 163.763 75.3704 121.574C75.3704 79.3857 109.571 45.1852 151.759 45.1852C193.948 45.1852 228.148 79.3857 228.148 121.574Z"
          fill="#0B4356"
          fill-opacity="0.09"
        />
        <path
          d="M241.389 115.463C241.389 171.714 195.788 217.315 139.537 217.315C83.2858 217.315 37.6852 171.714 37.6852 115.463C37.6852 59.2117 83.2858 13.6111 139.537 13.6111C195.788 13.6111 241.389 59.2117 241.389 115.463Z"
          fill="#0B4356"
          fill-opacity="0.09"
        />
        <path
          d="M275 117.5C275 193.439 213.439 255 137.5 255C61.5608 255 0 193.439 0 117.5C0 41.5608 61.5608 -20 137.5 -20C213.439 -20 275 41.5608 275 117.5Z"
          fill="#0B4356"
          fill-opacity="0.09"
        />
      </svg>

      <span class="name">SPEZIALKARABINER MK2</span>
      <img class="image" :src="weapon.image" />
      <!-- <img
        class="customize"
        src="images/weaponCustomize.png"
        @click="expand()"
      /> -->
    </div>
    <div class="components">
      <weaponComponent
        class="component"
        v-for="(component, index) in weapon.components"
        :key="index"
        :component="component"
        @toggle="toggleComponent"
      />
    </div>
  </div>
</template>

<script>
import weaponComponent from "@/components/config/component.vue";
export default {
  data() {
    return {};
  },
  props: {
    weapon: {
      type: Object,
      required: true,
    },
  },
  methods: {
    toggleComponent(name) {
      this.weapon.components.forEach((component) => {
        if (component.name === name) {
          component.state = !component.state;
        }
      });
    },
  },
  components: {
    weaponComponent,
  },
};
</script>

<style lang="scss" scoped>
.item {
  float: left;
  margin-right: 0.7407vmin;
  margin-left: 0.7407vmin;
  margin-bottom: 0.7407vmin;
  position: relative;
  width: 18.2407vmin;
  height: 12.037vmin;
  .weapon {
    width: 18.2407vmin;
    height: 9.9074vmin;
    background: #000a0d;
    border-radius: 0.2778vmin;
    transition: height 0.2s;
    .customize {
      position: absolute;
      width: 1.1111vmin;
      height: 1.1046vmin;
      left: 16.5741vmin;
      top: 8.1481vmin;
      opacity: 0.7;
      cursor: pointer;
      transition: opacity 0.2s;
      &:hover {
        opacity: 1;
      }
    }
    .pattern {
      position: absolute;
      width: 100%;
      height: 9.9074vmin;
      top: 0vmin;
    }
    .name {
      position: absolute;
      left: 0.3704vmin;
      top: 0.3704vmin;

      font-family: "Akrobat";
      font-size: 0.9259vmin;
      line-height: 1.1111vmin;
      color: #00c2ff;
      text-shadow: 0vmin 0vmin 0.5556vmin #00c2ff;
    }
    .image {
      position: absolute;
      width: 10.463vmin;
      height: 3.8889vmin;
      object-fit: contain;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
    }
  }
  .components {
    overflow: hidden;
    white-space: nowrap;
    overflow-y: hidden;
    overflow-x: auto;
    position: absolute;
    width: 99.2%;
    bottom: 0.3704vmin;
    height: 1.4815vmin;
  }
}

.components::-webkit-scrollbar {
  height: 0.1852vmin;
}

.components::-webkit-scrollbar-track {
  background-color: #001217;
}

.components::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.components::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>