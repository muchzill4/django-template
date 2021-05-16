import "unpoly";
import { render } from "timeago.js";

function initTimeago() {
  const elements = document.querySelectorAll("[data-timeago]");
  if (elements.length) {
    render(elements);
  }
}

window.addEventListener("DOMContentLoaded", () => {
  initTimeago();
});

document.addEventListener("up:fragment:inserted", () => {
  initTimeago();
});
