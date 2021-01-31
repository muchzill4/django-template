import nodeResolve from "@rollup/plugin-node-resolve";
import { terser } from "rollup-plugin-terser";

const plugins = [nodeResolve()];

const productionPlugins = [terser()];

module.exports = {
  input: ["src/js/hello_world.js"],
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
