const { src, dest, series, parallel, watch } = require("gulp");
const postcss = require("gulp-postcss");
const { exec } = require("child_process");
const { promisify } = require("util");
const rmdir = promisify(require("fs").rmdir);

const cssGlob = "./src/css/**/*.css";
const imgGlob = "./src/img/**/*.*";

function clean() {
  return rmdir("./dist", { recursive: true });
}

function css() {
  return src(cssGlob).pipe(postcss()).pipe(dest("./dist/css"));
}

function img() {
  return src(imgGlob).pipe(dest("./dist/img"));
}

function js(cb) {
  exec("rollup -c", (err, stdout, stderr) => {
    if (stdout) console.log(stdout);
    if (stderr) console.log(stderr);
    cb(err);
  });
}

function watchAll() {
  watch(cssGlob, { ignoreInitial: false }, css);
  watch(imgGlob, { ignoreInitial: false }, img);
  watch("./src/js/**/*.js", { ignoreInitial: false }, js);
}

exports.css = css;
exports.img = img;
exports.js = js;
exports.clean = clean;

exports.watch = series(clean, watchAll);
exports.default = series(clean, parallel(css, img, js));
