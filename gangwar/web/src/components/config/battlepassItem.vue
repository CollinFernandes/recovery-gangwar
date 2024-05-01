<template>
  <div class="battlepassItem">
    <img class="background" src="images/battlepassItemBackground.png" />
    <img
      class="levelBackground"
      src="images/battlepassItemLevelBackground.png"
    />
    <span class="level">{{ data.level }}</span>
    <span class="type"
      >[{{ data.type }}] <span class="name">{{ data.name }}</span></span
    >
    <img class="icon" :src="data.icon" />
  </div>
</template>

<script>
export default {
  props: {
    data: {
      type: Object,
      required: true,
      default() {
        return {
          level: 0,
          type: "FREE",
          name: "WEAPON_PISTOL",
          icon: "images/weapons/weapon_pistol.png",
        };
      },
    },
  },
};
</script>

<style lang="scss" scoped>
.battlepassItem {
  display: inline-block;
  position: relative;
  width: 8.5185vmin;
  height: 12.8241vmin;
  margin-left: 0.5556vmin;
  margin-right: 0.5556vmin;
  .background {
    position: absolute;
    width: 8.5185vmin;
    height: 9.3519vmin;
    top: 0vmin;
    left: 0vmin;
  }
  .levelBackground {
    width: 4.537vmin;
    height: 4.537vmin;
    left: 50%;
    bottom: 0vmin;
    transform: translateX(-50%);
    position: absolute;
  }
  .level {
    position: absolute;

    font-family: "Akrobat";
    font-weight: 900;
    font-size: 1.3889vmin;
    text-align: center;
    color: #ffffff;
    width: 3.1481vmin;
    bottom: 1.5741vmin;
    left: 2.5926vmin;
  }
  .type {
    position: absolute;

    font-family: "Akrobat";
    font-size: 0.6481vmin;

    color: #00c2ff;
    width: 100%;
    text-align: center;
    top: 0.5556vmin;
  }
  .name {
    color: #ffffff;
  }
  .icon {
    width: 7.5926vmin;
    height: 7.5926vmin;
    object-fit: contain;
    position: absolute;
    left: 50%;
    top: 1.3889vmin;
    transform: translateX(-50%);
  }
}
</style>