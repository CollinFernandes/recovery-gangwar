<template>
  <div class="vehicle" @click="select">
    <div class="background"></div>
    <img class="arrow" src="images/arrow.png" />
    <img class="bars" src="images/garageBars.png" />
    <span class="name">{{ name }}</span>
    <span class="level">LVL {{ level }}</span>
    <img class="icon" :src="icon" />
    <img class="locked" src="images/lock.png" v-if="isLocked" />
  </div>
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      required: true,
    },
    level: {
      type: Number,
      required: true,
    },
    icon: {
      type: String,
      required: true,
    },
    isLocked: {
      type: Boolean,
      required: true,
    },
  },
  methods: {
    select() {
      if (!this.isLocked) {
        this.$emit("spawn", this.name);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.vehicle {
  width: 240px;
  height: 145px;
  border-radius: 2px;
  float: left;
  margin-right: 7.5px;
  margin-left: 7.5px;
  margin-bottom: 18px;
  cursor: pointer;
  .background {
    background: #000a0e;
    width: 240px;
    height: 145px;
    position: absolute;
  }
  .bars {
    width: 240px;
    height: 145px;
    position: absolute;
  }
  .arrow {
    position: absolute;
    margin-top: 3px;
    margin-left: 0px;
  }
  .name {
    position: absolute;
    font-family: "Rubrica";
    font-size: 14px;
    line-height: 13px;
    color: #ffffff;
    margin-top: 5px;
    margin-left: 15px;
  }
  .level {
    position: absolute;
    margin-top: 17px;
    margin-left: 15px;
    font-family: "Rubrica";
    font-size: 14px;
    line-height: 13px;
    color: #00c2ff;
  }
  .icon {
    position: relative;
    width: 132px;
    height: 74.32px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  .locked {
    width: 65px;
    height: 65px;
    position: absolute;
    margin-top: 35px;
    margin-left: -45px;
  }
}
</style>