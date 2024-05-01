<template>
  <div class="loadingscreen">
    <img class="pattern" src="images/loadingPattern.png" />
    <div class="center">
      <img class="gangwar" src="images/loadingBackground.svg" />
      <span class="recovery">RECOVERY</span>
    </div>
    <div class="loading">
      <div class="bar">
        <img class="outline" src="images/loadingOutline.png" />
        <div class="progress">
          <div class="maxProgress"></div>
          <div class="curProgress" :style="{ width: progress }"></div>
        </div>
      </div>
      <span class="loadingText">LOADING...</span>
      <span class="progress">{{ progress }}</span>
    </div>
    <div class="music">
      <span class="title">{{ songTitle }}</span>
      <img
        class="previous"
        src="images/loadingPrevious.png"
        @click="previous()"
      />
      <img class="next" src="images/loadingNext.png" @click="next()" />
      <img class="play" src="images/loadingPlay.png" @click="toggle()" />
    </div>
  </div>
</template>

<script>
import { addNuiListener } from "@/utils";

const Songs = [
  {
    source: "songs/hab.mp3",
    label: "H.A.B. - YEAT",
  },
  {
    source: "songs/time passed.mp3",
    label: "TIME PASSED - YEAT",
  },
];
var song;
var songIndex = 0;
var Volume = 0.05;

export default {
  props: {
    loadingscreenState: Boolean,
  },
  data() {
    return {
      songTitle: "BAMBA - LUCIANO",
      progress: '50%',
      percent: '0%',
    };
  },
  methods: {
    play() {
      if (song) song.pause();
      song = new Audio();
      song.src = Songs[songIndex].source;
      song.play();
      song.volume = Volume;
      this.songTitle = Songs[songIndex].label;
    },
    toggle() {
      if (song.paused) {
        song.play();
      } else {
        song.pause();
      }
    },
    next() {
      songIndex++;
      if (songIndex >= Songs.length) songIndex = 0;
      this.play();
    },
    previous() {
      songIndex--;
      if (songIndex < 0) songIndex = Songs.length - 1;
      this.play();
    },
  },
  created() {
    this.play();
  },
  mounted() {
    window.addEventListener("message", function (e) {
      if (e.data.eventName === "loadProgress") {
        const per = parseInt(e.data.loadFraction * 100);
        this.percent = toString(`${Math.floor(per)}%`);
        this.progress = toString(`${per}%`);

        console.log(this.progress)
        console.log(this.progress)
      }
    });
  },
};
</script>

<style lang="scss" scoped>
.loadingscreen {
  height: 99.96%;
  width: 100%;
  top: 0vh;
  left: 0vh;
  position: absolute;
  background: linear-gradient(251.97deg, #00090c 0%, #001217 100%);
  .pattern {
    height: 100vmin;
    width: 116.0185vmin;
    top: 0vmin;
    left: 0vmin;
    position: absolute;
  }
  .music {
    position: absolute;
    width: 9.6296vmin;
    height: 5.3704vmin;
    left: 50%;
    transform: translateX(-50%);
    top: 1.2037vmin;
    .title {
      position: absolute;
      width: 100%;

      font-family: "Rubrica";
      font-size: 1.0185vmin;
      text-align: center;

      color: #ffffff;
    }
    .previous {
      position: absolute;
      left: 0%;
      right: 50.21%;
      top: 60%;
      height: 2.2222vmin;
      width: 2.2222vmin;
      transform: translateY(-50%);
      cursor: pointer;
    }
    .next {
      position: absolute;
      right: 0%;
      top: 60%;
      height: 2.2222vmin;
      width: 2.2222vmin;
      transform: translateY(-50%);
      cursor: pointer;
    }
    .play {
      position: absolute;
      width: 3.7037vmin;
      height: 3.7037vmin;
      top: 60%;
      left: 50%;
      transform: translate(-50%, -50%);
      cursor: pointer;
    }
  }
  .loading {
    position: absolute;
    width: 42.5926vmin;
    height: 6.8519vmin;
    left: 67.5926vmin;
    top: 90.8333vmin;
    .loadingText {
      position: absolute;
      width: 10.0926vmin;
      height: 3.7963vmin;
      left: 0vmin;

      font-family: "Rubrica";
      font-size: 2.963vmin;
      line-height: 3.7963vmin;
      text-align: center;

      color: #ffffff;
    }
    .progress {
      position: absolute;
      width: 10.0926vmin;
      height: 3.7963vmin;
      right: -2.3148vmin;

      font-family: "Rubrica";
      font-size: 2.963vmin;
      text-align: center;

      color: #ffffff;
    }
    .bar {
      position: absolute;
      width: 42.5926vmin;
      height: 3.4259vmin;
      bottom: 0vmin;
      .outline {
        border-radius: 3.5185vmin;
        position: absolute;
        width: 100%;
        height: 100%;
      }
      .progress {
        position: absolute;
        width: 40.2778vmin;
        height: 1.6667vmin;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);

        border-radius: 4.0741vmin;
        .maxProgress {
          position: absolute;
          background: #001820;
          width: 40.2778vmin;
          height: 1.6667vmin;
        }
        .curProgress {
          position: absolute;
          width: 100%;
          height: 1.6667vmin;
          left: 0vmin;
          top: 0vmin;

          background: linear-gradient(90deg, #00171f 0%, #00c2ff 100%);
          border-radius: 4.0741vmin;
        }
      }
    }
  }
  .center {
    animation: zoom 3s infinite;
    aspect-ratio: 1;
    position: absolute;
    width: 33.1482vmin;
    height: 15.463vmin;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    .recovery {
      width: 100%;
      top: 1.8519vmin;
      position: absolute;
      font-family: "Rubrica";
      font-size: 8.8889vmin;
      text-align: center;

      color: #00c2ff;
    }
    .gangwar {
      width: 33.0556vmin;
      height: 9.3519vmin;
      top: 47%;
      left: 50%;
      transform: translate(-50%, -50%);
      position: absolute;
    }
  }
}

@keyframes zoom {
  0% {
    transform: translate(-50%, -50%) scale(1);
  }
  50% {
    transform: translate(-50%, -50%) scale(1.2);
  }
  100% {
    transform: translate(-50%, -50%) scale(1);
  }
}
</style>