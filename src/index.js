import './css/main.css';
import { Elm } from './Main.elm';
import main from './img/main.jpg';
import code from './img/code.jpg';
import keyboard from './img/keyboard.jpg';
import cv from './img/cv.pdf';

import * as serviceWorker from './serviceWorker';

Elm.Main.init({
  flags: generateFlags(),
  node: document.getElementById('root')
});

// Generate flags to send to our Elm app on intialization
function generateFlags() {
  return {
    images: {
      main,
      code,
      keyboard,
      cv,
    }
  };
}

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
