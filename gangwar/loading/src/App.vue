<template>
  <div>
    <Loadingscreen />
  </div>
</template>

<script>
import Loadingscreen from "./interfaces/Loadingscreen.vue";

export default {
  name: "App",
  components: {
    Loadingscreen,
  },
  data() {
    return {};
  },
};
</script>

<style lang="scss">
* {
  margin: 0vh;
  overflow: hidden;
}
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@100..900&family=League+Spartan:wght@100..900&display=swap");

#app {
  user-select: none;
  font-family: "Montserrat-Bold", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: white;
  overflow: hidden;
  top: 0vh;
  left: 0vh;
}

@font-face {
  font-family: "Norms-Bold";
  src: url("../public/fonts/TTNormsPro.otf");
}
@font-face {
  font-family: "Druk";
  src: url(../public/fonts/DrukCyr-Medium.ttf);
}
@font-face {
  font-family: "Montserrat-Bold";
  src: url("../public/fonts/Montserrat-Bold.a8958d1a.ttf");
}
@font-face {
  font-family: "Montserrat-Medium";
  src: url("../public/fonts/Montserrat-Medium.50ba2624.ttf");
}
@font-face {
  font-family: "Montserrat-SemiBold";
  src: url("../public/fonts/Montserrat-SemiBold.39bc7b11.ttf");
}
@font-face {
  font-family: "RegularM";
  src: url("../public/fonts/MonumentExtended-Regular.otf");
}
@font-face {
  font-family: "OxaniumExtra";
  src: url("../public/fonts/Oxanium-ExtraBold.ttf");
}
@font-face {
  font-family: "OxaniumMedium";
  src: url("../public/fonts/Oxanium-Medium.ttf");
}
@font-face {
  font-family: "Regular";
  src: url("../public/fonts/PPMonumentExtended-Regular.ttf");
}
@font-face {
  font-family: "Medium";
  src: url("../public/fonts/PPMonumentExtended-Medium.ttf");
}
@font-face {
  font-family: "Book";
  src: url("../public/fonts/PPMonumentExtended-Book.ttf");
}

@font-face {
  font-family: "Gilroy-Bold";
  src: url("../public/fonts/Gilroy-Bold.ttf");
}

@font-face {
  font-family: "Gilroy-Medium";
  src: url("../public/fonts/Gilroy-Medium.ttf");
}

@font-face {
  font-family: "Gilroy-Semibold";
  src: url("../public/fonts/Gilroy-Semibold.ttf");
}

@font-face {
  font-family: "Gilroy-Regular";
  src: url("../public/fonts/Gilroy-Regular.otf");
}

@font-face {
  font-family: "Rubrica";
  src: url(../public/fonts/rubrica.ttf);
}

@font-face {
  font-family: "Monument Extended";
  src: url("../public/fonts/MonumentExtended-Regular.otf");
}

@font-face {
  font-family: "Brothership";
  src: url("../public/fonts/brothership.regular.ttf");
}

@font-face {
  font-family: "Akrobat";
  src: url("../public/fonts/Akrobat-Regular.otf");
}

@font-face {
  font-family: "Druk Cyr";
  src: url("../public/fonts/DrukCyr-Bold.ttf");
}

@font-face {
  font-family: "TT Norms Pro";
  src: url("../public/fonts/TTNormsPro.otf");
}

@font-face {
  font-family: "Jarvitts";
  src: url("../public/fonts/Jarvitts\ Free.ttf");
}
</style>./interfaces/hud.vue
