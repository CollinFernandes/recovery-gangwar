<template>
  <div class="weather" @click="toggle()">
    <div class="background"></div>
    <img class="image" :src="weather.image" />
    <span class="name">{{ weather.name }}</span>
    <span class="name2">Wetteranpassung</span>
    <div
      class="toggle"
      :style="{
        background: this.weather.active ? '#66FF63' : 'rgba(0, 0, 0, 0.29)',
        boxShadow: this.weather.active
          ? '0vmin 0vmin 0.5833vmin rgba(102, 255, 99, 0.5)'
          : '',
      }"
    ></div>
  </div>
</template>

<script>
export default {
  props: {
    weather: {
      type: Object,
      required: true,
    },
  },
  methods: {
    toggle() {
      this.$emit("toggleWeather", this.weather);
    },
  },
};
</script>

<style lang="scss" scoped>
.weather {
  cursor: pointer;
  display: inline-block;
  margin-bottom: 0.463vmin;
  border-radius: 0.463vmin;
  position: relative;
  width: 25.1852vmin;
  height: 37.3148vmin;
  margin-left: 1.8981vmin;
  margin-left: 1.8981vmin;
  .background {
    position: absolute;
    width: 100%;
    height: 100%;
    background: #000;
  }
  .toggle {
    position: absolute;
    top: 0.5556vmin;
    right: 0.463vmin;
    width: 1.8519vmin;
    height: 1.8519vmin;
    border-radius: 0.1852vmin;
    background: rgba(0, 0, 0, 0.53);
    transition: background 0.3s, box-shadow 0.3s;
  }
  .image {
    user-select: none;
    position: absolute;
    width: 100%;
    height: 100%;
    object-fit: fill;
    opacity: 0.3;
    transition: all 0.3s ease;
    &:hover {
      transform: scale(1.1);
      opacity: 1;
    }
  }
  .name {
    text-transform: uppercase;
    position: absolute;
    color: #fff;
    text-align: center;
    text-shadow: 0vmin 0vmin 0.3704vmin #000;
    font-family: Rubrica;
    font-size: 2.2222vmin;
    left: 0.6481vmin;
    bottom: 0.8333vmin;
  }
  .name2 {
    position: absolute;
    color: #00c2ff;
    text-align: center;
    text-shadow: 0vmin 0vmin 0.3704vmin #000;
    font-family: "Jarvitts";
    font-size: 2.2222vmin;
    left: 1.1111vmin;
    bottom: 0.6481vmin;
  }
}
</style>