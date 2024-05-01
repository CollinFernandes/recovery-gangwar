<template>
  <div class="hud">
    <div class="upperRight">
      <span class="header">RECOVERY</span>
      <p class="subheader">GANGWAR</p>
      <div class="stats">
        <div class="stat">
          <img class="icon" src="images/kd.png" />
          <span class="text">KD</span>
          <span class="value">{{ kd }}</span>
        </div>
        <div class="stat">
          <img class="icon" src="images/kd.png" />
          <span class="text">KILLS</span>
          <span class="value">{{ kills }}</span>
        </div>
        <div class="stat">
          <img class="icon" src="images/kd.png" />
          <span class="text">DEATHS</span>
          <span class="value">{{ deaths }}</span>
        </div>
      </div>
      <div class="id">
        <img class="icon" src="images/id.png" />
        <span class="text">ID:</span>
        <span class="value">{{ id }}</span>
      </div>
      <div class="online">
        <img class="icon" src="images/online.png" />
        <span class="text">ONLINE:</span>
        <span class="value">24/2024</span>
      </div>
      <div class="time">
        <img class="timeIcon" src="images/time.png" />
        <span class="date">09.03.2024</span>
        <span class="time">12:48</span>
      </div>
    </div>
    <div class="upperRightGlow" />
    <div class="upperLeftGlow" />
    <div class="upperLeft">
      <span class="level">LVL: 13</span>
      <div class="progressContainer">
        <div class="progress"></div>
        <div class="progressActive"></div>
      </div>
      <span class="xp">25 / 3000</span>
    </div>
    <div class="speedo">
      <img class="speedobg" src="images/speedo.png" />
      <span class="kmh">KMH</span>
      <span class="value">266</span>
    </div>
    <!-- <div class="notifyContainer">
      <div class="notify">
        <img src="images/information.png" class="icon" />
        <span class="header">INFORMATION</span>
        <span class="description"
          >this is an asd asd asdadsasdas test notification to test if it works well.</span
        >
      </div>
      <div class="notify">
        <img src="images/information.png" class="icon" />
        <span class="header">INFORMATION</span>
      </div>
    </div> -->
  </div>
</template>

<script>
import { addNuiListener, fetchNui } from '../utils'

export default {
  name: "hud",
  mounted() {
    addNuiListener('updateId', (data) => {
      console.log(data.id)
      this.id = data.id
    })
    addNuiListener('updateStats', (data) => {
      this.kills = data.kills
      this.deaths = data.deaths
      this.kd = this.kills / this.deaths
    })
  },
  data() {
    return {
      id: 0,
      kills: 0,
      deaths: 0,
      kd: 0,
    }
  }
};  
</script>

