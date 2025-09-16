// ==UserScript==
// @name         target blank
// @namespace    http://tampermonkey.net/
// @version      2025-08-13
// @description  try to take over the world!
// @author       You
// @include      /^https?:\/\/([^\/]+\.)?github\.[^\/]+\/.*/
// @include      /^https?:\/\/([^\/]+\.)?(?:githubusercontent|githubassets|githubapp|githubstatus)\.[^\/]+\/.*/
// @include      /^https?:\/\/([^\/]+\.)?google\.[^\/]+\/.*/
// @icon         https://www.google.com/s2/favicons?sz=64&domain=userscript.zone
// @grant        none
// ==/UserScript==

(function () {
  "use strict";
  const aTags = document.getElementsByTagName("a");
  for (let i = 0; i < aTags.length; i++) {
    aTags[i].setAttribute("target", "_blank");
  }
  // Your code here...
})();
