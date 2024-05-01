<template>
  <transition>
    <div class="clothing" v-if="showed">
      <div class="glow1"></div>
      <div class="left">
        <div class="top">
          <img class="pattern" src="images/radialPattern.png" />
          <span class="header">FRAKTIONS KLEIDUNG</span>
        </div>
        <div class="bottom">
          <img class="pattern" src="images/clothingPattern.png" />
          <div class="pieces">
            <clothingType
              v-for="(type, index) in clothingTypes"
              :key="index"
              :icon="type.icon"
              :name="type.name"
              @click="selectType(type.name)"
            />
          </div>
        </div>
      </div>
      <div class="right">
        <div class="top">
          <img class="pattern" src="images/radialPattern.png" />
          <span class="header">KLEIDUNGS AUSWAHL</span>
        </div>
        <div class="bottom">
          <img class="pattern" src="images/clothingPattern.png" />
          <div class="pieces">
            <clothingItem class="item" v-for="(clothe, index) in loadingClothes" :key="index" :clothe="clothe" :type="selectedType" />
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>
  
<script>
import clothingType from "@/components/clothingType.vue";
import clothingItem from "@/components/clothingItem.vue";

export default {
  components: {
    clothingType,
    clothingItem,
  },
  data() {
    return {
      loadingClothes: [],
      selectedType: '',
    };
  },
  methods: {
    selectType(name) {
      this.selectedType = name
      this.loadingClothes = this.clothes[name];
    },
  },
  props: {
    showed: {
      type: Boolean,
      required: true,
    },
    clothingTypes: {
      type: Array,
      required: true,
      default() {
        [
          {
            name: "Mask",
            icon: "images/clothingTypes/mask.png",
          },
          {
            name: "Torso",
            icon: "images/clothingTypes/torso.png",
          },
          {
            name: "Pants",
            icon: "images/clothingTypes/pants.png",
          },
          {
            name: "Shoes",
            icon: "images/clothingTypes/shoes.png",
          },
          {
            name: "Hats",
            icon: "images/clothingTypes/hat.png",
          },
          {
            name: "Glasses",
            icon: "images/clothingTypes/glasses.png",
          },
          {
            name: "Earrings",
            icon: "images/clothingTypes/earrings.png",
          },
          {
            name: "Chains",
            icon: "images/clothingTypes/chains.png",
          },
        ];
      },
    },
    clothes: {
      type: Array,
      required: true,
      default() {
        [
          
        ]
      },
    },
  },
};
</script>
  
  <style lang="scss" scoped>
.clothing {
  height: 99.96%;
  width: 100%;
  top: 0vh;
  left: 0vh;
  position: absolute;
  .glow1 {
    position: absolute;
    width: 1920px;
    height: 1080px;
    left: 0px;
    top: 0px;

    background: linear-gradient(
      270deg,
      #002430 0%,
      rgba(0, 61, 80, 0) 31.41%,
      rgba(0, 95, 125, 0) 74%,
      #002c39 100%
    );
  }
  .left {
    position: absolute;
    left: 119px;
    top: 50%;
    transform: translateY(-50%);
    height: 883px;
    width: 473px;
    .top {
      width: 473px;
      height: 63px;
      background: #001015;
      border-radius: 2px;
      margin-bottom: 18px;
      .pattern {
        right: 0px;
        position: absolute;
      }
      .header {
        position: absolute;
        width: 100%;
        top: 11px;

        font-family: "Rubrica";
        font-size: 32px;
        text-align: center;
        letter-spacing: 0.2em;
        color: #ffffff;
      }
    }
    .bottom {
      width: 473px;
      height: 802px;
      background: #001015;
      border-radius: 2px;
      .pattern {
        position: absolute;
        width: 100%;
        height: 100%;
      }
      .pieces {
        position: relative;
        height: 684px;
        width: 325px;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
      }
    }
  }
  .right {
    position: absolute;
    right: 97px;
    top: 50%;
    transform: translateY(-50%);
    height: 701px;
    width: 473px;
    .top {
      width: 473px;
      height: 63px;
      background: #001015;
      border-radius: 2px;
      margin-bottom: 18px;
      .pattern {
        right: 0px;
        position: absolute;
      }
      .header {
        position: absolute;
        width: 100%;
        top: 11px;

        font-family: "Rubrica";
        font-size: 32px;
        text-align: center;
        letter-spacing: 0.2em;
        color: #ffffff;
      }
    }
    .bottom {
      width: 473px;
      height: 620px;
      background: #001015;
      border-radius: 2px;
      .pattern {
        position: absolute;
        width: 100%;
        height: 100%;
      }
      .pieces {
        width: 340px;
        height: 498px;
        position: relative;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        overflow-y: auto;
        .item {
          left: 50%;
          transform: translateX(-50%);
        }
      }
    }
  }
}

.pieces::-webkit-scrollbar {
  width: 1px;
}

.pieces::-webkit-scrollbar-track {
  background-color: #001217;
}

.pieces::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.pieces::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>