<style lang="scss" scoped>
.hud {
  height: 99.96%;
  width: 100%;
  top: 0vh;
  left: 0vh;
  position: absolute;
  // .notifyContainer {
  //   width: 145px;
  //   top: 153px;
  //   right: 10px;
  //   position: absolute;
  //   .notify {
  //     position: relative;
  //     border: 1px solid red;
  //     margin-bottom: 10px;
  //     min-height: 62px;
  //     width: 140px;
  //     .icon {
  //       width: 40px;
  //       height: 40px;
  //       position: relative;
  //       top: 10px;
  //       margin-left: 100px;
  //     }
  //     .header {
  //       position: relative;
  //       top: -44px;
  //       left: 30px;
  //       font-family: "Akrobat";
  //       font-size: 15px;
  //       text-align: right;

  //       color: #00c2ff;
  //       text-shadow: 0px 0px 4px #00c2ff;
  //     }
  //     .description {
  //       font-family: "Akrobat";
  //       font-size: 14px;
  //       color: #ffffff;
  //       width: 195px;
  //       text-align: left;
  //     }
  //   }
  // }
  .upperRight {
    width: 35.0926vh;
    height: 18.5185vh;
    position: absolute;
    right: 0vh;
    top: 0vh;
    .header {
      position: absolute;
      height: 3.7963vh;
      right: 1vh;
      top: 1vh;

      font-family: "Rubrica";
      font-style: normal;
      font-weight: 400;
      font-size: 44px;
      line-height: 3.7963vh;

      color: #ffffff;
    }
    .subheader {
      position: absolute;
      right: 5vh;
      top: 2.4vh;

      font-family: "Brothership";
      font-size: 32px;
      line-height: 1.8;

      color: #00c2ff;

      text-shadow: 0vh 0vh 0.3704vh #000000;
    }
    .stats {
      // width: 21.1111vh;
      height: 3.8889vh;
      top: 6vh;
      right: -0.0407vh;
      position: absolute;
      .stat {
        position: relative;
        float: left;
        width: 50.0005px;
        height: 3.8vh;
        margin-right: 1.1111vh;
        .icon {
          width: 20.9998px;
          height: 20.9998px;
          top: 0.5556vh;
          right: 0vh;
          position: absolute;
        }
        .text {
          position: absolute;
          width: 2.2222vh;
          font-family: "Rubrica";
          font-size: 14.0002px;
          text-align: right;

          color: #ffffff;

          text-shadow: 0vh 0vh 0.7037vh #000000;
        }
        .value {
          position: absolute;
          width: 2.2222vh;
          height: 2.8519vh;
          top: 1.1667vh;
          font-family: "Rubrica";
          font-size: 1.4815vh;
          line-height: 1.8519vh;
          text-align: right;

          color: #00c2ff;

          text-shadow: 0vh 0vh 0.7037vh #000000;
        }
      }
    }
    .id {
      position: absolute;
      width: 50.0005px;
      height: 3.8vh;
      top: 1.0185vh;
      right: 190.0397px;
      .icon {
        width: 20.9998px;
        height: 20.9998px;
        top: 0.5556vh;
        right: 0vh;
        position: absolute;
      }
      .text {
        position: absolute;
        left: 1.7vh;

        font-family: "Rubrica";
        font-size: 14.0002px;
        text-align: left;

        color: #ffffff;

        text-shadow: 0vh 0vh 0.7037vh #000000;
      }
      .value {
        position: absolute;
        width: 2.563vh;
        height: 1.8519vh;
        top: 1.3667vh;
        font-family: "Rubrica";
        font-size: 14.0002px;
        line-height: 1.8519vh;
        text-align: right;

        color: #00c2ff;

        text-shadow: 0vh 0vh 0.7037vh #000000;
      }
    }
    .online {
      position: absolute;
      width: 70.0005px;
      height: 3vh;
      top: 1.0185vh;
      right: 23vh;
      .icon {
        width: 20.9998px;
        height: 20.9998px;
        top: 0.5556vh;
        right: 0vh;
        position: absolute;
      }
      .text {
        position: absolute;
        right: 20px;
        font-family: "Rubrica";
        font-size: 14.0002px;
        text-align: left;

        color: #ffffff;

        text-shadow: 0vh 0vh 0.7037vh #000000;
      }
      .value {
        position: absolute;
        width: 4.163vh;
        height: 1.8519vh;
        top: 1.3667vh;
        font-family: "Rubrica";
        font-size: 14.0002px;
        line-height: 1.8519vh;
        text-align: right;

        color: #00c2ff;

        text-shadow: 0vh 0vh 0.7037vh #000000;
      }
    }
    .time {
      width: 100px;
      height: 50px;
      position: absolute;
      top: 9.5vh;
      right: 1vh;
      .timeIcon {
        top: 1.5px;
        right: 0px;
        width: 2.5926vh;
        height: 2.5926vh;
        position: absolute;
      }
      .date {
        position: absolute;
        width: 4.8148vh;
        height: 1.8519vh;
        left: 1.5926vh;
        font-family: "Rubrica";
        font-size: 1.4815vh;
        color: #ffffff;
      }
      .time {
        position: absolute;
        width: 5.2074vh;
        height: 1.8519vh;
        left: 1vh;
        top: 1.3963vh;
        text-align: right;
        font-family: "Rubrica";
        font-size: 1.4815vh;
        color: #00c2ff;
      }
    }
  }
  .upperRightGlow {
    right: -5vw;
    top: -5vw;
    border: 0.0926vh solid red;
    position: absolute;
    border-radius: 33.3333vh;
    width: 16.6667vh;
    height: 16.6667vh;
    background: rgba(0, 194, 255, 0.75);
    filter: blur(12.6157vh);
  }
  .upperLeft {
    position: absolute;
    width: 10.963vh;
    height: 5.7778vh;
    .level {
      font-family: "Rubrica";
      font-size: 24px;
      position: absolute;
      left: 5px;
      top: 4px;
    }
    .progressContainer {
      position: absolute;
      width: 92px;
      height: 4px;
      left: 4px;
      top: 30px;
      .progress {
        border-radius: 14px;
        position: absolute;
        width: 100%;
        height: 4px;
        background-color: #00141b;
      }
      .progressActive {
        border-radius: 14px;
        position: absolute;
        width: 100%;
        height: 4px;
        background: linear-gradient(90deg, #003c4f 0%, #00c2ff 78.19%);
      }
    }
    .xp {
      position: absolute;
      top: 33px;
      width: 95px;
      text-align: right;

      font-family: "Akrobat";
      font-size: 12px;
      letter-spacing: 0.03em;

      color: #ffffff;

      text-shadow: 0px 0px 3.3px #ffffff, 0px 0px 3.3px #ffffff;
    }
  }
  .upperLeftGlow {
    left: -5vw;
    top: -5vw;
    border: 0.0926vh solid red;
    position: absolute;
    border-radius: 33.3333vh;
    width: 16.6667vh;
    height: 16.6667vh;
    background: rgba(0, 194, 255, 0.75);
    filter: blur(12.6157vh);
  }
  .speedo {
    width: 9.6296vh;
    height: 3.1481vh;
    position: absolute;
    left: 50%;
    bottom: 1.2963vh;
    border-radius: 0.1852vh;
    .speedobg {
      position: absolute;
      width: 9.6296vh;
      height: 3.1481vh;
    }
    .kmh {
      position: absolute;
      width: 97%;
      text-align: center;
      height: 1.2037vh;
      font-size: 1.4815vh;
      font-family: "Rubrica";
      color: #ffffff;
      bottom: 0.4778vh;
    }
    .value {
      top: -0.0926vh;
      position: absolute;
      width: 98%;
      text-align: center;
      height: 1.9444vh;

      font-family: "Rubrica";
      font-size: 1.4815vh;
      line-height: 1.9444vh;
      color: #00c2ff;
    }
  }
}
</style>