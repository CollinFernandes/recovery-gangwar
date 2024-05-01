<template>
  <div class="item" @click="click()">
    <img class="pattern" src="images/piecePattern.png" />
    <span class="piece">{{ clothe.label }}</span>
  </div>
</template>
  
  <script>
import { fetchNui } from "@/utils";

export default {
  props: {
    clothe: {
      type: Object,
      required: true,
    },
    type: {
      type: String,
      required: true,
    },
  },
  methods: {
    click() {
      fetchNui("selectPiece", { piece: this.clothe, type: this.type });
    },
  },
};
</script>
  <style lang="scss" scoped>
.item {
  width: 325px;
  height: 54px;
  position: relative;
  background: linear-gradient(91.58deg, #002835 0%, #001921 54%);
  border-radius: 3px;
  position: relative;
  opacity: 0.6;
  transition: 0.2s ease;
  margin-bottom: 20px;
  cursor: pointer;
  .pattern {
    right: 0px;
    position: absolute;
  }
  .piece {
    position: absolute;
    width: 100%;
    font-family: "Akrobat";
    font-size: 24px;
    text-align: center;
    top: 50%;
    transform: translateY(-50%);
    text-transform: uppercase;
    color: #ffffff;
  }
  &:hover {
    opacity: 1;
  }
}
</style>