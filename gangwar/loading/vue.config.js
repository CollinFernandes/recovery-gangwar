const { defineConfig } = require('@vue/cli-service');
module.exports = defineConfig({
    transpileDependencies: true,
    outputDir: './dist',
    productionSourceMap: false,
    publicPath: './',
});