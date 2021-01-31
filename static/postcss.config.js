const plugins = [
  require("postcss-import"),
  require("autoprefixer"),
  require("tailwindcss"),
];

const productionPlugins = [require("cssnano")];

module.exports = {
  plugins: [
    ...plugins,
    ...(process.env.NODE_ENV === "production" ? productionPlugins : []),
  ],
};
