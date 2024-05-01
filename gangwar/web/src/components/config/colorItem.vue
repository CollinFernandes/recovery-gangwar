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
    <svg
      class="icon"
      width="35"
      height="35"
      viewBox="0 0 35 35"
      xmlns="http://www.w3.org/2000/svg"
    >
      <circle cx="17.5" cy="17.5" r="12.5" fill="#FF0000" />
      <path
        d="M33.4005 17.5C34.2839 17.5 35.0076 16.7824 34.927 15.9027C34.6853 13.2659 33.8476 10.711 32.4687 8.43426C30.8129 5.70022 28.4398 3.47191 25.6071 1.99114C22.7744 0.510377 19.5903 -0.166284 16.4002 0.0345922C13.2102 0.235468 10.136 1.30621 7.51147 3.13062C4.8869 4.95502 2.81213 7.46341 1.51231 10.3836C0.212489 13.3037 -0.262726 16.5241 0.138232 19.6952C0.53919 22.8664 1.80101 25.8671 3.78675 28.3718C5.44033 30.4576 7.54331 32.133 9.93063 33.2783C10.7271 33.6604 11.6519 33.2321 11.9597 32.4041C12.2675 31.5761 11.8405 30.6632 11.052 30.2649C9.20922 29.3341 7.5839 28.0122 6.29348 26.3845C4.67073 24.3376 3.63957 21.8854 3.3119 19.2939C2.98424 16.7025 3.37259 14.0708 4.4348 11.6844C5.49702 9.29806 7.19253 7.2482 9.33734 5.75729C11.4821 4.26638 13.9943 3.39136 16.6012 3.22721C19.2082 3.06305 21.8103 3.61602 24.1252 4.82611C26.4401 6.03619 28.3793 7.85718 29.7325 10.0914C30.8085 11.8681 31.4813 13.8522 31.7117 15.9038C31.8103 16.7817 32.5172 17.5 33.4005 17.5Z"
        fill="#FF0000"
        fill-opacity="0.29"
      />
      <path
        d="M27.052 30.4371C27.5174 31.0674 28.41 31.2053 29.0006 30.6904C29.0574 30.6408 29.114 30.5909 29.1702 30.5406C29.7541 30.0181 29.7274 29.1152 29.1593 28.5756L29.0613 28.4825C28.5474 27.9943 27.7385 28.02 27.2072 28.4892C26.6759 28.9585 26.5507 29.7581 26.9717 30.3283L27.052 30.4371Z"
        fill="#FF0000"
      />
      <path
        d="M22.9293 32.6371C23.1938 33.3746 24.0091 33.7633 24.7228 33.4399C24.7915 33.4088 24.86 33.3772 24.9283 33.3452C25.6378 33.0126 25.8718 32.1402 25.4828 31.4601L25.4157 31.3427C25.0638 30.7274 24.2817 30.5194 23.638 30.8161C22.9942 31.1128 22.6444 31.8426 22.8837 32.5098L22.9293 32.6371Z"
        fill="#FF0000"
      />
      <path
        d="M30.4527 27.0308C31.0838 27.4952 31.9772 27.3627 32.389 26.6961C32.4286 26.6319 32.4678 26.5675 32.5067 26.5028C32.9097 25.8309 32.6171 24.9764 31.9147 24.6291L31.7936 24.5692C31.1582 24.2549 30.3931 24.5188 30.0245 25.1243C29.6559 25.7298 29.7729 26.5306 30.3438 26.9507L30.4527 27.0308Z"
        fill="#FF0000"
      />
    </svg>
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
  .icon {
    width: 3.2407vmin;
    height: 3.2407vmin;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    object-fit: contain;
    fill: v-bind('data.color');
    circle {
        fill: v-bind('data.color');
    }
    path {
        fill: v-bind('data.color');
    }
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