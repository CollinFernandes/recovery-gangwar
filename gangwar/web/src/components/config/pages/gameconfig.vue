<template>
  <transition>
    <div class="gameconfig" v-if="showed">
      <div class="weathers">
        <weatherItem
          v-for="(weather, index) in weatherTypes"
          :key="index"
          :weather="weather"
          @toggleWeather="toggleWeather(weather)"
        />
      </div>
    </div>
  </transition>
</template>

<script>
import weatherItem from "@/components/config/weatherItem.vue";
import { Sound } from "@/Sound";
export default {
  components: {
    weatherItem,
  },
  props: {
    showed: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {
      weatherTypes: [
        {
          name: "Sunny",
          image: "images/config/sun.png",
          active: false,
        },
        {
          name: "Rainy",
          image: "images/config/rain.png",
          active: false,
        },
        {
          name: "Snowy",
          image: "images/config/snow.png",
          active: false,
        },
      ],
    };
  },
  methods: {
    toggleWeather(weather) {
      this.weatherTypes.forEach((weatherType) => {
        if (weatherType.name === weather.name) {
          if (weatherType.active === false) {
            weatherType.active = !weatherType.active;
            Sound("notification.wav");
          }
        } else {
          weatherType.active = false;
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.gameconfig {
  width: 83.1481vmin;
  height: 54.3519vmin;
  .weathers {
    position: absolute;
    width: 99.6%;
    height: 37.963vmin;
    top: 45%;
    transform: translateY(-50%);
    overflow: hidden;
    white-space: nowrap;
    overflow-y: hidden;
    overflow-x: auto;
  }
}

.weathers::-webkit-scrollbar {
  height: 0.1852vmin;
}

.weathers::-webkit-scrollbar-track {
  background-color: #001217;
}

.weathers::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.weathers::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>