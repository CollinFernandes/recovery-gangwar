<template>
  <transition>
    <div class="garage" v-if="showed">
      <img class="background" src="images/garagePattern.png" />
      <span class="header">RECOVERY</span>
      <span class="subheader">GARAGE</span>
      <div class="vehicles">
        <Vehicle
          v-for="(vehicle, index) in vehicles"
          :key="index"
          :icon="vehicle.icon"
          :name="vehicle.name"
          :isLocked="vehicle.isLocked"
          :level="vehicle.level"
          @spawn="spawnVehicle"
        />
      </div>
    </div>
  </transition>
</template>

<script>
import Vehicle from "../components/Vehicle.vue";
import { fetchNui } from "../utils";
export default {
  components: {
    Vehicle,
  },
  data() {
    return {};
  },
  methods: {
    spawnVehicle(name) {
      fetchNui("parkOut", { name: name });
    },
  },
  props: {
    showed: {
      type: Boolean,
      required: true,
    },
    vehicles: {
      type: Array,
      required: true,
      default() {
        [
          {
            name: "schafter5",
            label: 'Schafter V12',
            icon: "images/vehicles/schafter.png",
            isLocked: false,
            level: 1,
          },
        ];
      },
    },
  },
};
</script>

<style lang="scss" scoped>
.garage {
  width: 1304px;
  height: 744px;
  background: linear-gradient(251.97deg, #00090c 0%, #001217 100%);
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 2px;
  .background {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;
  }
  .header {
    position: absolute;
    top: 9px;
    left: 15px;
    font-family: "Rubrica";
    font-size: 36px;
    line-height: 46px;
    color: #ffffff;
  }
  .subheader {
    position: absolute;
    top: 30px;
    left: 61px;
    font-family: "Brothership";
    font-style: normal;
    font-weight: 400;
    font-size: 24px;
    line-height: 34px;

    color: #00c2ff;

    text-shadow: 0px 0px 4px #000000;
  }
  .vehicles {
    width: 1021px;
    height: 634px;
    top: 71px;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    overflow-y: auto;
  }
}

.vehicles::-webkit-scrollbar {
  width: 1px;
}

.vehicles::-webkit-scrollbar-track {
  background-color: #001217;
}

.vehicles::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.vehicles::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>