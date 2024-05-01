<template>
  <div class="frakpick">
    <img src="images/pattern.png" class="pattern" />
    <div class="header">
      <img src="images/logo.png" class="headerlogo" />
      <span class="headertext">RECOVERY</span>
      <span class="subheader">FRAKAUSWAHL</span>
    </div>
    <div class="items">
      <Frakitem
        v-for="(team, index) in teams"
        :key="index"
        :colors="team.colors.hex"
        :icon="team.icon"
        :name="team.name"
        :players="team.players"
        :index="index"
        @select="select"
      />
    </div>
  </div>
</template>

<script>
import Frakitem from "../components/Frakitem.vue";
import { addNuiListener, fetchNui } from "../utils";

export default {
  name: "Frakpick",
  components: {
    Frakitem,
  },
  props: {
    teams: {
      type: Array,
      required: true,
      default() {
        return [];
      },
    },
  },
  methods: {
    select(name) {
      fetchNui("selectFaction", { name: name });
    },
  },
};
</script>

<style lang="scss" scoped>
.frakpick {
  height: 99.96%;
  width: 100%;
  top: 0vh;
  left: 0vh;
  position: absolute;
  background: linear-gradient(251.97deg, #00090c 0%, #001217 100%), #d9d9d9;
  .pattern {
    position: absolute;
    width: 100%;
    height: 100%;
  }
  .header {
    position: absolute;
    width: 12.5926vh;
    height: 12.5vh;
    top: 3.5185vh;
    left: 50%;
    transform: translateX(-50%);
    .headerlogo {
      position: absolute;
      top: 0vh;
      left: 50%;
      transform: translateX(-50%);
      width: 6.0185vh;
      height: 5.0926vh;
    }
    .headertext {
      position: absolute;
      margin-top: 6.2037vh;
      left: 50%;
      transform: translateX(-50%);
      font-family: "Rubrica";
      font-size: 4.4444vh;
      color: #00c2ff;
    }
    .subheader {
      position: absolute;
      margin-top: 10.5556vh;
      width: 100%;
      left: 0.2778vh;
      text-align: center;
      font-family: "Rubrica";
      font-size: 1.4815vh;
      color: #fff;
      letter-spacing: 0.6296vh;
    }
  }
  .items {
    position: absolute;
    width: 134.2593vh;
    height: 62.3148vh;
    left: 50%;
    top: 21.6667vh;
    transform: translateX(-50%);
    overflow-y: auto;
  }
}

.items::-webkit-scrollbar {
  width: 1px;
}

.items::-webkit-scrollbar-track {
  background-color: #001217;
}

.items::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.items::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>