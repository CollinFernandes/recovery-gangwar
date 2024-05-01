<template>
  <div class="component" @click="changeStatus()">
    <div
      class="status"
      :style="{
        background: this.component.state ? '#66FF63' : 'rgba(0, 0, 0, 0.29)',
        boxShadow: this.component.state
          ? '0vmin 0vmin 0.5833vmin rgba(102, 255, 99, 0.5)'
          : '',
      }"
    ></div>
    <span class="name">{{ component.name }}</span>
  </div>
</template>

<script>
import { Sound } from "@/Sound";
export default {
  name: "component",
  props: {
    component: {
      type: Object,
      required: true,
    },
  },
  methods: {
    changeStatus() {
      Sound("notification.wav")
      this.$emit("toggle", this.component.name);
    },
  },
};
</script>

<style lang="scss" scoped>
.component {
  cursor: pointer;
  position: relative;
  display: inline-block;
  width: 5.7037vmin;
  height: 1.1111vmin;
  margin-right: 0.1852vmin;
  margin-left: 0.1852vmin;
  margin-bottom: 0.3704vmin;
  background: rgba($color: #000000, $alpha: 0.29);
  border-radius: 0.1852vmin;
  .name {
    position: absolute;
    left: 1.4815vmin;
    top: 0.1296vmin;

    font-family: "Akrobat";
    font-size: 0.7407vmin;
    line-height: 0.9259vmin;

    color: #ffffff;
  }
  .status {
    width: 0.9259vmin;
    height: 0.9259vmin;
    left: 0.1852vmin;
    position: absolute;
    top: 0.1852vmin;
    border-radius: 0.1852vmin;
    transition: background 0.3s, box-shadow 0.3s;
  }
}
</style>