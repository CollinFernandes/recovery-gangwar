<template>
    <div class="type" @click="selected()">
      <img class="icon" :src="icon" />
      <span class="name">{{ name }}</span>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      name: {
        type: String,
        required: true,
      },
      icon: {
        type: String,
        required: true,
      },
    },
    methods: {
      selected() {
          this.$emit('selected', this.name)
      },
    },
  };
  </script>
  
  <style lang="scss" scoped>
  .type {
    float: left;
    width: 141px;
    height: 141px;
    background: rgba($color: #00c2ff, $alpha: 0.04);
    border-radius: 2px;
    position: relative;
    margin-right: 10.7px;
    margin-left: 10.7px;
    margin-bottom: 20px;
    transition: 0.2s ease;
    cursor: pointer;
    .icon {
      width: 60px;
      height: 60px;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      opacity: 0.5;
      transition: 0.2s ease;
      object-fit: contain;
    }
    .name {
      width: 100%;
      bottom: 8px;
      position: absolute;
      text-align: center;
      font-family: "Akrobat";
      font-size: 16px;
      color: #00c2ff;
      opacity: 0.5;
      transition: 0.2s ease;
      text-transform: uppercase;
    }
    &:hover {
      background: rgba($color: #00c2ff, $alpha: 0.1);
      .icon {
        opacity: 1;
      }
      .name {
        opacity: 1;
      }
    }
  }
  </style>