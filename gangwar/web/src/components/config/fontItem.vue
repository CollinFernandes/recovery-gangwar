<!-- eslint-disable vue/no-mutating-props -->
<template>
  <div class="soundItem">
    <svg
      class="background"
      width="100"
      height="100"
      viewBox="0 0 100 100"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        d="M145.459 98.3296C145.459 127.631 121.705 151.385 92.4037 151.385C63.1019 151.385 39.3481 127.631 39.3481 98.3296C39.3481 69.0279 63.1019 45.2741 92.4037 45.2741C121.705 45.2741 145.459 69.0279 145.459 98.3296Z"
        fill="#0B4356"
        fill-opacity="0.09"
      />
      <path
        d="M154.656 94.0852C154.656 133.154 122.984 164.826 83.9148 164.826C44.8458 164.826 13.1741 133.154 13.1741 94.0852C13.1741 55.0162 44.8458 23.3444 83.9148 23.3444C122.984 23.3444 154.656 55.0162 154.656 94.0852Z"
        fill="#0B4356"
        fill-opacity="0.09"
      />
      <path
        d="M178 95.5C178 148.243 135.243 191 82.5 191C29.7568 191 -13 148.243 -13 95.5C-13 42.7568 29.7568 0 82.5 0C135.243 0 178 42.7568 178 95.5Z"
        fill="#0B4356"
        fill-opacity="0.09"
      />
    </svg>
    <span class="font">{{  data.name }}</span>
    <div
      class="state"
      @click="toggle()"
      :style="{
        background: this.data.state ? '#66FF63' : 'rgba(0, 0, 0, 0.29)',
        boxShadow: this.data.state
          ? '0vmin 0vmin 0.5833vmin rgba(102, 255, 99, 0.5)'
          : '',
      }"
    ></div>
  </div>
</template>
  
  <script>
import { Sound } from "@/Sound";
export default {
  props: {
    data: {
      type: Object,
      required: true,
      default: () => {
        return {
          name: "Rust",
          icon: "images/config/rust.png",
          audio: "rust.ogg",
          state: false,
        };
      },
    },
  },
  data() {
    return {
      soundData: {},
    };
  },
  created() {
    // this.soundData = { ...this.data };
  },
  methods: {
    toggle() {
      this.$emit("toggle", this.data);
      Sound("notification.wav");
    },
    preview() {
      Sound(this.data.audio);
    },
  },
};
</script>
  
  <style lang="scss" scoped>
.soundItem {
  width: 9.2593vmin;
  height: 9.2593vmin;
  position: relative;
  border-radius: 0.3704vmin;
  background: rgba($color: #000000, $alpha: 0.34);
  float: left;
  margin-right: 0.6481vmin;
  margin-bottom: 2.5vmin;
  .background {
    position: absolute;
    width: 9.2593vmin;
    height: 9.2593vmin;
  }
  .font {
    position: absolute;
    left: 0vmin;
    top: 50%;
    font-family: v-bind('data.font');
    transform: translateY(-50%);
    width: 100%;
    font-size: 2.2222vmin;
    text-align: center;
  }
  .play {
    width: 2.1296vmin;
    height: 2.1296vmin;
    position: absolute;
    bottom: 0.2778vmin;
    left: 50%;
    transform: translateX(-50%);
    cursor: pointer;
    opacity: 0.7;
    transition: opacity 0.3s;
    &:hover {
      opacity: 1;
    }
  }
  .state {
    position: absolute;
    width: 1.3889vmin;
    height: 1.3889vmin;
    left: 7.5vmin;
    top: 0.2778vmin;

    background: rgba(0, 0, 0, 0.29);
    border-radius: 0.1852vmin;
    cursor: pointer;
    transition: background 0.3s, box-shadow 0.3s;
  }
}
</style>