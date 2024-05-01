<template>
  <transition>
    <div class="ffa" v-if="showed">
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
      <ffaItem />
    </div>
  </transition>
</template>

<script>
import ffaItem from "@/components/config/ffaItem.vue";

export default {
  components: {
    ffaItem,
  },
  props: {
    showed: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
};
</script>

<style lang="scss" scoped>
.ffa {
  position: absolute;
  width: 78.8889vmin;
  height: 43.75vmin;
  background: rgba($color: #000000, $alpha: 0.24);
  border-radius: 0.6481vmin;
  overflow-y: auto;
}

.ffa::-webkit-scrollbar {
  width: 0vmin;
}

.ffa::-webkit-scrollbar-track {
  background-color: #001217;
}

.ffa::-webkit-scrollbar-thumb {
  background-color: #00c2ff;
  border-radius: 0.4vh;
}

.ffa::-webkit-scrollbar-thumb:hover {
  background-color: #0095c7;
}
</style>