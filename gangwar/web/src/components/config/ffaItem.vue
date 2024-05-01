<template>
  <div class="ffaItem">
    <img class="zoneIcon" src="images/ffa/church.png" />
    <div class="info">
      <div class="player">
        <span class="header">PLAYER</span>
        <span class="header1">PLAYER</span>
        <div class="count">
          <span class="current">23<span class="max">/30</span></span>
        </div>
      </div>
      <div class="mode">
        <span class="header">WAFFEN</span>
        <span class="header1">WAFFEN</span>
        <div class="count">
          <span class="current">ALL <span class="asd">WEAPONS</span></span>
        </div>
      </div>
    </div>

    <svg
      class="background"
      width="127"
      height="189"
      viewBox="0 0 127 189"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        d="M62.5077 175.067L39.4611 188.236C39.159 188.409 38.8169 188.5 38.4689 188.5H3C1.89543 188.5 1 187.605 1 186.5V3C1 1.89543 1.89543 1 3 1H124C125.105 1 126 1.89543 126 3V186.5C126 187.605 125.105 188.5 124 188.5H88.5311C88.1831 188.5 87.841 188.409 87.5388 188.236L64.4923 175.067C63.8774 174.716 63.1226 174.716 62.5077 175.067Z"
        fill="url(#paint0_linear_275_848)"
        fill-opacity="0.25"
        stroke="url(#paint1_linear_275_848)"
        stroke-width="0.5"
      />
      <defs>
        <linearGradient
          id="paint0_linear_275_848"
          x1="63.5"
          y1="1"
          x2="63.5"
          y2="188.5"
          gradientUnits="userSpaceOnUse"
        >
          <stop stop-color="#00C2FF" stop-opacity="0" />
          <stop offset="1" stop-color="#00C2FF" />
        </linearGradient>
        <linearGradient
          id="paint1_linear_275_848"
          x1="63.5"
          y1="1"
          x2="63.5"
          y2="188.5"
          gradientUnits="userSpaceOnUse"
        >
          <stop stop-color="#00C2FF" />
          <stop offset="0.78" stop-color="#00C2FF" stop-opacity="0" />
        </linearGradient>
      </defs>
    </svg>
    <svg
      @mouseenter="opacity = 1"
      @mouseleave="opacity = 0.5"
      @click="join()"
      class="join"
      width="49"
      height="50"
      viewBox="0 0 49 50"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path
        d="M24.5 0.5L45.7176 12.75V37.25L24.5 49.5L3.28238 37.25V12.75L24.5 0.5Z"
        fill="white"
        fill-opacity="0.05"
      />
      <path
        d="M22.2 7.28979C23.6232 6.46807 25.3768 6.46807 26.8 7.28979L38.6875 14.153C40.1107 14.9747 40.9875 16.4933 40.9875 18.1368V31.8632C40.9875 33.5067 40.1107 35.0253 38.6875 35.847L26.8 42.7102C25.3768 43.5319 23.6232 43.5319 22.2 42.7102L10.3125 35.847C8.88926 35.0253 8.01251 33.5067 8.01251 31.8632V18.1368C8.01251 16.4933 8.88926 14.9747 10.3125 14.153L22.2 7.28979Z"
        fill="url(#paint0_linear_418_15)"
        fill-opacity="0.5"
        stroke="url(#paint1_linear_418_15)"
        stroke-width="0.8"
      />
      <path
        d="M29 30.5C28.38 30.5 27.7913 30.4093 27.234 30.228C26.6767 30.0467 26.164 29.7893 25.696 29.456C26.372 28.7227 26.9057 27.9363 27.297 27.097C27.689 26.2577 27.885 25.392 27.885 24.5C27.885 23.608 27.689 22.7423 27.297 21.903C26.9057 21.0637 26.3723 20.2773 25.697 19.544C26.1643 19.2107 26.6767 18.9533 27.234 18.772C27.7907 18.5907 28.3793 18.5 29 18.5C30.668 18.5 32.085 19.083 33.251 20.249C34.417 21.4157 35 22.8327 35 24.5C35 26.168 34.417 27.585 33.251 28.751C32.0843 29.917 30.6673 30.5 29 30.5ZM25 28.942C24.378 28.3987 23.8893 27.7453 23.534 26.982C23.178 26.22 23 25.3927 23 24.5C23 23.608 23.178 22.7803 23.534 22.017C23.8893 21.2543 24.378 20.601 25 20.057C25.622 20.601 26.1107 21.2543 26.466 22.017C26.822 22.7803 27 23.608 27 24.5C27 25.392 26.822 26.2197 26.466 26.983C26.1107 27.7457 25.622 28.399 25 28.943M21 30.5C19.332 30.5 17.915 29.917 16.749 28.751C15.583 27.5843 15 26.1673 15 24.5C15 22.832 15.583 21.415 16.749 20.249C17.9157 19.083 19.3327 18.5 21 18.5C21.62 18.5 22.2087 18.5907 22.766 18.772C23.3233 18.9533 23.836 19.2107 24.304 19.544C23.628 20.2773 23.0943 21.0637 22.703 21.903C22.311 22.7423 22.115 23.608 22.115 24.5C22.115 25.496 22.3057 26.4187 22.687 27.268C23.069 28.1173 23.594 28.857 24.262 29.487C23.7973 29.8163 23.2887 30.0673 22.736 30.24C22.1827 30.4133 21.604 30.5 21 30.5Z"
        fill="white"
      />
      <defs>
        <linearGradient
          id="paint0_linear_418_15"
          x1="24.5"
          y1="5.5"
          x2="24.5"
          y2="44.5"
          gradientUnits="userSpaceOnUse"
        >
          <stop stop-color="#00C2FF" stop-opacity="0" />
          <stop offset="1" stop-color="#00C2FF" />
        </linearGradient>
        <linearGradient
          id="paint1_linear_418_15"
          x1="24.5"
          y1="5.5"
          x2="24.5"
          y2="44.5"
          gradientUnits="userSpaceOnUse"
        >
          <stop offset="0.210239" stop-color="#00C2FF" stop-opacity="0" />
          <stop offset="1" stop-color="#00C2FF" />
        </linearGradient>
      </defs>
    </svg>
  </div>
