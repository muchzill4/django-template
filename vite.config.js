export default () => ({
  root: "static/",
  base: "/static/",
  build: {
    manifest: true,
    outDir: "dist",
    rollupOptions: {
      input: "static/main.js",
    },
  },
});
