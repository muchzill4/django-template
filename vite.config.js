const { resolve } = require("path");

export default () => ({
  root: resolve("./static/src"),
  base: "/static/",
  build: {
    manifest: true,
    outDir: resolve("./static/dist"),
    rollupOptions: {
      input: resolve("static/src/main.js"),
    },
  },
});
