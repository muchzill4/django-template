import glob from "glob";
import nodeResolve from "@rollup/plugin-node-resolve";
import { terser } from "rollup-plugin-terser";

const plugins = [nodeResolve()];

const productionPlugins = [terser()];

module.exports = {
  input: glob.sync("src/js/bundles/*.js"),
  output: {
    dir: "dist/js",
  },
  plugins: [
    ...plugins,
    ...(process.env.NODE_ENV === "production" ? productionPlugins : []),
  ],
  moduleContext: {
    "node_modules/unpoly/dist/unpoly.js": "window",
  },
};