</template>

<script>
import { Sound } from '@/Sound'

export default {
  data() {
    return {
      opacity: 0.5,
    };
  },
  methods: {
    join() {
      Sound('notification.wav')
    }
  }
};
</script>

<style lang="scss" scoped>
.ffaItem {
  float: left;
  margin-right: 0.6944vmin;
  margin-left: 0.6944vmin;
  margin-bottom: 1.2963vmin;
  margin-top: 0.7407vmin;
  position: relative;
  width: 11.7593vmin;
  height: 20.787vmin;
  .info {
    width: 9.7222vmin;
    height: 2.1296vmin;
    position: absolute;
    top: 11.8519vmin;
    left: 50%;
    transform: translateX(-50%);
    .mode {
      width: 3.0556vmin;
      height: 2.1296vmin;
      right: 0vmin;
      top: 0vmin;
      position: absolute;
      .header {
        position: absolute;
        font-family: "Rubrica";
        font-size: 0.9259vmin;
        color: #ffffff;
        left: 0vmin;
        top: 0vmin;
      }
      .header1 {
        position: absolute;
        font-family: "Jarvitts";
        font-size: 0.9259vmin;
        color: #00c2ff;
        right: 0.0926vmin;
        top: 0vmin;
      }
      .count {
        position: absolute;
        width: 3.0556vmin;
        height: 1.0185vmin;
        bottom: 0vmin;
        left: 0vmin;
        background: rgba(255, 255, 255, 0.08);
        backdrop-filter: blur(1.0046vmin);
        border-radius: 0.0926vmin;
        .current {
          position: absolute;
          width: 100%;
          top: 0.1852vmin;
          text-align: center;

          font-family: "Akrobat";
          font-size: 0.5556vmin;
          color: #00c2ff;
        }
        .asd {
          color: white;
        }
      }
    }
    .player {
      width: 3.0556vmin;
      height: 2.1296vmin;
      left: 0vmin;
      top: 0vmin;
      position: absolute;
      .header {
        position: absolute;
        font-family: "Rubrica";
        font-size: 0.9259vmin;
        color: #ffffff;
        left: 0vmin;
        top: 0vmin;
      }
      .header1 {
        position: absolute;
        font-family: "Jarvitts";
        font-size: 0.9259vmin;
        color: #00c2ff;
        right: 0.0926vmin;
        top: 0vmin;
      }
      .count {
        position: absolute;
        width: 3.0556vmin;
        height: 1.0185vmin;
        bottom: 0vmin;
        left: 0vmin;
        background: rgba(255, 255, 255, 0.08);
        backdrop-filter: blur(1.0046vmin);
        border-radius: 0.0926vmin;
        .current {
          position: absolute;
          width: 100%;
          text-align: center;

          font-family: "Akrobat";
          font-size: 0.6481vmin;
          line-height: 0.7407vmin;
          color: #00c2ff;
        }
        .max {
          color: white;
        }
      }
    }
  }
  .zoneIcon {
    position: absolute;
    object-fit: cover;
    width: 11.1111vmin;
    height: 10.3704vmin;
    border-radius: 0.6481vmin;
    top: 0.2778vmin;
    left: 50%;
    transform: translateX(-50%);
  }
  .join {
    position: absolute;
    width: 4.537vmin;
    height: 4.6296vmin;
    left: 50%;
    transform: translateX(-50%);
    bottom: -0.2778vmin;
    opacity: v-bind(opacity);
    transition: all 0.2s ease;
    cursor: pointer;
  }
  .background {
    position: absolute;
    top: 0vmin;
    left: 0vmin;
    width: 11.7593vmin;
    height: 17.5vmin;
  }
}
</style>