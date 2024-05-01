<template>
  <!-- <div class="item" @click="click()" :style="{ background: state ? 'radial-gradient(120% 120% at 50% 50%, #00171F 0%, #00C2FF 100%)' : ''  }">
    <span class="text">{{ text }}</span>
  </div> -->
  <div class="item" @click="click()">
    <span class="text">{{ text }}</span>
  </div>
</template>

<script>
import Vue from "vue"; // Add the missing import statement

export default {
  name: "NavigationItem",
  props: {
    text: {
      type: String,
      required: true,
    },
    state: {
      type: Boolean,
      required: true,
    },
  },
  methods: {
    click() {
      this.$emit("navigate", this.text);
    },
  },
};
</script>

<style lang="scss" scoped>
.item {
  float: left;
  margin-right: 0.3704vmin;
  margin-left: 0.3704vmin;
  position: relative;
  width: 7.3148vmin;
  height: 2.3148vmin;
  cursor: pointer;
  transition: all 0.3s ease;
  border-radius: 0.2778vmin;
  // &:before {
  //   content: "";
  //   position: absolute;
  //   -moz-transition: opacity 0.2s;
  //   -webkit-transition: opacity 0.2s;
  //   background: radial-gradient(120% 120% at 50% 50%, #222222 0%, #ffffff 100%);
  //   top: 0;
  //   left: 0;
  //   right: 0;
  //   bottom: 0;
  //   z-index: -1;
  //   border-radius: 0.2778vmin;
  // }
  // &:hover:before {
  //   opacity: 0;
  // }
  // &:after {
  //   content: "";
  //   opacity: 0;
  //   transition: opacity 0.2s;
  //   -moz-transition: opacity 0.2s;
  //   -webkit-transition: opacity 0.2s;
  //   position: absolute;
  //   top: 0;
  //   left: 0;
  //   right: 0;
  //   bottom: 0;
  //   z-index: -1;
  //   background: radial-gradient(120% 120% at 50% 50%, #00171f 0%, #00c2ff 100%),
  //     radial-gradient(120% 120% at 50% 50%, #222222 0%, #ffffff 100%);
  //   border-radius: 0.2778vmin;
  // }
  // &:hover:after {
  //   opacity: 1;
  // }
  .text {
    position: absolute;
    font-family: "Akrobat";
    font-size: 1.1111vmin;
    line-height: 1.2963vmin;
    text-align: center;
    color: #ffffff;
    width: 100%;
    top: 45%;
    transform: translateY(-50%);
  }
}
</style>