
<template>
  <div class="chatMessage">
    <span
      >[<span class="group">{{ data.group }}</span
      >] {{ data.user }}: {{ data.message }}</span
    >
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
          group: "USER",
          color: "#00C2FF",
          user: "user",
          message: "Placeholder",
        };
      },
    },
  },
};
</script>
  
  <style lang="scss" scoped>
.chatMessage {
  position: relative;
  width: 100%;
  height: auto;
  min-height: 23px;
  span {
    font-family: "Gilroy-Regular";
    font-size: 14px;
    color: white;
    .group {
      color: v-bind("data.color");
      font-family: "Gilroy-Bold";
    }
  }
}
</style>